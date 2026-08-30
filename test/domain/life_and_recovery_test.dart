import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/domain/calculators/counterfactual_calculator.dart';
import 'package:smokefree/domain/calculators/health_recovery_calculator.dart';
import 'package:smokefree/domain/calculators/life_regained_calculator.dart';
import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/product_type.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

final quit = DateTime.utc(2026);

QuitProfile profile({ProductType type = ProductType.cigarette}) => QuitProfile(
      quitDateUtc: quit,
      productType: type,
      unitsPerDay: 20,
      unitsPerPack: 20,
      packPriceMinor: 9000,
      currencyCode: 'TRY',
    );

void main() {
  group('LifeRegainedCalculator', () {
    const calc = LifeRegainedCalculator();

    test('45 gun -> 900 sigara x 20 dk = 12 gun 12 saat', () {
      final r = calc(
        profile(),
        FixedClock(quit.add(const Duration(days: 45))),
      );
      expect(r, isNotNull);
      expect(r!.inMinutes, 18000);
      expect(r.inDays, 12);
      expect(r.inHours % 24, 12);
    });

    test('sifir aninda sifir', () {
      expect(calc(profile(), FixedClock(quit)), Duration.zero);
    });

    test('vape yanma urunu degil -> null, panel gizlenir', () {
      final r = calc(
        profile(type: ProductType.vape),
        FixedClock(quit.add(const Duration(days: 45))),
      );
      expect(r, isNull, reason: 'sigara katsayisi vape icin uygulanamaz');
    });
  });

  group('HealthRecoveryCalculator', () {
    const calc = HealthRecoveryCalculator();

    test('sifir aninda hicbir tas acik degil', () {
      final r = calc(profile(), FixedClock(quit));
      expect(r.unlocked, 0);
      expect(r.total, 14);
      expect(r.next?.key, 'min20');
    });

    test('20 dakika sonra ilk tas acilir', () {
      final r = calc(
        profile(),
        FixedClock(quit.add(const Duration(minutes: 20))),
      );
      expect(r.unlocked, 1);
      expect(r.next?.key, 'hour8');
    });

    test('45 gun -> 8 tas acik (30 gun gecildi, 274 gun bekliyor)', () {
      final r = calc(
        profile(),
        FixedClock(quit.add(const Duration(days: 45))),
      );
      expect(r.unlocked, 8);
      expect(r.next?.key, 'month9');
      expect((r.progress * 100).round(), 57);
    });

    test('20 yil sonra hepsi acik', () {
      final r = calc(
        profile(),
        FixedClock(quit.add(const Duration(days: 7400))),
      );
      expect(r.unlocked, r.total);
      expect(r.next, isNull);
      expect(r.progressToNext, 1);
    });
  });

  group('CounterfactualLossCalculator', () {
    const calc = CounterfactualLossCalculator();

    test('45 gun -> 900 sigara, 405000 kurus, 12 gun 12 saat', () {
      final r = calc(
        profile(),
        FixedClock(quit.add(const Duration(days: 45))),
      );
      expect(r.units, 900);
      expect(r.moneyMinor, 405000);
      expect(r.lifeLost?.inMinutes, 18000);
    });
  });
}
