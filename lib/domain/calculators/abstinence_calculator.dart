import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

/// Sigarasız geçen süre — gün : saat : dakika : saniye.
class Abstinence {
  const Abstinence(this.duration);
  final Duration duration;

  int get days => duration.inDays;
  int get hours => duration.inHours % 24;
  int get minutes => duration.inMinutes % 60;
  int get seconds => duration.inSeconds % 60;
  double get totalDays => duration.inMilliseconds / Duration.millisecondsPerDay;
}

class AbstinenceCalculator {
  const AbstinenceCalculator();

  Abstinence call(QuitProfile p, Clock clock) => Abstinence(p.elapsed(clock));
}
