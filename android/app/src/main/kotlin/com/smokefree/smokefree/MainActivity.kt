package com.smokefree.smokefree

import com.facebook.FacebookSdk
import com.facebook.appevents.AppEventsLogger
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * Meta measurement is OFF by default. Users may opt in or withdraw consent
 * using the Settings screen. No smoking/health/profile data is sent to Meta.
 */
class MainActivity : FlutterFragmentActivity() {
    private val channelName = "smokefree/meta_measurement"
    private val preferencesName = "smokefree_meta_consent"
    private val consentKey = "consented"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val preferences = getSharedPreferences(preferencesName, MODE_PRIVATE)

        // A previously granted choice is restored; otherwise SDK logging
        // stays disabled (see AndroidManifest.xml).
        if (preferences.getBoolean(consentKey, false)) {
            enableMetaMeasurement()
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getConsent" -> result.success(preferences.getBoolean(consentKey, false))
                    "setConsent" -> {
                        val consent = call.argument<Boolean>("enabled")
                        if (consent == null) {
                            result.error("INVALID_ARGUMENT", "enabled must be boolean", null)
                        } else {
                            try {
                                if (consent) {
                                    enableMetaMeasurement()
                                } else {
                                    FacebookSdk.setAutoLogAppEventsEnabled(false)
                                    FacebookSdk.setAdvertiserIDCollectionEnabled(false)
                                }
                                preferences.edit().putBoolean(consentKey, consent).apply()
                                result.success(true)
                            } catch (error: Exception) {
                                result.error("META_SDK_ERROR", error.message, null)
                            }
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }

    private fun enableMetaMeasurement() {
        // No advertiser ID collection; event collection only after opt-in.
        FacebookSdk.setAdvertiserIDCollectionEnabled(false)
        // Only explicitly log app activation; do not enable automatic purchase events.
        FacebookSdk.setAutoLogAppEventsEnabled(false)
        FacebookSdk.fullyInitialize()
        AppEventsLogger.activateApp(application)
    }
}
