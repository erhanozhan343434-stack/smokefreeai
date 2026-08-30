import 'package:flutter/material.dart';

import 'package:smokefree/core/theme/app_colors.dart';

/// Sinematik arka plan — ÜÇ radyal gradient katmanı.
///
/// PERFORMANS SÖZLEŞMESİ: bu widget `const` ve `RepaintBoundary` içindedir.
/// Sayaç saniyede bir güncellenirken bu katman YENİDEN BOYANMAZ.
/// Gradient boyama pahalıdır; her tick'te tekrarlanırsa orta seviye
/// Android'de 60fps bütçesi (16ms) tek başına burada tükenir.
class CinematicBackground extends StatelessWidget {
  const CinematicBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.scene,
      child: Stack(
        children: [
          const Positioned.fill(
            child: RepaintBoundary(child: _GradientLayer()),
          ),
          child,
        ],
      ),
    );
  }
}

class _GradientLayer extends StatelessWidget {
  const _GradientLayer();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.75, -1.05),
          radius: 1.15,
          colors: [Color(0x2B059669), Color(0x00059669)],
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.85, -0.8),
            radius: 1,
            colors: [Color(0x212563EB), Color(0x002563EB)],
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, 1.2),
              radius: 1.1,
              colors: [Color(0x1A7C3AED), Color(0x007C3AED)],
            ),
          ),
        ),
      ),
    );
  }
}
