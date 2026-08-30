import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/ticker/counter_ticker.dart';
import 'package:smokefree/domain/calculators/abstinence_calculator.dart';
import 'package:smokefree/domain/calculators/counterfactual_calculator.dart';
import 'package:smokefree/domain/calculators/health_recovery_calculator.dart';
import 'package:smokefree/domain/calculators/life_regained_calculator.dart';
import 'package:smokefree/domain/calculators/money_saved_calculator.dart';
import 'package:smokefree/domain/calculators/streak_badge_calculator.dart';
import 'package:smokefree/domain/calculators/units_avoided_calculator.dart';
import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/product_type.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

/// Zaman kaynağı. Testte FixedClock ile değiştirilir.
///
/// MonotonicClock sarmalayıcısı: kullanıcı cihaz saatini geri alırsa
/// sayaç geri düşmez.
final clockProvider = Provider<Clock>(
  (ref) => MonotonicClock(const SystemClock()),
);

/// Kullanıcının bırakma profili.
///
/// Varsayılan değer, testlerin ve onboarding tamamlanana kadarki
/// Dashboard iskeletinin dayandığı referans senaryosudur
/// (docs/reference_values.md). Onboarding tamamlanınca [AppRoot],
/// [QuitProfileController.set] ile bunu gerçek kullanıcı verisine çevirir
/// — böylece geri kalan tüm hesaplayıcı/widget kodu değişmeden kalır.
class QuitProfileController extends Notifier<QuitProfile> {
  @override
  QuitProfile build() => QuitProfile(
        quitDateUtc: DateTime.utc(2026),
        productType: ProductType.cigarette,
        unitsPerDay: 20,
        unitsPerPack: 20,
        packPriceMinor: 9000,
        currencyCode: 'TRY',
        countryCode: 'TR',
      );

  void set(QuitProfile profile) => state = profile;
}

final quitProfileProvider =
    NotifierProvider<QuitProfileController, QuitProfile>(
  QuitProfileController.new,
);

final _tickerProvider = Provider<CounterTicker>((ref) {
  final ticker = CounterTicker();
  ref.onDispose(ticker.dispose);
  return ticker;
});

/// TEK zaman yayını. Tüm canlı sayaçlar buradan beslenir —
/// hiçbir widget kendi Timer'ını kurmaz.
final nowProvider = StreamProvider<DateTime>((ref) {
  final ticker = ref.watch(_tickerProvider)..start();
  return ticker.stream;
});

// Hesaplayicilar saf ve ucuzdur; her tick'te yeniden hesaplanirlar.
// Kumulatif toplama YAPILMAZ — kayan nokta hatasi birikir ve uygulama
// yeniden acilinca deger tutmaz.
const _abstinence = AbstinenceCalculator();
const _units = UnitsAvoidedCalculator();
const _money = MoneySavedCalculator();
const _life = LifeRegainedCalculator();
const _loss = CounterfactualLossCalculator();
const _recovery = HealthRecoveryCalculator();
const _streakBadges = StreakBadgeCalculator();

Abstinence abstinenceOf(WidgetRef ref) =>
    _abstinence(ref.read(quitProfileProvider), ref.read(clockProvider));

double unitsOf(WidgetRef ref) =>
    _units(ref.read(quitProfileProvider), ref.read(clockProvider));

int moneyMinorOf(WidgetRef ref) =>
    _money(ref.read(quitProfileProvider), ref.read(clockProvider));

Duration? lifeOf(WidgetRef ref) =>
    _life(ref.read(quitProfileProvider), ref.read(clockProvider));

CounterfactualLoss lossOf(WidgetRef ref) =>
    _loss(ref.read(quitProfileProvider), ref.read(clockProvider));

HealthRecovery recoveryOf(WidgetRef ref) =>
    _recovery(ref.read(quitProfileProvider), ref.read(clockProvider));

List<bool> streakBadgesOf(WidgetRef ref) =>
    _streakBadges(ref.read(quitProfileProvider), ref.read(clockProvider));
