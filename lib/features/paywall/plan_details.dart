import 'package:purchases_flutter/purchases_flutter.dart';

/// Display only actual store terms. Never infer a trial from a package name.
String? planDetails(StoreProduct product, String languageCode) {
  final tr = languageCode == 'tr';
  final option = product.defaultOption;
  final free = option?.freePhase;
  final period = free?.billingPeriod;
  final full = option?.fullPricePhase;
  if (period != null && full != null && free!.price.amountMicros == 0) {
    final duration = _period(period.iso8601, tr);
    final renewal = _period(full.billingPeriod?.iso8601, tr);
    if (duration != null && renewal != null) {
      return tr
          ? 'Mağaza teklifi: $duration ücretsiz, ardından ${full.price.formatted} / $renewal. Uygunluk ve koşullar ödeme onayında doğrulanır.'
          : 'Store offer: $duration free, then ${full.price.formatted} / $renewal. Eligibility and terms are confirmed at checkout.';
    }
  }
  final duration = _period(product.subscriptionPeriod, tr);
  if (duration == null) return null;
  return '${product.priceString} / $duration';
}

String? _period(String? iso, bool tr) {
  if (iso == null) return null;
  final match = RegExp(r'^P([1-9][0-9]*)([DWMY])$').firstMatch(iso);
  if (match == null) return null;
  final count = int.parse(match.group(1)!);
  final unit = match.group(2)!;
  final label = tr
      ? {'D': 'gün', 'W': 'hafta', 'M': 'ay', 'Y': 'yıl'}[unit]!
      : {'D': 'day', 'W': 'week', 'M': 'month', 'Y': 'year'}[unit]!;
  return '$count $label${!tr && count > 1 ? 's' : ''}';
}
