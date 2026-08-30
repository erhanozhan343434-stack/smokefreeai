import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/config/app_locales.dart' as app_locales;
import 'package:smokefree/core/config/locale_provider.dart';
import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/navigation/app_root.dart';
import 'package:smokefree/core/theme/app_theme.dart';

/// Uygulama kökü.
class SmokeFreeApp extends ConsumerWidget {
  const SmokeFreeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Kullanıcı Ayarlar'dan bir dil seçtiyse onu zorla; seçmediyse (null)
    // Flutter cihazın sistem dilini kullanır (desteklenenler arasındaysa).
    final localeOverride = ref.watch(localeControllerProvider).value;

    return MaterialApp(
      title: 'SmokeFree AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      locale: localeOverride,
      supportedLocales: app_locales.supportedLocales,
      localizationsDelegates: const [
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const AppRoot(),
    );
  }
}
