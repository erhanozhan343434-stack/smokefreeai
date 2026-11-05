import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Confirmed Google Play subscription ID. Base-plan IDs remain store-provided.
const androidSubscriptionId = 'premium';

List<Package> visiblePackages(Offerings offerings, TargetPlatform platform) {
  final packages = offerings.current?.availablePackages ?? const <Package>[];
  if (platform != TargetPlatform.android) return packages;
  return packages.where((package) {
    final id = package.storeProduct.identifier;
    return id == androidSubscriptionId || id.startsWith('$androidSubscriptionId:');
  }).toList(growable: false);
}

Map<String, Object> packageParameters(Package package) => {
  'package_id': package.identifier,
  'product_id': package.storeProduct.identifier,
  if (package.storeProduct.defaultOption != null)
    'base_plan_id': package.storeProduct.defaultOption!.storeProductId,
};
