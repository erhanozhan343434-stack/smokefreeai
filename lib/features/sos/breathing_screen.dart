import 'dart:async';

import 'package:flutter/material.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/cinematic_background.dart';

/// 4-7-8 nefes egzersizi.
///
/// Basit, ekipmansız bir sakinleşme tekniği: 4 saniye nefes al, 7 saniye
/// tut, 8 saniye ver. Kriz anında hızlıca uygulanabilir olması için
/// ekranda tek bir odak noktası (daire + geri sayım) tutulur.
class BreathingExerciseScreen extends StatefulWidget {
  const BreathingExerciseScreen({super.key});

  @override
  State<BreathingExerciseScreen> createState() =>
      _BreathingExerciseScreenState();
}

enum _BreathPhase { inhale, hold, exhale }

const _phaseSeconds = {
  _BreathPhase.inhale: 4,
  _BreathPhase.hold: 7,
  _BreathPhase.exhale: 8,
};

class _BreathingExerciseScreenState extends State<BreathingExerciseScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _timer;
  _BreathPhase _phase = _BreathPhase.inhale;
  late int _secondsLeft = _phaseSeconds[_phase]!;
  int _cycle = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _phaseSeconds[_phase]!),
    )..forward();
    _startCountdown();
  }

  void _startCountdown() {
    _timer?.cancel();
    _secondsLeft = _phaseSeconds[_phase]!;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        _secondsLeft -= 1;
        if (_secondsLeft <= 0) _advancePhase();
      });
    });
  }

  void _advancePhase() {
    if (_phase == _BreathPhase.inhale) {
      _phase = _BreathPhase.hold;
    } else if (_phase == _BreathPhase.hold) {
      _phase = _BreathPhase.exhale;
    } else {
      _phase = _BreathPhase.inhale;
      _cycle += 1;
    }
    _controller
      ..duration = Duration(seconds: _phaseSeconds[_phase]!)
      ..reset()
      ..forward();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  double _scaleFor(_BreathPhase phase, double t) {
    if (phase == _BreathPhase.hold) return 1.3;
    if (phase == _BreathPhase.inhale) return 0.85 + (t * 0.45);
    return 1.3 - (t * 0.45);
  }

  (String, String) _phaseLabelAndHint(L10n l10n, _BreathPhase phase) =>
      switch (phase) {
        _BreathPhase.inhale => (
            l10n.breathingInhaleLabel,
            l10n.breathingInhaleHint,
          ),
        _BreathPhase.hold => (l10n.breathingHoldLabel, l10n.breathingHoldHint),
        _BreathPhase.exhale => (
            l10n.breathingExhaleLabel,
            l10n.breathingExhaleHint,
          ),
      };

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final (label, hint) = _phaseLabelAndHint(l10n, _phase);

    return Scaffold(
      backgroundColor: AppColors.scene,
      appBar: AppBar(
        backgroundColor: AppColors.surface1,
        foregroundColor: AppColors.ink,
        title: Text(l10n.breathingTitle),
      ),
      body: CinematicBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                Text(l10n.breathingRound('$_cycle'), style: t.labelSmall),
                const SizedBox(height: 32),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    final scale = _scaleFor(_phase, _controller.value);
                    return Transform.scale(scale: scale, child: child);
                  },
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        center: Alignment(0, -0.3),
                        colors: [Color(0xFF60A5FA), Color(0xFF1D4ED8)],
                      ),
                      boxShadow: [
                        BoxShadow(color: Color(0x662563EB), blurRadius: 60),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '$_secondsLeft',
                        style: t.displayMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  label,
                  style: t.titleLarge?.copyWith(letterSpacing: 1.2),
                ),
                const SizedBox(height: 8),
                Text(
                  hint,
                  style: t.bodyMedium?.copyWith(color: AppColors.ink2),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n.breathingFinish),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
