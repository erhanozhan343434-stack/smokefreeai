import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:smokefree/core/theme/app_colors.dart';

/// Hero halka göstergesi.
///
/// `CustomPainter` ile çizilir; `shouldRepaint` yalnız ilerleme değerine
/// bakar. Halkanın altındaki glow ayrı ve statik bir katmandır — halka
/// her saniye repaint etse bile glow yeniden boyanmaz.
class ProgressRing extends StatelessWidget {
  const ProgressRing({
    required this.progress,
    required this.size,
    this.child,
    super.key,
  }) : assert(progress >= 0 && progress <= 1, 'progress 0..1 araliginda');

  final double progress;
  final double size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Statik glow — repaint etmez.
          const RepaintBoundary(child: _RingGlow()),
          RepaintBoundary(
            child: CustomPaint(
              size: Size.square(size),
              painter: _RingPainter(progress),
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}

class _RingGlow extends StatelessWidget {
  const _RingGlow();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [AppColors.accentGlow, Color(0x0034D399)],
          stops: [0.55, 1],
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter(this.progress);

  final double progress;
  static const _stroke = 9.0;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.width - _stroke) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _stroke
      ..color = const Color(0x0FFFFFFF);
    canvas.drawCircle(center, radius, track);

    if (progress <= 0) return;

    final arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _stroke
      ..strokeCap = StrokeCap.round
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.accent, AppColors.accentDeep, AppColors.d2],
        stops: [0, 0.55, 1],
      ).createShader(rect);

    canvas.drawArc(rect, -math.pi / 2, 2 * math.pi * progress, false, arc);
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.progress != progress;
}
