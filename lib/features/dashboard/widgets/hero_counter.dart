import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/progress_ring.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';

/// Hero sayaç — sigarasız süre.
///
/// PERFORMANS: `nowProvider`'ı YALNIZCA bu widget izler.
///
/// DAYANIKLILIK: Halka içeriği `FittedBox` ile küçülür. 4 haneli gün
/// sayısı (5 yıl = 1826 gün) ve daha uzun dil etiketleri (AR/RU) halkaya
/// sığmazdı; sabit font boyutu bu üründe taşma garantisiydi.
class HeroCounter extends ConsumerWidget {
  const HeroCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(nowProvider);

    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final a = abstinenceOf(ref);
    final recovery = recoveryOf(ref);

    final hh = a.hours.toString().padLeft(2, '0');
    final mm = a.minutes.toString().padLeft(2, '0');
    final ss = a.seconds.toString().padLeft(2, '0');

    return Column(
      children: [
        ProgressRing(
          progress: recovery.progress,
          size: 228,
          child: SizedBox(
            width: 170,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.heroSmokeFreeLabel, style: t.labelSmall),
                const SizedBox(height: 7),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${a.days}', style: t.displayLarge),
                      const SizedBox(width: 4),
                      Text(
                        l10n.heroDaysUnit,
                        style: t.bodyMedium?.copyWith(
                          fontSize: 20,
                          color: AppColors.ink3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$hh : $mm : $ss',
                  style: t.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: AppColors.accent,
                    letterSpacing: 1,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          l10n.heroMilestonesProgress(
            '${recovery.unlocked}',
            '${recovery.total}',
          ),
          style: t.bodySmall,
        ),
      ],
    );
  }
}
