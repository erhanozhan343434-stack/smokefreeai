import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:smokefree/core/config/purchases_ready_provider.dart';
import 'package:smokefree/features/paywall/billing_client.dart';
import 'package:smokefree/features/paywall/billing_catalog.dart';
import 'package:smokefree/features/paywall/paywall_analytics.dart';
import 'package:smokefree/features/paywall/premium_status_provider.dart';

final offeringsProvider = FutureProvider.autoDispose<Offerings>((ref) async {
  if (!ref.watch(purchasesReadyProvider)) {
    throw StateError('Billing is not initialized');
  }
  final client = ref.watch(billingClientProvider);
  final analytics = ref.read(paywallAnalyticsProvider);
  try {
    final offerings = await client.getOfferings();
    final packages = visiblePackages(offerings, defaultTargetPlatform);
    analytics.record('premium_packages_loaded', parameters: {
      'package_count': packages.length,
      'store_package_count': offerings.current?.availablePackages.length ?? 0,
    });
    return offerings;
  } on Object {
    analytics.record('premium_packages_failed');
    rethrow;
  }
},
  // Surface store errors immediately; the paywall provides an explicit retry.
  retry: (retryCount, error) => null,
);

enum PurchaseOutcome { purchased, cancelled, pending, notEntitled, busy }

/// One lock for every plan and Restore, including during the native store UI.
final paywallActionProvider = NotifierProvider<PaywallAction, bool>(PaywallAction.new);

class PaywallAction extends Notifier<bool> {
  @override
  bool build() => false;

  Future<PurchaseOutcome> purchase(Package package) async {
    if (state) return PurchaseOutcome.busy;
    if (!ref.read(purchasesReadyProvider)) {
      throw StateError('Billing is not initialized');
    }
    state = true;
    final analytics = ref.read(paywallAnalyticsProvider);
    final parameters = packageParameters(package);
    analytics.record('premium_purchase_started', parameters: parameters);
    try {
      final info = await ref.read(billingClientProvider).purchase(package);
      ref.invalidate(customerInfoProvider);
      final active = hasPremiumAccess(info);
      analytics.record(active ? 'premium_purchase_succeeded' : 'premium_purchase_unverified',
        parameters: parameters);
      return active ? PurchaseOutcome.purchased : PurchaseOutcome.notEntitled;
    } on PlatformException catch (error) {
      final code = PurchasesErrorHelper.getErrorCode(error);
      if (code == PurchasesErrorCode.purchaseCancelledError) {
        analytics.record('premium_purchase_cancelled', parameters: parameters);
        return PurchaseOutcome.cancelled;
      }
      if (code == PurchasesErrorCode.paymentPendingError) {
        analytics.record('premium_purchase_pending', parameters: parameters);
        return PurchaseOutcome.pending;
      }
      analytics.record('premium_purchase_failed', parameters: {...parameters, 'error_code': code.index});
      rethrow;
    } on Object {
      analytics.record('premium_purchase_failed', parameters: {...parameters, 'error_code': -1});
      rethrow;
    } finally {
      state = false;
    }
  }

  Future<CustomerInfo?> restore() async {
    if (state) return null;
    if (!ref.read(purchasesReadyProvider)) {
      throw StateError('Billing is not initialized');
    }
    state = true;
    final analytics = ref.read(paywallAnalyticsProvider);
    analytics.record('premium_restore_started');
    try {
      final info = await ref.read(billingClientProvider).restore();
      ref.invalidate(customerInfoProvider);
      analytics.record(hasPremiumAccess(info) ? 'premium_restore_succeeded' : 'premium_restore_empty');
      return info;
    } on Object {
      analytics.record('premium_restore_failed');
      rethrow;
    } finally {
      state = false;
    }
  }
}
