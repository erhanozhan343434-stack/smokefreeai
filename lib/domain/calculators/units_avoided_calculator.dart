import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

/// İçilmeyen birim (sigara adedi / puf / seans) — canlı artan.
class UnitsAvoidedCalculator {
  const UnitsAvoidedCalculator();

  double call(QuitProfile p, Clock clock) {
    final elapsedDays =
        p.elapsed(clock).inMilliseconds / Duration.millisecondsPerDay;
    return elapsedDays * p.unitsPerDay;
  }
}
