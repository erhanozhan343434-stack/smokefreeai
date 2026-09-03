// Kilometre taşı sunum metinleri.
//
// Hem Timeline ekranı hem Dashboard'daki "sıradaki kilometre taşı" kartı
// buradan okur — metin tek yerde tutulur. Gerçek metinler ARB'de 11 dilde
// tutulur (bkz. `l10n/app_*.arb`, anahtarlar `milestone<Key>Title` /
// `milestone<Key>Body`); burada yalnızca [RecoveryMilestone.key] → doğru
// L10n getter eşlemesi vardır.

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/domain/constants/health_facts.dart';

String milestoneTitle(L10n l10n, String key) => switch (key) {
      'min20' => l10n.milestoneMin20Title,
      'hour8' => l10n.milestoneHour8Title,
      'hour12' => l10n.milestoneHour12Title,
      'hour24' => l10n.milestoneHour24Title,
      'hour48' => l10n.milestoneHour48Title,
      'hour72' => l10n.milestoneHour72Title,
      'week2' => l10n.milestoneWeek2Title,
      'month1' => l10n.milestoneMonth1Title,
      'month9' => l10n.milestoneMonth9Title,
      'year1' => l10n.milestoneYear1Title,
      'year5' => l10n.milestoneYear5Title,
      'year10' => l10n.milestoneYear10Title,
      'year15' => l10n.milestoneYear15Title,
      'year20' => l10n.milestoneYear20Title,
      _ => key,
    };

String milestoneBody(L10n l10n, String key) => switch (key) {
      'min20' => l10n.milestoneMin20Body,
      'hour8' => l10n.milestoneHour8Body,
      'hour12' => l10n.milestoneHour12Body,
      'hour24' => l10n.milestoneHour24Body,
      'hour48' => l10n.milestoneHour48Body,
      'hour72' => l10n.milestoneHour72Body,
      'week2' => l10n.milestoneWeek2Body,
      'month1' => l10n.milestoneMonth1Body,
      'month9' => l10n.milestoneMonth9Body,
      'year1' => l10n.milestoneYear1Body,
      'year5' => l10n.milestoneYear5Body,
      'year10' => l10n.milestoneYear10Body,
      'year15' => l10n.milestoneYear15Body,
      'year20' => l10n.milestoneYear20Body,
      _ => '',
    };

/// Kaynak kısaltmaları (WHO/CDC/NHS) özel isimdir, dile göre değişmez.
String milestoneSourceLabel(RecoverySource s) => switch (s) {
      RecoverySource.who => 'WHO',
      RecoverySource.cdc => 'CDC',
      RecoverySource.nhs => 'NHS',
    };
