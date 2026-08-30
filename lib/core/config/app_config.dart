// Bu dosya `app_config.dart.example`'dan kopyalanmıştır (gitignore'da).
// Buraya GERÇEK API ANAHTARI YAZILMAZ.
// AI anahtarları YALNIZCA Cloud Functions'ta durur.

class AppConfig {
  const AppConfig._();

  // RevenueCat PUBLIC anahtarı — istemcide durması tasarım gereği güvenlidir.
  // NOT: Bu anahtar şu an RevenueCat'in App Store Connect/Play Console henüz
  // bağlanmadığı için verdiği "test_" ön ekli GEÇİCİ test anahtarıdır. Gerçek
  // Play Store yayınından önce Play Console bağlanıp buradaki değer
  // 'goog_...' ile başlayan gerçek production anahtarıyla değiştirilmelidir.
  static const revenueCatAndroidKey = 'test_SNqJisYEwterMghZMKBlyJGyJbb';
  static const revenueCatIosKey = 'test_SNqJisYEwterMghZMKBlyJGyJbb';

  // Cloud Functions bölgesi ve AI ağ geçidi uç noktası.
  static const functionsRegion = 'europe-west1';
  static const aiGatewayPath = 'aiCoach';

  // AdMob — Faz 4'te yazılır, Remote Config bayrağıyla KAPALI yayınlanır.
  static const adsEnabledDefault = false;
}
