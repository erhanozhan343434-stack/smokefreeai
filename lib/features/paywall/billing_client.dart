import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Test seam for store operations; never substitutes a local Premium flag.
class BillingClient {
  Future<Offerings> getOfferings() => Purchases.getOfferings();
  Future<CustomerInfo> getCustomerInfo() => Purchases.getCustomerInfo();
  Future<CustomerInfo> purchase(Package package) async =>
      (await Purchases.purchase(PurchaseParams.package(package))).customerInfo;
  Future<CustomerInfo> restore() => Purchases.restorePurchases();
  void addListener(CustomerInfoUpdateListener listener) =>
      Purchases.addCustomerInfoUpdateListener(listener);
  void removeListener(CustomerInfoUpdateListener listener) =>
      Purchases.removeCustomerInfoUpdateListener(listener);
}

final billingClientProvider = Provider<BillingClient>((ref) => BillingClient());

/// Preserve existing access until the dashboard entitlement ID is verified.
/// Do not guess an ID: that would lock out existing paying subscribers.
bool hasPremiumAccess(CustomerInfo info) => info.entitlements.active.isNotEmpty;
