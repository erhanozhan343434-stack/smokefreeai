import 'package:flutter/material.dart';

import 'package:smokefree/core/theme/app_colors.dart';

/// Cam kart.
///
/// NOT: Kasıtlı olarak `BackdropFilter` KULLANILMIYOR. Gerçek blur
/// Flutter'da orta seviye Android'de tek başına 8-12ms frame süresi yer —
/// 16ms'lik 60fps bütçesinin yarısından fazlası. Aynı görsel etki
/// yarı saydam gradient + ince üst çizgi ile bedelsiz elde edilir.
class GlassCard extends StatelessWidget {
  const GlassCard({
    required this.child,
    this.borderColor,
    this.tint,
    this.padding = const EdgeInsets.all(15),
    super.key,
  });

  final Widget child;
  final Color? borderColor;
  final Color? tint;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final base = tint ?? Colors.white;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: borderColor ?? AppColors.line),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            base.withValues(alpha: 0.055),
            base.withValues(alpha: 0.014),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Ust kenardaki ince isik cizgisi — cam hissini bu tasiyor.
          Positioned(
            top: 0,
            left: 12,
            right: 12,
            child: Container(
              height: 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x00FFFFFF),
                    Color(0x38FFFFFF),
                    Color(0x00FFFFFF),
                  ],
                ),
              ),
            ),
          ),
          Padding(padding: padding, child: child),
        ],
      ),
    );
  }
}
