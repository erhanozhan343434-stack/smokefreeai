import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:smokefree/core/config/purchases_ready_provider.dart';
import 'package:smokefree/features/paywall/billing_client.dart';
import 'package:smokefree/features/paywall/premium_status_provider.dart';

final offeringsProvider = FutureProvider.autoDispose<Offerings>((ref) {
  if (!ref.watch(purchasesReadyProvider)) {
    throw StateError('Billing is not initialized');
  }
  return ref.watch(billingClientProvider).getOfferings();
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
    try {
      final info = await ref.read(billingClientProvider).purchase(package);
      ref.invalidate(customerInfoProvider);
      return hasPremiumAccess(info)
          ? PurchaseOutcome.purchased
          : PurchaseOutcome.notEntitled;
    } on PlatformException catch (error) {
      final code = PurchasesErrorHelper.getErrorCode(error);
      if (code == PurchasesErrorCode.purchaseCancelledError) {
        return PurchaseOutcome.cancelled;
      }
      if (code == PurchasesErrorCode.paymentPendingError) {
        return PurchaseOutcome.pending;
      }
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
    try {
      final info = await ref.read(billingClientProvider).restore();
      ref.invalidate(customerInfoProvider);
      return info;
    } finally {
      state = false;
    }
  }
}
