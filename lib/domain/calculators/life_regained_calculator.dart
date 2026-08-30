import 'package:smokefree/domain/calculators/units_avoided_calculator.dart';
import 'package:smokefree/domain/constants/health_facts.dart';
import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/product_type.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

/// Geri kazanılan ömür.
///
/// Sigara başına 20 dakika — kaynak: Jackson SE, Jarvis MJ, West R.
/// "The price of a cigarette: 20 minutes of life?" Addiction 2025;
/// 120(5):810-812. Ayrıntı: docs/health_sources.md (LIFE-UCL-2025).
///
/// Bu bir POPÜLASYON ORTALAMASIDIR. Kullanıcıya daima "tahmini"
/// ibaresiyle sunulur; kişisel ömür tahmini olarak gösterilemez.
class LifeRegainedCalculator {
  const LifeRegainedCalculator();

  static const _units = UnitsAvoidedCalculator();

  /// Yalnız yanma ürünleri için anlamlıdır. Vape/snus için `null` döner
  /// ve ilgili panel gizlenir — sigara katsayısını oraya uygulamak
  /// bilimsel olarak yanlış olur.
  Duration? call(QuitProfile p, Clock clock) {
    if (!p.productType.isCombustible) return null;
    final units = _units(p, clock);
    final minutes = units * LifeLostFacts.minutesPerCigarette;
    return Duration(seconds: (minutes * 60).round());
  }
}
