import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Injectable, best-effort telemetry. Never await it in a billing operation.
typedef AnalyticsSender = Future<void> Function(
  String name, Map<String, Object> parameters);

class PaywallAnalytics {
  PaywallAnalytics({AnalyticsSender? sender}) : _sender = sender ?? _firebase;
  final AnalyticsSender _sender;

  static Future<void> _firebase(String name, Map<String, Object> parameters) async {
    if (Firebase.apps.isEmpty) return;
    await FirebaseAnalytics.instance.logEvent(name: name, parameters: parameters);
  }

  void record(String name, {Map<String, Object> parameters = const {}}) {
    unawaited(_deliver(name, parameters));
  }

  Future<void> _deliver(String name, Map<String, Object> parameters) async {
    try {
      await _sender(name, parameters).timeout(const Duration(seconds: 2));
    } on Object {
      // No keys, receipts, customer IDs, or raw backend errors in logs/events.
    }
  }

  void opened({required bool purchasesReady}) => record(
    'premium_screen_view', parameters: {'purchases_ready': purchasesReady ? 1 : 0});
}

final paywallAnalyticsProvider = Provider<PaywallAnalytics>((ref) => PaywallAnalytics());
