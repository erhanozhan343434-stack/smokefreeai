import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

/// Privacy-safe, best-effort analytics. Never blocks navigation or purchases.
/// Only fixed screen names and non-sensitive event labels are recorded.
class AppAnalytics {
  AppAnalytics._();

  static Future<void> screen(String name) async {
    if (Firebase.apps.isEmpty) return;
    try {
      await FirebaseAnalytics.instance.logScreenView(
        screenName: name,
        screenClass: name,
      );
    } on Object catch (error) {
      debugPrint('Analytics screen event failed: $error');
    }
  }

  static Future<void> event(String name, {String? source}) async {
    if (Firebase.apps.isEmpty) return;
    try {
      await FirebaseAnalytics.instance.logEvent(
        name: name,
        parameters: source == null ? null : {'source': source},
      );
    } on Object catch (error) {
      debugPrint('Analytics event failed: $error');
    }
  }

  static void trackScreen(String name) => unawaited(screen(name));
  static void trackEvent(String name, {String? source}) =>
      unawaited(event(name, source: source));
}
