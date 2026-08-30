import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/config/firebase_ready_provider.dart';
import 'package:smokefree/data/local/database_providers.dart';
import 'package:smokefree/features/dashboard/checkin_providers.dart';
import 'package:smokefree/features/onboarding/onboarding_providers.dart';

/// Bildirim tercihi anahtarı.
///
/// TODO(faz-4): gerçek zamanlanmış bildirimler (flutter_local_notifications)
/// bu değere bağlanacak. Şimdilik yalnızca tercih kaydedilir/okunur.
class NotificationsEnabledController extends AsyncNotifier<bool> {
  @override
  Future<bool> build() {
    final repo = ref.watch(appSettingsRepositoryProvider);
    return repo.notificationsEnabled();
  }

  Future<void> setEnabled(bool enabled) async {
    final repo = ref.read(appSettingsRepositoryProvider);
    await repo.setNotificationsEnabled(enabled);
    state = AsyncData(enabled);
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
