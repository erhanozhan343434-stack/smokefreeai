import 'package:flutter/foundation.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:smokefree/core/analytics/app_analytics.dart';

/// Native, voluntary rating request; stores decide whether to show the dialog.
/// No incentives, star filtering, or repeated automatic prompting.
class AppReview {
  AppReview._();

  static Future<void> request() async {
    if (kIsWeb) return;
    try {
      final review = InAppReview.instance;
      if (await review.isAvailable()) {
        AppAnalytics.trackEvent('rating_request_tap');
        await review.requestReview();
      } else {
        AppAnalytics.trackEvent('rating_store_open');
        await review.openStoreListing(appStoreId: '6807270031');
      }
    } on Object catch (error) {
      debugPrint('App review unavailable: $error');
    }
  }
}
