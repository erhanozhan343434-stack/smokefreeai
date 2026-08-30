import 'package:flutter/material.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/cinematic_background.dart';
import 'package:smokefree/core/widgets/glass_card.dart';

/// 5-4-3-2-1 duyusal farkındalık (grounding) egzersizi.
///
/// Kanıta dayalı, ekipmansız bir dikkat dağıtma tekniği: zihni "şu an
/// burada"ya çeker. İnternet veya ekstra veri gerektirmez, kriz anında
/// tek elle bile takip edilebilir.
class DistractionScreen extends StatefulWidget {
  const DistractionScreen({super.key});

  @override
  State<DistractionScreen> createState() => _DistractionScreenState();
}

const _stepIcons = ['👁️', '✋', '👂', '👃', '👅'];
const _stepCounts = [5, 4, 3, 2, 1];

class _DistractionScreenState extends State<DistractionScreen> {
  int _index = 0;

  bool get _isLast => _index == _stepIcons.length - 1;

  void _next() {
    if (_isLast) {
      Navigator.of(context).pop();
      return;
    }
    setState(() => _index += 1);
  }

  String _prompt(L10n l10n, int index, String count) => switch (index) {
        0 => l10n.distractionStep1(count),
        1 => l10n.distractionStep2(count),
        2 => l10n.distractionStep3(count),
        3 => l10n.distractionStep4(count),
        _ => l10n.distractionStep5(count),
      };

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final icon = _stepIcons[_index];
    final count = _stepCounts[_index];

    return Scaffold(
      backgroundColor: AppColors.scene,
      appBar: AppBar(
        backgroundColor: AppColors.surface1,
        foregroundColor: AppColors.ink,
        title: Text(l10n.distractionTitle),
      ),
      body: CinematicBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Text(
                  l10n.distractionStep('${_index + 1}', '${_stepIcons.length}'),
                  style: t.labelSmall,
                ),
                const Spacer(),
                Text(icon, style: const TextStyle(fontSize: 56)),
                const SizedBox(height: 24),
                Text(
                  _prompt(l10n, _index, '$count'),
                  style: t.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                GlassCard(
                  child: Text(
                    l10n.distractionInstructions,
                    style: t.bodyMedium?.copyWith(color: AppColors.ink2),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: const Color(0xFF04120C),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: _next,
                    child: Text(
                      _isLast ? l10n.distractionFinish : l10n.distractionNext,
                    ),
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
