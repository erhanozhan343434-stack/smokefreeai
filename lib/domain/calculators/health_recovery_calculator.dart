import 'package:smokefree/domain/constants/health_facts.dart';
import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

/// Sağlık iyileşme durumu.
class HealthRecovery {
  const HealthRecovery({
    required this.unlocked,
    required this.total,
    required this.next,
    required this.progressToNext,
  });

  /// Açılmış kilometre taşı sayısı.
  final int unlocked;

  /// Toplam kilometre taşı sayısı.
  final int total;

  /// Sıradaki taş. Hepsi açıldıysa null.
  final RecoveryMilestone? next;

  /// Sıradaki taşa ilerleme (0..1). Hepsi açıldıysa 1.
  final double progressToNext;

  /// Bileşik iyileşme yüzdesi (0..1).
  double get progress => total == 0 ? 0 : unlocked / total;
}

/// Kilometre taşı ilerlemesini hesaplar.
///
/// Taşların zaman eşikleri ve kaynakları [recoveryTimeline] içindedir;
/// her taş kendi kaynağını (WHO / CDC / NHS) taşır çünkü kaynaklar
/// birbirinden farklıdır — CDC erken saatlik taşları listelemez.
class HealthRecoveryCalculator {
  const HealthRecoveryCalculator();

  HealthRecovery call(QuitProfile p, Clock clock) {
    final elapsed = p.elapsed(clock);
    var unlocked = 0;
    for (final m in recoveryTimeline) {
      if (elapsed >= m.after) {
        unlocked++;
      } else {
        break;
      }
    }

    if (unlocked >= recoveryTimeline.length) {
      return HealthRecovery(
        unlocked: unlocked,
        total: recoveryTimeline.length,
        next: null,
        progressToNext: 1,
      );
    }

    final next = recoveryTimeline[unlocked];
    final prev =
        unlocked == 0 ? Duration.zero : recoveryTimeline[unlocked - 1].after;
    final span = next.after - prev;
    final done = elapsed - prev;
    final ratio = span.inMilliseconds == 0
        ? 1.0
        : (done.inMilliseconds / span.inMilliseconds).clamp(0.0, 1.0);

    return HealthRecovery(
      unlocked: unlocked,
      total: recoveryTimeline.length,
      next: next,
      progressToNext: ratio,
    );
  }
}
