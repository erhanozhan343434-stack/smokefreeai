import 'package:flutter/material.dart';

/// Sinematik koyu tema paleti.
///
/// Kategorik veri renkleri (d1..d5) erişilebilirlik doğrulamasından
/// geçirilmiştir: koyu yüzey #0A0E14 üzerinde CVD (renk körlüğü) komşu
/// çift ayrımı en kötü durumda ΔE 24.9 (hedef >= 8), kontrast >= 3:1,
/// açıklık bandı L 0.48-0.67. Sıra SABİTTİR, döndürülmez.
///
/// Marka accent'i ([accent]) kategorik palete DAHİL DEĞİLDİR — tek bir
/// statü rengidir: iyileşme. Seri rengi olarak kullanılamaz.
abstract final class AppColors {
  // Yuzeyler — sinematik derinlik uc kademelidir.
  static const scene = Color(0xFF06080C);
  static const surface1 = Color(0xFF0A0E14);
  static const surface2 = Color(0xFF111721);
  static const surface3 = Color(0xFF18202C);

  static const line = Color(0x12FFFFFF);
  static const lineStrong = Color(0x21FFFFFF);

  // Murekkep
  static const ink = Color(0xFFF2F5F8);
  static const ink2 = Color(0xFFA8B3C1);
  static const ink3 = Color(0xFF6B7788);

  // Marka accent — iyilesme. Kategorik degil.
  static const accent = Color(0xFF34D399);
  static const accentDeep = Color(0xFF059669);
  static const accentGlow = Color(0x4734D399);

  // Dogrulanmis kategorik veri paleti — sira sabit.
  static const d1 = Color(0xFF059669); // para
  static const d2 = Color(0xFF2563EB); // adet
  static const d3 = Color(0xFFD97706); // risk / uyari
  static const d4 = Color(0xFF7C3AED); // omur
  static const d5 = Color(0xFFDC2626); // kayip

  /// Kategorik seri rengi. Sekizden fazla seri olamaz; fazlasi "Diger"e
  /// katlanir — uretilmis yeni bir ton ASLA kullanilmaz.
  static const categorical = <Color>[d1, d2, d3, d4, d5];
}
