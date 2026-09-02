// Bu dosya `app_config.dart.example`'dan kopyalanmıştır (gitignore'da).
// Buraya GERÇEK API ANAHTARI YAZILMAZ.
// AI anahtarları YALNIZCA Cloud Functions'ta durur.

class AppConfig {
  const AppConfig._();

  // RevenueCat PUBLIC anahtarı — istemcide durması tasarım gereği güvenlidir.
  // Android: Play Console + RevenueCat production anahtarı (goog_...).
  static const revenueCatAndroidKey = 'goog_zaetdgAdKMWVRHEcbeKRLrdsoOK';
  // iOS: Apple Developer/App Store Connect kurulumu tamamlanınca
  // 'appl_...' ile başlayan gerçek production anahtarıyla değiştirilecek.
  static const revenueCatIosKey = 'appl_yjGghTeXeEYVaJYiApmmfXCMtmn';

  // Cloud Functions bölgesi ve AI ağ geçidi uç noktası.
  static const functionsRegion = 'europe-west1';
  static const aiGatewayPath = 'aiCoach';

  // AdMob — Faz 4'te yazılır, Remote Config bayrağıyla KAPALI yayınlanır.
  static const adsEnabledDefault = false;
}
