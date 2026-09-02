import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/format/duration_format.dart';
import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/navigation/navigation_providers.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';
import 'package:smokefree/features/timeline/milestone_copy.dart';

/// Dashboard'da sıradaki sağlık kilometre taşını önizler.
///
/// Dokunulunca ana kabuğun "Sağlık" (Timeline) sekmesine geçirir —
/// [homeTabIndexProvider] üzerinden, `HomeShell`'in kendi state'ine
/// dokunmadan.
class NextMilestoneCard extends ConsumerWidget {
  const NextMilestoneCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(nowProvider);

    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context)!;
    final recovery = recoveryOf(ref);
    final next = recovery.next;

    if (next == null) {
      return GlassCard(
        borderColor: const Color(0x3834D399),
        tint: AppColors.accent,
        child: Row(
          children: [
            const Text('🎉', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Tüm sağlık kilometre taşlarını açtın.',
                style: t.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    }

    final remaining = next.after - abstinenceOf(ref).duration;

    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () => ref.read(homeTabIndexProvider.notifier).select(1),
      child: GlassCard(
        borderColor: const Color(0x387C3AED),
        tint: AppColors.d4,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.d4.withValues(alpha: 0.35),
                    AppColors.d4.withValues(alpha: 0.06),
                  ],
                ),
              ),
              child: const Text('🫀', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SIRADAKİ KİLOMETRE TAŞI',
                    style:
                        t.labelSmall?.copyWith(color: const Color(0xFFC4B5FD)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${milestoneTitle(l10n, next.key)}: '
                    '${milestoneBody(l10n, next.key)}',
                    style: t.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${formatDurationShort(remaining)} sonra açılıyor',
                    style: t.bodySmall,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.ink3),
          ],
        ),
      ),
    );
  }
}
