import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:smokefree/core/config/purchases_ready_provider.dart';
import 'package:smokefree/features/paywall/billing_catalog.dart';
import 'package:smokefree/features/paywall/billing_client.dart';
import 'package:smokefree/features/paywall/paywall_analytics.dart';
import 'package:smokefree/features/paywall/paywall_providers.dart';

import 'billing_flow_test.dart' as fixtures;

void main() {
  late fixtures.FakeBilling client;
  late List<String> events;
  late List<Map<String, Object>> parameters;
  late ProviderContainer container;
  setUp(() {
    client = fixtures.FakeBilling();
    events = [];
    parameters = [];
    container = ProviderContainer(overrides: [
      purchasesReadyProvider.overrideWithValue(true),
      billingClientProvider.overrideWithValue(client),
      paywallAnalyticsProvider.overrideWithValue(PaywallAnalytics(sender: (name, params) async {
        events.add(name); parameters.add(params);
      })),
    ]);
  });
  tearDown(() => container.dispose());

  test('confirmed entitlement emits started and succeeded once', () async {
    client.current = fixtures.info(true);
    await container.read(paywallActionProvider.notifier).purchase(fixtures.package);
    expect(events, ['premium_purchase_started', 'premium_purchase_succeeded']);
    expect(parameters.every((params) => params.keys.every(
      (key) => {'package_id', 'product_id', 'base_plan_id', 'error_code'}.contains(key))), isTrue);
  });
  test('unconfirmed access never emits purchase success', () async {
    await container.read(paywallActionProvider.notifier).purchase(fixtures.package);
    expect(events, ['premium_purchase_started', 'premium_purchase_unverified']);
  });
  for (final error in {
    PurchasesErrorCode.purchaseCancelledError: 'premium_purchase_cancelled',
    PurchasesErrorCode.paymentPendingError: 'premium_purchase_pending',
    PurchasesErrorCode.networkError: 'premium_purchase_failed',
  }.entries) {
    test('${error.key} has one distinct terminal event', () async {
      client.purchaseCall = () async => throw PlatformException(code: '${error.key.index}');
      try { await container.read(paywallActionProvider.notifier).purchase(fixtures.package); }
      on PlatformException { /* The UI handles non-cancellation errors. */ }
      expect(events, ['premium_purchase_started', error.value]);
    });
  }
  test('a failing Analytics backend cannot fail a purchase', () async {
    final analytics = PaywallAnalytics(sender: (_, __) async => throw StateError('synthetic'));
    final isolated = ProviderContainer(overrides: [
      purchasesReadyProvider.overrideWithValue(true), billingClientProvider.overrideWithValue(client),
      paywallAnalyticsProvider.overrideWithValue(analytics),
    ]);
    addTearDown(isolated.dispose);
    client.current = fixtures.info(true);
    expect(await isolated.read(paywallActionProvider.notifier).purchase(fixtures.package), PurchaseOutcome.purchased);
  });
  test('an unresponsive Analytics backend never delays checkout', () async {
    final hung = Completer<void>();
    final isolated = ProviderContainer(overrides: [
      purchasesReadyProvider.overrideWithValue(true), billingClientProvider.overrideWithValue(client),
      paywallAnalyticsProvider.overrideWithValue(PaywallAnalytics(sender: (_, __) => hung.future)),
    ]);
    addTearDown(isolated.dispose);
    client.current = fixtures.info(true);
    try {
      expect(await isolated.read(paywallActionProvider.notifier).purchase(fixtures.package)
          .timeout(const Duration(seconds: 1)), PurchaseOutcome.purchased);
    } finally { hung.complete(); }
  });
  test('restore emits empty or confirmed status from actual entitlement', () async {
    await container.read(paywallActionProvider.notifier).restore();
    expect(events, ['premium_restore_started', 'premium_restore_empty']);
    events.clear(); client.current = fixtures.info(true);
    await container.read(paywallActionProvider.notifier).restore();
    expect(events, ['premium_restore_started', 'premium_restore_succeeded']);
  });
  test('offering reports package load without treating it as a sale', () async {
    await container.read(offeringsProvider.future);
    expect(events, ['premium_packages_loaded']);
    expect(parameters.single['package_count'], 0);
  });
  test('offering failure emits one failure and stays a billing error', () async {
    client.offeringsCall = () async => throw StateError('synthetic');
    await expectLater(container.read(offeringsProvider.future), throwsA(isA<StateError>()));
    expect(events, ['premium_packages_failed']);
  });
  test('Android catalog accepts only confirmed premium product and base plans', () {
    const other = Package('other', PackageType.monthly,
      StoreProduct('other:monthly', '', '', 1, '₺1', 'TRY'),
      PresentedOfferingContext('test_offering', null, null));
    const data = Offerings({}, current: Offering('test_offering', '', {}, [fixtures.package, other]));
    expect(visiblePackages(data, TargetPlatform.android), [fixtures.package]);
    expect(visiblePackages(data, TargetPlatform.iOS), hasLength(2));
  });
}
