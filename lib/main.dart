import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'package:smokefree/core/app.dart';
import 'package:smokefree/core/config/app_config.dart';
import 'package:smokefree/core/config/firebase_ready_provider.dart';
import 'package:smokefree/core/config/purchases_ready_provider.dart';
import 'package:smokefree/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final firebaseReady = await _initFirebase();
  final purchasesReady = await _initPurchases();

  runApp(
    ProviderScope(
      overrides: [
        firebaseReadyProvider.overrideWithValue(firebaseReady),
        purchasesReadyProvider.overrideWithValue(purchasesReady),
      ],
      child: const SmokeFreeApp(),
    ),
  );
}

/// Firebase'i başlatmayı DENER; henüz `flutterfire configure`
/// çalıştırılmadıysa (bkz. lib/firebase_options.dart) sessizce başarısız
/// olur — uygulamanın geri kalanını ETKİLEMEZ, yalnızca AI Koç ekranı
/// bunu görüp dürüst bir "yakında" mesajı gösterir.
Future<bool> _initFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Web için App Check'i şimdilik atlıyoruz — reCAPTCHA site anahtarı
    // gerektirir (ayrı bir kurulum adımı). Android/iOS geliştirme sırasında
    // "debug" sağlayıcı kullanılır; GERÇEK Play Store yayınından önce
    // Android tarafı playIntegrity'e çevrilmeli (bkz. docs/runbooks).
    if (!kIsWeb) {
      await FirebaseAppCheck.instance.activate(
        androidProvider: AndroidProvider.debug,
        appleProvider: AppleProvider.debug,
      );
    }

    // Gerçek bir giriş ekranı YOK — cihazı/kurulumu kötüye kullanıma karşı
    // hız sınırlamak için anonim kimlik yeterli (bkz. functions/src/index.ts
    // içindeki checkAndConsumeHourlyRate).
    if (FirebaseAuth.instance.currentUser == null) {
      await FirebaseAuth.instance.signInAnonymously();
    }
    return true;
  } on Object catch (e, st) {
    debugPrint('Firebase başlatılamadı (AI Koç devre dışı kalacak): $e\n$st');
    return false;
  }
}

/// RevenueCat'i DENER; gerçek API anahtarları henüz girilmediyse (hâlâ
/// `app_config.dart` içindeki placeholder değerlerse) hiç denemeden
/// `false` döner — uygulamanın geri kalanını ETKİLEMEZ, yalnızca Premium
/// ekranı bunu görüp dürüst bir "yakında" mesajı gösterir.
Future<bool> _initPurchases() async {
  if (kIsWeb) return false;

  final hasRealKeys =
      AppConfig.revenueCatAndroidKey != 'goog_YOUR_PUBLIC_KEY' &&
          AppConfig.revenueCatIosKey != 'appl_YOUR_PUBLIC_KEY';
  if (!hasRealKeys) return false;

  try {
    await Purchases.setLogLevel(LogLevel.warn);
    final apiKey = defaultTargetPlatform == TargetPlatform.iOS
        ? AppConfig.revenueCatIosKey
        : AppConfig.revenueCatAndroidKey;
    await Purchases.configure(PurchasesConfiguration(apiKey));
    return true;
  } on Object catch (e, st) {
    debugPrint('RevenueCat başlatılamadı (Premium devre dışı kalacak): '
        '$e\n$st');
    return false;
  }
}