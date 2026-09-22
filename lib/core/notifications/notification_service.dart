import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Gerçek OS düzeyinde bildirim izni isteyip günlük hatırlatmayı
/// zamanlayan servis.
///
/// TAMAMLANDI (faz-4): daha önce bu iş yalnızca [settings_providers.dart]
/// içindeki tercihi kaydediyordu, izin isteme veya bildirim planlama hiç
/// yapılmıyordu. iOS'un Ayarlar > Bildirimler listesinde uygulamayı hiç
/// göstermemesinin sebebi de buydu: iOS bir uygulamayı yalnızca en az bir
/// kez izin istediğinde listeye ekler.
///
/// Zaman dilimi notu: cihazın IANA saat dilimi adını (ör. "Europe/Istanbul")
/// öğrenmek için ekstra bir native eklentiye (flutter_timezone vb.)
/// ihtiyaç var; bu proje bunu içermiyor ve elle eklemek CI'da
/// `flutter pub get` ile çözülecek bir sürüm kısıtlaması gerektiriyor.
/// Bunun yerine cihazın O ANKİ UTC farkı kullanılarak doğru mutlak an
/// hesaplanır ve `tz.UTC` konumuna sabitlenir. Türkiye 2016'dan beri yaz
/// saati uygulamadığı için (sabit UTC+3) bu, Türkiye'deki kullanıcılar
/// için her zaman doğru sonuç verir; DST uygulayan ülkelerde saatlik
/// geçişlerde bildirim ±1 saat kayabilir — bu, ilk sürüm için kabul
/// edilebilir bir basitleştirmedir.
class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const int _dailyReminderId = 1001;
  static const String _channelId = 'daily_reminder';
  static const String _channelName = 'Günlük hatırlatma';
  static const String _channelDescription =
      'Günlük destek ve hatırlatma bildirimleri';

  bool _initialized = false;

  /// Eklentiyi başlatır ve Android bildirim kanalını oluşturur.
  /// İzin İSTEMEZ — yalnızca hazırlık yapar. Birden çok kez çağrılması
  /// güvenlidir.
  Future<void> init() async {
    if (kIsWeb || _initialized) return;

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: darwinSettings,
      ),
    );

    const channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.defaultImportance,
    );
    await _plugin
        .resolvePlatformSpecificImplementation
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    tz_data.initializeTimeZones();

    _initialized = true;
  }

  /// OS'un gerçek izin diyaloğunu gösterir (iOS: alert/badge/sound,
  /// Android 13+: POST_NOTIFICATIONS). Android 12 ve altında no-op olarak
  /// `true` döner. Kullanıcı reddederse `false` döner.
  Future<bool> _requestPermission() async {
    if (kIsWeb) return false;

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final granted = await _plugin
          .resolvePlatformSpecificImplementation
              DarwinFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      return granted ?? false;
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      final granted = await _plugin
          .resolvePlatformSpecificImplementation
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
      return granted ?? true; // Android 12- için no-op -> null gelir.
    }

    return false;
  }

  /// Ayarlar ekranındaki bildirim tercihini gerçek OS davranışına bağlar:
  /// açıldığında izin ister ve günlük hatırlatmayı zamanlar, kapatıldığında
  /// zamanlanmış hatırlatmayı iptal eder. [settings_providers.dart]
  /// tarafından, tercih her değiştiğinde (ve uygulama açılışında mevcut
  /// değerle) çağrılır.
  Future<void> syncWithPreference({
    required bool enabled,
    required String title,
    required String body,
  }) async {
    if (kIsWeb) return;
    await init();

    if (!enabled) {
      await _plugin.cancel(_dailyReminderId);
      return;
    }

    final granted = await _requestPermission();
    if (!granted) {
      // Kullanıcı izin vermedi; tercih açık kalsa da OS bildirim
      // göstermeyecek. Zorla tekrar sormuyoruz — Ayarlar > Uygulamalar
      // üzerinden kendi isteğiyle açabilir.
      return;
    }

    await _plugin.zonedSchedule(
      _dailyReminderId,
      title,
      body,
      _nextInstanceOfLocalTime(hour: 19, minute: 0),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  tz.TZDateTime _nextInstanceOfLocalTime({
    required int hour,
    required int minute,
  }) {
    final now = DateTime.now();
    var scheduled = DateTime(now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return tz.TZDateTime.from(scheduled.toUtc(), tz.UTC);
  }
}
