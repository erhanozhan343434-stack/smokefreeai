import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/cinematic_background.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/data/local/database_providers.dart';
import 'package:smokefree/features/ai_coach/ai_coach_screen.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';
import 'package:smokefree/features/sos/breathing_screen.dart';
import 'package:smokefree/features/sos/distraction_screen.dart';

/// Kriz ekranı.
///
/// TASARIM KURALLARI:
/// - Suçlayıcı dil YOK. "Serin sıfırlanmaz" çerçevesi korunur.
/// - Nabız animasyonu yalnız bu ekran görünürken çalışır
///   (TickerMode + ekran değişince dispose).
class SosScreen extends ConsumerWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(nowProvider);
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final a = abstinenceOf(ref);
    final units = unitsOf(ref).floor();

    return Scaffold(
      backgroundColor: AppColors.scene,
      body: CinematicBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            children: [
              const SizedBox(height: 12),
              Text(
                l10n.sosHeader,
                style: t.labelSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Center(child: _BreatheButton()),
              const SizedBox(height: 20),
              Text(
                l10n.sosSubtitle,
                style: t.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 26),
              _ActionGrid(
                onLogCraving: () => _openCravingSheet(context),
                onOpenCoach: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const AiCoachScreen(),
                  ),
                ),
                onBreathe: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const BreathingExerciseScreen(),
                  ),
                ),
                onDistract: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const DistractionScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              GlassCard(
                borderColor: const Color(0x382563EB),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.sosDontWaste('${a.days}'),
                      style: t.labelSmall?.copyWith(
                        color: AppColors.d2.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      l10n.sosRelapseWarning('$units'),
                      style: t.bodyMedium?.copyWith(height: 1.6),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Nabız atan nefes butonu.
class _BreatheButton extends StatefulWidget {
  const _BreatheButton();

  @override
  State<_BreatheButton> createState() => _BreatheButtonState();
}

class _BreatheButtonState extends State<_BreatheButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.97,
      upperBound: 1.03,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return ScaleTransition(
      scale: _c,
      child: Container(
        width: 186,
        height: 186,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            center: Alignment(0, -0.35),
            colors: [Color(0xFFF87171), Color(0xFFB91C1C)],
          ),
          boxShadow: [
            BoxShadow(color: Color(0x6BDC2626), blurRadius: 60),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🫁', style: TextStyle(fontSize: 38)),
            const SizedBox(height: 7),
            Text(
              L10n.of(context).sosBreatheButton,
              style: t.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionGrid extends StatelessWidget {
  const _ActionGrid({
    required this.onLogCraving,
    required this.onOpenCoach,
    required this.onBreathe,
    required this.onDistract,
  });

  final VoidCallback onLogCraving;
  final VoidCallback onOpenCoach;
  final VoidCallback onBreathe;
  final VoidCallback onDistract;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 11,
      crossAxisSpacing: 11,
      childAspectRatio: 1.85,
      children: [
        _Action(
          icon: '😮‍💨',
          label: l10n.sosActionBreathing,
          onTap: onBreathe,
        ),
        _Action(icon: '💬', label: l10n.sosActionCoach, onTap: onOpenCoach),
        _Action(icon: '✍️', label: l10n.sosActionCraving, onTap: onLogCraving),
        _Action(icon: '🧘', label: l10n.sosActionDistract, onTap: onDistract),
      ],
    );
  }
}

class _Action extends StatelessWidget {
  const _Action({required this.icon, required this.label, this.onTap});

  final String icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: GlassCard(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 6),
            Text(
              label,
              style: t.bodySmall?.copyWith(height: 1.3),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Kraving kayıt formu — şiddet + tetikleyici, iki dokunuş.
/// Kriz anında uzun form doldurtmak krizi büyütür; alan sayısı bilinçli az.
void _openCravingSheet(BuildContext context) {
  // Sheet'in kapanmasini beklemiyoruz; kayit kendi butonunda tamamlanir.
  unawaited(
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      builder: (sheetContext) => const _CravingSheet(),
    ),
  );
}

class _CravingSheet extends ConsumerStatefulWidget {
  const _CravingSheet();

  @override
  ConsumerState<_CravingSheet> createState() => _CravingSheetState();
}

class _CravingSheetState extends ConsumerState<_CravingSheet> {
  double _intensity = 5;
  String? _cue;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final cues = <String>[
      l10n.cravingCueCoffee,
      l10n.cravingCueStress,
      l10n.cravingCueAfterMeal,
      l10n.cravingCueSocial,
      l10n.cravingCueOther,
    ];
    return Padding(
      padding: EdgeInsets.fromLTRB(
        22,
        20,
        22,
        22 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.cravingTitle, style: t.labelSmall),
          const SizedBox(height: 16),
          Text(
            l10n.cravingIntensity('${_intensity.round()}'),
            style: t.bodyMedium,
          ),
          Slider(
            value: _intensity,
            min: 1,
            max: 10,
            divisions: 9,
            activeColor: AppColors.d3,
            onChanged: (v) => setState(() => _intensity = v),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in cues)
                ChoiceChip(
                  label: Text(c),
                  selected: _cue == c,
                  selectedColor: AppColors.accentDeep,
                  onSelected: (_) => setState(() => _cue = c),
                ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: const Color(0xFF04120C),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final navigator = Navigator.of(context);
                final savedMessage = l10n.cravingSaved;
                await ref.read(cravingRepositoryProvider).logCraving(
                      atUtc: DateTime.now().toUtc(),
                      intensity: _intensity.round(),
                      cue: _cue,
                    );
                navigator.pop();
                messenger.showSnackBar(
                  SnackBar(content: Text(savedMessage)),
                );
              },
              child: Text(l10n.cravingSave),
            ),
          ),
        ],
      ),
    );
  }
}
