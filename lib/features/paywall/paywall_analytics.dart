import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Best-effort telemetry: analytics must never block purchases.
class PaywallAnalytics {
  const PaywallAnalytics._();

  static Future<void> record(String name, {Map<String, Object>? parameters}) async {
    try {
      await FirebaseAnalytics.instance.logEvent(
        name: name,
        parameters: parameters,
      );
    } on Object catch (error) {
      debugPrint('Paywall analytics unavailable: $error');
    }
  }

  static Future<void> opened({required bool purchasesReady}) =>
      record('premium_screen_view', parameters: {
        'purchases_ready': purchasesReady ? 1 : 0,
      });

  static Future<void> packagesLoaded(int count) =>
      record('premium_packages_loaded', parameters: {'package_count': count});

  static Future<void> packagesFailed() => record('premium_packages_failed');

  static Future<void> purchaseStarted(String packageId) =>
      record('premium_purchase_started', parameters: {'package_id': packageId});

  static Future<void> purchaseSucceeded(String packageId) =>
      record('premium_purchase_succeeded', parameters: {'package_id': packageId});

  static Future<void> purchaseCancelled(String packageId) =>
      record('premium_purchase_cancelled', parameters: {'package_id': packageId});

  static Future<void> purchaseFailed(String packageId) =>
      record('premium_purchase_failed', parameters: {'package_id': packageId});
}
