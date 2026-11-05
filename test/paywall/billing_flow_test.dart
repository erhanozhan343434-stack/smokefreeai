import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:smokefree/core/config/purchases_ready_provider.dart';
import 'package:smokefree/features/paywall/billing_client.dart';
import 'package:smokefree/features/paywall/paywall_providers.dart';
import 'package:smokefree/features/paywall/plan_details.dart';
import 'package:smokefree/features/paywall/premium_status_provider.dart';

const product = StoreProduct('test_yearly:annual', 'Test plan', 'Yearly', 100,
    '₺100', 'TRY', subscriptionPeriod: 'P1Y');
const package = Package('custom_year', PackageType.annual, product,
    PresentedOfferingContext('test_offering', null, null));
CustomerInfo info(bool active) {
  const entitlement = EntitlementInfo('test_access', true, true,
      '2026-01-01', '2026-01-01', 'test_yearly', true);
  return CustomerInfo(EntitlementInfos(
      active ? {'test_access': entitlement} : {},
      active ? {'test_access': entitlement} : {}),
      {}, [], [], [], '2026-01-01', 'synthetic-user', {}, '2026-01-01');
}

class FakeBilling extends BillingClient {
  CustomerInfo current = info(false);
  Future<CustomerInfo> Function()? purchaseCall;
  Future<CustomerInfo> Function()? infoCall;
  int purchases = 0;
  int restores = 0;
  final listeners = <CustomerInfoUpdateListener>[];
  @override
  Future<CustomerInfo> purchase(Package package) async {
    purchases++;
    return purchaseCall == null ? current : purchaseCall!();
  }
  @override
  Future<CustomerInfo> restore() async { restores++; return current; }
  @override
  Future<CustomerInfo> getCustomerInfo() async => infoCall == null ? current : infoCall!();
  @override
  void addListener(CustomerInfoUpdateListener listener) => listeners.add(listener);
  @override
  void removeListener(CustomerInfoUpdateListener listener) => listeners.remove(listener);
  void emit(bool active) {
    current = info(active);
    for (final listener in List<CustomerInfoUpdateListener>.of(listeners)) {
      listener(current);
    }
  }
}

void main() {
  late FakeBilling client;
  late ProviderContainer container;
  setUp(() {
    client = FakeBilling();
    container = ProviderContainer(overrides: [
      purchasesReadyProvider.overrideWithValue(true),
      billingClientProvider.overrideWithValue(client),
    ]);
  });
  tearDown(() => container.dispose());

  test('successful store call without entitlement is not Premium success', () async {
    expect(await container.read(paywallActionProvider.notifier).purchase(package),
        PurchaseOutcome.notEntitled);
    expect(container.read(paywallActionProvider), false);
  });
  test('active entitlement confirms success', () async {
    client.current = info(true);
    expect(await container.read(paywallActionProvider.notifier).purchase(package),
        PurchaseOutcome.purchased);
  });
  for (final entry in {
    PurchasesErrorCode.purchaseCancelledError: PurchaseOutcome.cancelled,
    PurchasesErrorCode.paymentPendingError: PurchaseOutcome.pending,
  }.entries) {
    test('${entry.key} is a distinct non-success outcome', () async {
      client.purchaseCall = () async => throw PlatformException(code: '${entry.key.index}');
      expect(await container.read(paywallActionProvider.notifier).purchase(package), entry.value);
      expect(container.read(paywallActionProvider), false);
    });
  }
  test('network failure releases shared lock and can be retried', () async {
    client.purchaseCall = () async => throw PlatformException(code: '${PurchasesErrorCode.networkError.index}');
    await expectLater(container.read(paywallActionProvider.notifier).purchase(package), throwsA(isA<PlatformException>()));
    expect(container.read(paywallActionProvider), false);
    client.purchaseCall = () async => info(true);
    expect(await container.read(paywallActionProvider.notifier).purchase(package), PurchaseOutcome.purchased);
  });
  test('second plan and Restore cannot race with a store purchase', () async {
    final pending = Completer<CustomerInfo>();
    client.purchaseCall = () => pending.future;
    final action = container.read(paywallActionProvider.notifier);
    final first = action.purchase(package);
    expect(container.read(paywallActionProvider), true);
    expect(await action.purchase(package), PurchaseOutcome.busy);
    expect(await action.restore(), isNull);
    expect(client.purchases, 1);
    expect(client.restores, 0);
    pending.complete(info(true));
    expect(await first, PurchaseOutcome.purchased);
    expect(container.read(paywallActionProvider), false);
  });
  test('restore uses actual store entitlement result', () async {
    expect(hasPremiumAccess((await container.read(paywallActionProvider.notifier).restore())!), false);
    client.current = info(true);
    expect(hasPremiumAccess((await container.read(paywallActionProvider.notifier).restore())!), true);
  });
  test('SDK updates change Premium status and listeners are removed', () async {
    final sub = container.listen(isPremiumProvider, (_, __) {});
    expect(await container.read(isPremiumProvider.future), false);
    client.emit(true);
    await Future<void>.delayed(Duration.zero);
    expect(await container.read(isPremiumProvider.future), true);
    client.emit(false);
    await Future<void>.delayed(Duration.zero);
    expect(await container.read(isPremiumProvider.future), false);
    expect(client.listeners, hasLength(1));
    sub.close();
    await container.pump();
    expect(client.listeners, isEmpty);
  });
  test('slow initial response cannot overwrite a newer customer update', () async {
    final slow = Completer<CustomerInfo>();
    client.infoCall = () => slow.future;
    container.listen(isPremiumProvider, (_, __) {});
    container.read(isPremiumProvider);
    client.emit(true);
    expect(await container.read(isPremiumProvider.future), true);
    slow.complete(info(false));
    await Future<void>.delayed(Duration.zero);
    expect(await container.read(isPremiumProvider.future), true);
  });
  test('unconfigured SDK does not break free access or invoke purchases', () async {
    final disabled = ProviderContainer(overrides: [
      purchasesReadyProvider.overrideWithValue(false),
      billingClientProvider.overrideWithValue(client),
    ]);
    addTearDown(disabled.dispose);
    expect(await disabled.read(isPremiumProvider.future), false);
    await expectLater(disabled.read(paywallActionProvider.notifier).purchase(package), throwsStateError);
    expect(client.purchases, 0);
    expect(client.listeners, isEmpty);
  });
  test('price period comes from store, never a hard-coded yearly price', () {
    expect(planDetails(product, 'tr'), '₺100 / 1 yıl');
    expect(planDetails(product, 'en'), '₺100 / 1 year');
    expect(planDetails(product, 'tr'), isNot(contains('ücretsiz')));
  });
  test('unknown/non-subscription period does not invent terms', () {
    const other = StoreProduct('test', '', '', 1, '₺1', 'TRY');
    expect(planDetails(other, 'tr'), isNull);
  });
}
