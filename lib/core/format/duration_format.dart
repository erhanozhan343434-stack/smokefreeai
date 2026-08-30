import 'package:flutter/widgets.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';

/// Süreyi kısa okunur biçime çevirir: "3g 4s" / "8s 12dk" / "12dk"
/// (biçim dile göre değişir — bkz. ARB `duration*` anahtarları).
///
/// Uygulama genelinde tekil süre gösterimi için tek yerden kullanılır
/// (Dashboard istatistik kartları, sıradaki kilometre taşı kartı vb.) —
/// biçim değişince tek dosya güncellenir.
String formatDurationShort(BuildContext context, Duration d) {
  final l10n = L10n.of(context);
  if (d.isNegative) return l10n.durationZeroMinutes;
  if (d.inDays >= 1) {
    return l10n.durationDaysHours('${d.inDays}', '${d.inHours % 24}');
  }
  if (d.inHours >= 1) {
    return l10n.durationHoursMinutes('${d.inHours}', '${d.inMinutes % 60}');
  }
  return l10n.durationMinutes('${d.inMinutes}');
}
