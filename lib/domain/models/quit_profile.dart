import 'package:smokefree/domain/core/clock.dart';
import 'package:smokefree/domain/models/product_type.dart';

/// Kullanıcının bırakma profili — tüm hesaplayıcıların tek girdisi.
class QuitProfile {
  const QuitProfile({
    required this.quitDateUtc,
    required this.productType,
    required this.unitsPerDay,
    required this.unitsPerPack,
    required this.packPriceMinor,
    required this.currencyCode,
    this.countryCode,
  })  : assert(unitsPerDay > 0, 'unitsPerDay > 0 olmalı'),
        assert(unitsPerPack > 0, 'unitsPerPack > 0 olmalı'),
        assert(packPriceMinor >= 0, 'fiyat negatif olamaz');

  /// Bırakma anı — DAİMA UTC saklanır, gösterim yerel saatte yapılır.
  /// Kullanıcı saat dilimi değiştirirse sayaç kaymaz.
  final DateTime quitDateUtc;

  final ProductType productType;

  /// Bırakmadan önceki günlük tüketim (ürünün kendi birimiyle).
  final double unitsPerDay;

  /// Bir pakette kaç birim var (sigara: 20).
  final int unitsPerPack;

  /// Paket fiyatı — KURUŞ/CENT cinsinden tam sayı.
  /// Para hesabında double kullanılmaz: yuvarlama hatası birikir.
  final int packPriceMinor;

  final String currencyCode; // ISO 4217: TRY, USD, EUR...
  final String? countryCode; // ISO 3166-1 alpha-2

  /// Birim başına maliyet (kuruş, ondalıklı — yalnız ara hesap).
  double get pricePerUnitMinor => packPriceMinor / unitsPerPack;

  Duration elapsed(Clock clock) {
    final diff = clock.nowUtc().difference(quitDateUtc);
    return diff.isNegative ? Duration.zero : diff; // gelecek tarih → sıfır
  }
}
