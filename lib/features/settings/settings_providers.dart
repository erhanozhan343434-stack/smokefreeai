import 'dart:async';
import 'dart:ui' show PlatformDispatcher;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/config/firebase_ready_provider.dart';
import 'package:smokefree/core/config/locale_provider.dart';
import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/notifications/notification_service.dart';
import 'package:smokefree/data/local/database_providers.dart';
import 'package:smokefree/features/dashboard/checkin_providers.dart';
import 'package:smokefree/features/onboarding/onboarding_providers.dart';

/// [L10n.delegate]'in desteklediği dil kodları (bkz. generated dosyanın
/// `_L10nDelegate.isSupported`). Zamanlanmış bildirim, widget ağacının
/// dışında (uygulama kapalıyken) tetiklenebildiği için BuildContext
/// kullanamaz; bunun yerine bu sabit liste ile [lookupL10n]'e güvenli bir
/// dil kodu geçirilir.
const _supportedNotificationLocaleCodes = {
  'ar', 'de', 'el', 'en', 'es', 'fr', 'it', 'nl', 'ru', 'tr', 'zh',
};

Locale _resolveNotificationLocale(Locale? explicit) {
  final code = explicit?.languageCode ??
      PlatformDispatcher.instance.locale.languageCode;
  return _supportedNotificationLocaleCodes.contains(code)
      ? Locale(code)
      : const Locale('tr');
}

/// Bildirim tercihi anahtarı — Ayarlar ekranındaki anahtarı OS'un gerçek
/// izin/planlama davranışına bağlar. `build()` uygulama açılışında mevcut
/// tercihle, [setEnabled] her değiştiğinde [NotificationService] ile
/// senkronize eder: açıksa izin ister ve günlük hatırlatmayı zamanlar,
/// kapalıysa zamanlanmış hatırlatmayı iptal eder.
class NotificationsEnabledController extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final repo = ref.watch(appSettingsRepositoryProvider);
    final enabled = await repo.notificationsEnabled();
    unawaited(_sync(enabled));
    return enabled;
  }

  Future<void> setEnabled(bool enabled) async {
    final repo = ref.read(appSettingsRepositoryProvider);
    await repo.setNotificationsEnabled(enabled);
    state = AsyncData(enabled);
    unawaited(_sync(enabled));
  }

  Future<void> _sync(bool enabled) async {
    final explicitLocale = ref.read(localeControllerProvider).value;
    final l10n = lookupL10n(_resolveNotificationLocale(explicitLocale));
    await NotificationService.instance.syncWithPreference(
      enabled: enabled,
      title: l10n.notificationDailyReminderTitle,
      body: l10n.notificationDailyReminderBody,
    );
  }
}

final notificationsEnabledProvider =
    AsyncNotifierProvider<NotificationsEnabledController, bool>(
  NotificationsEnabledController.new,
);

/// Ayarlar ekranındaki "Verilerimi sıfırla" eylemi.
///
/// Profili ve tüm geçmiş kayıtları siler, ardından buna bağlı olan
/// provider'ları geçersiz kılar — böylece uygulama bir sonraki
/// açılışta değil, HEMEN onboarding'e döner ve check-in kartı gibi
/// bellekte kalmış eski durumlar sıfırlanmış veriyle çelişmez.
///
/// Cihazdaki veriyle SINIRLI KALMAZ: Firebase kuruluysa (bkz.
/// [firebaseReadyProvider]) anonim kimliği de siler ve yerine yenisiyle
/// oturum açar — böylece App Store 5.1.1(v) maddesinin gerektirdiği
/// "hesabını sil" eylemi de karşılanmış olur (anonim kimlik teknik
/// olarak bir hesap sayılmasa da, sunucu tarafında bu uid'ye bağlı
/// hiçbir iz — ör. AI Koç hız sınırlayıcı sayaçları — kalmasın diye).
/// Firebase henüz kurulmadıysa ya da silme/oturum açma başarısız
/// olursa SESSİZCE atlanır — cihaz verisini silme işlemini asla
/// engellemez.
Future<void> resetAllUserData(WidgetRef ref) async {
  await ref.read(databaseProvider).wipeAllUserData();

  if (ref.read(firebaseReadyProvider)) {
    try {
      final auth = FirebaseAuth.instance;
      await auth.currentUser?.delete();
      await auth.signInAnonymously();
    } on Object catch (e, st) {
      debugPrint('resetAllUserData: Firebase kimliği silinemedi: $e\n$st');
    }
  }

  ref
    ..invalidate(savedProfileProvider)
    ..invalidate(todayCheckinProvider);
}
