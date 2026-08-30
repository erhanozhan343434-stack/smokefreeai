import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/domain/calculators/money_saved_calculator.dart';
import 'package:smokefree/domain/calculators/units_avoided_calculator.dart';
import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/product_type.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

final quit = DateTime.utc(2026);

// Günde 20 sigara, 20'lik paket 90,00 TL → birim başına 4,50 TL → günde 90,00
// TL.
QuitProfile profile() => QuitProfile(
      quitDateUtc: quit,
      productType: ProductType.cigarette,
      unitsPerDay: 20,
      unitsPerPack: 20,
      packPriceMinor: 9000,
      currencyCode: 'TRY',
    );

void main() {
  const money = MoneySavedCalculator();
  const units = UnitsAvoidedCalculator();

  test('sıfır anı → 0 kuruş', () {
    expect(money(profile(), FixedClock(quit)), 0);
  });

  test('1 gün → 9000 kuruş (90,00 TL)', () {
    expect(
      money(profile(), FixedClock(quit.add(const Duration(days: 1)))),
      9000,
    );
  });

  test('12 saat → 4500 kuruş, yarım gün tam orantılı', () {
    expect(
      money(profile(), FixedClock(quit.add(const Duration(hours: 12)))),
      4500,
    );
  });

  test('45 gün → 405000 kuruş (4.050,00 TL)', () {
    expect(
      money(profile(), FixedClock(quit.add(const Duration(days: 45)))),
      405000,
    );
  });

  test('365 gün → 3285000 kuruş (32.850,00 TL)', () {
    expect(
      money(profile(), FixedClock(quit.add(const Duration(days: 365)))),
      3285000,
    );
  });

  test('birim sayacı: 45 gün → 900 sigara', () {
    expect(
      units(profile(), FixedClock(quit.add(const Duration(days: 45)))),
      900,
    );
  });

  test('5 yıl birikiminde kayan nokta sapması yok', () {
    // Kümülatif toplama yerine tek seferde hesap → sapma birikmez.
    final r =
        money(profile(), FixedClock(quit.add(const Duration(days: 1826))));
    expect(r, 16434000);
  });
}
