import 'package:flutter/material.dart';

import 'package:smokefree/core/theme/app_colors.dart';

/// Uygulama teması. Sinematik koyu mod birincildir.
abstract final class AppTheme {
  static ThemeData get dark {
    const scheme = ColorScheme.dark(
      primary: AppColors.accent,
      secondary: AppColors.d2,
      surface: AppColors.surface1,
      error: AppColors.d5,
      onPrimary: Color(0xFF04120C),
      onSurface: AppColors.ink,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.scene,
      textTheme: _text,
      splashFactory: InkSparkle.splashFactory,
    );
  }

  /// Sayilarin genisligi degismemeli: canli sayacta rakam degisirken
  /// widget zipliyorsa premium his aninda kaybolur.
  static const _tabular = <FontFeature>[FontFeature.tabularFigures()];

  static const _text = TextTheme(
    // Hero sayac — ince agirlik premium his verir.
    displayLarge: TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.w200,
      letterSpacing: -2.5,
      height: 1,
      color: AppColors.ink,
      fontFeatures: _tabular,
    ),
    titleLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.75,
      color: AppColors.ink,
      fontFeatures: _tabular,
    ),
    bodyMedium: TextStyle(fontSize: 13, color: AppColors.ink2),
    bodySmall: TextStyle(fontSize: 11, color: AppColors.ink3),
    labelSmall: TextStyle(
      fontSize: 10,
      letterSpacing: 1.3,
      color: AppColors.ink3,
      fontWeight: FontWeight.w500,
    ),
  );
}
