import 'package:flutter/widgets.dart';

/// Desteklenen 11 dil. ARB dosyalarıyla (`l10n/app_*.arb`) birebir eşleşir.
///
/// Ayrı bir dosyada tutulur ki hem [SmokeFreeApp] (core/app.dart) hem de
/// Ayarlar ekranındaki dil seçici aynı listeyi kullansın — ikisinin
/// birbirini import etmesi gerekmeden (döngüsel import'tan kaçınmak için).
const supportedLocales = <Locale>[
  Locale('tr'),
  Locale('en'),
  Locale('de'),
  Locale('nl'),
  Locale('zh'),
  Locale('ru'),
  Locale('ar'),
  Locale('el'),
  Locale('fr'),
  Locale('it'),
  Locale('es'),
];
