import 'package:smokefree/domain/constants/streak_badges.dart';
import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

/// [streakBadges] listesiyle aynı sırada, her rozetin açık olup
/// olmadığını döner.
class StreakBadgeCalculator {
  const StreakBadgeCalculator();

  List<bool> call(QuitProfile p, Clock clock) {
    final elapsed = p.elapsed(clock);
    return [for (final b in streakBadges) elapsed >= b.after];
  }
}
