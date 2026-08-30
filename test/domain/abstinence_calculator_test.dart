import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/domain/calculators/abstinence_calculator.dart';
import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/product_type.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

// docs/reference_values.md tablosuyla birebir eşleşir.
final quit = DateTime.utc(2026);

QuitProfile profile() => QuitProfile(
      quitDateUtc: quit,
      productType: ProductType.cigarette,
      unitsPerDay: 20,
      unitsPerPack: 20,
      packPriceMinor: 9000, // 90,00 TL
      currencyCode: 'TRY',
    );

void main() {
  const calc = AbstinenceCalculator();

  test('S1: sıfır anı', () {
    final r = calc(profile(), FixedClock(quit));
    expect(r.days, 0);
    expect(r.hours, 0);
    expect(r.seconds, 0);
  });

  test('S2: 1 saat', () {
    final r = calc(profile(), FixedClock(quit.add(const Duration(hours: 1))));
    expect(r.days, 0);
    expect(r.hours, 1);
  });

  test('S3: 45 gün 3 saat 7 dk 9 sn', () {
    final r = calc(
      profile(),
      FixedClock(
        quit.add(const Duration(days: 45, hours: 3, minutes: 7, seconds: 9)),
      ),
    );
    expect(r.days, 45);
    expect(r.hours, 3);
    expect(r.minutes, 7);
    expect(r.seconds, 9);
  });

  test('S4: gelecek tarihli bırakma → sıfır, negatif sayaç YOK', () {
    final r =
        calc(profile(), FixedClock(quit.subtract(const Duration(days: 5))));
    expect(r.duration, Duration.zero);
  });

  test('S5: cihaz saati geri alınırsa sayaç geri gitmez', () {
    final inner = _MutableClock(quit.add(const Duration(days: 10)));
    final mono = MonotonicClock(inner);
    final before = calc(profile(), mono).duration;

    inner.value =
        quit.add(const Duration(days: 2)); // kullanıcı saati geri aldı
    final after = calc(profile(), mono).duration;

    expect(after, before, reason: 'monoton saat geriye düşmemeli');
  });

  test('S6: yaz saati geçişi UTC tabanında kaymaya yol açmaz', () {
    // Türkiye kalıcı UTC+3; Avrupa DST geçişi yerel gösterimi etkiler, UTC
    // farkını değil.
    final r = calc(profile(), FixedClock(DateTime.utc(2026, 3, 30)));
    expect(r.days, 88);
  });
}

class _MutableClock implements Clock {
  _MutableClock(this.value);
  DateTime value;
  @override
  DateTime nowUtc() => value.toUtc();
}
