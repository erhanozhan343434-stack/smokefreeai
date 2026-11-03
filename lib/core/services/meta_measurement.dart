import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Explicitly optional Meta app-activation measurement on Android.
///
/// This does not transmit quit-smoking progress, health details, purchase
/// details, or any user-entered profile fields to Meta. It is disabled by
/// default; after explicit opt-in, the Meta SDK may collect the Android
/// advertising identifier for ad attribution.
class MetaMeasurement {
  static const _channel = MethodChannel('smokefree/meta_measurement');

  static bool get isSupported =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  static Future<bool> getConsent() async {
    if (!isSupported) return false;
    try {
      return await _channel.invokeMethod<bool>('getConsent') ?? false;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }

  static Future<bool> setConsent(bool enabled) async {
    if (!isSupported) return false;
    try {
      return await _channel.invokeMethod<bool>(
            'setConsent',
            <String, bool>{'enabled': enabled},
          ) ??
          false;
    } on PlatformException catch (error) {
      debugPrint('Meta measurement consent could not be updated: $error');
      return false;
    } on MissingPluginException {
      return false;
    }
  }
}
