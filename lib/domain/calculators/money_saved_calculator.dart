import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

/// Biriken para — kuruş/cent cinsinden tam sayı döner.
///
/// Kritik: fiyat double olarak taşınmaz. Ara hesap double, çıkış round()'lu
/// int.
/// Sayaç canlı aktığı için her tick'te yeniden hesaplanır; kümülatif toplama
/// YAPILMAZ
/// (kümülatif toplama kayan nokta hatası biriktirir ve uygulama yeniden
/// açılınca bozulur).
class MoneySavedCalculator {
  const MoneySavedCalculator();

  /// [QuitProfile.currencyCode] biriminde, minor unit (kuruş/cent).
  int call(QuitProfile p, Clock clock) {
    final elapsedDays =
        p.elapsed(clock).inMilliseconds / Duration.millisecondsPerDay;
    final units = elapsedDays * p.unitsPerDay;
    return (units * p.pricePerUnitMinor).round();
  }
}
