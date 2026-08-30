import 'package:smokefree/domain/calculators/life_regained_calculator.dart';
import 'package:smokefree/domain/calculators/money_saved_calculator.dart';
import 'package:smokefree/domain/calculators/units_avoided_calculator.dart';
import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

/// "Bırakmasaydın" tablosu — kayıp kaçınma çerçevesi.
///
/// TASARIM KURALI: Bu panel BİRİNCİL kayıp çerçevesidir ve kullanıcının
/// kendi kaçamaklarını değil, KAÇINDIĞI kaybı gösterir. Suçlayıcı dil
/// bırakma oranını düşürür; bu yüzden gerçek kaçamak bilançosu ayrı,
/// ikincil ve nötr bir panelde durur.
class CounterfactualLoss {
  const CounterfactualLoss({
    required this.units,
    required this.moneyMinor,
    required this.lifeLost,
  });

  /// İçmiş olacağın birim sayısı.
  final double units;

  /// Yakmış olacağın para (kuruş/cent).
  final int moneyMinor;

  /// Kaybetmiş olacağın ömür. Yanma ürünü değilse null.
  final Duration? lifeLost;
}

class CounterfactualLossCalculator {
  const CounterfactualLossCalculator();

  static const _units = UnitsAvoidedCalculator();
  static const _money = MoneySavedCalculator();
  static const _life = LifeRegainedCalculator();

  CounterfactualLoss call(QuitProfile p, Clock clock) {
    return CounterfactualLoss(
      units: _units(p, clock),
      moneyMinor: _money(p, clock),
      lifeLost: _life(p, clock),
    );
  }
}
