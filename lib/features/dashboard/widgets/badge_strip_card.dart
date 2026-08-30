import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/domain/constants/streak_badges.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';

/// Sigarasız gün eşiklerine dayalı rozet önizlemesi.
///
/// Kalıcı bir rozet ekranı (`features/badges`) henüz yazılmadığı için
/// burada yalnızca sabit eşiklerin önizlemesi gösterilir; kilitli
/// olanlar soluklaştırılır. Gidilecek ekran yokken tıklanabilir bir
/// "tümünü gör" bağlantısı KASITLI OLARAK YOK — bkz. `PendingSourceCard`
/// felsefesi: var olmayan bir şeye götüren sahte bir dokunma alanı
/// dürüst değildir.
class BadgeStripCard extends ConsumerWidget {
  const BadgeStripCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(nowProvider);

    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final unlocked = streakBadgesOf(ref);
    final unlockedCount = unlocked.where((u) => u).length;

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.badgesTitle, style: t.labelSmall),
              Text(
                l10n.badgesUnlockedCount(
                  '$unlockedCount',
                  '${streakBadges.length}',
                ),
                style: t.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              for (var i = 0; i < streakBadges.length; i++) ...[
                if (i > 0) const SizedBox(width: 10),
                Expanded(
                  child: _BadgePill(
                    badgeKey: streakBadges[i].key,
                    unlocked: unlocked[i],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _BadgePill extends StatelessWidget {
  const _BadgePill({required this.badgeKey, required this.unlocked});

  final String badgeKey;
  final bool unlocked;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    return Opacity(
      opacity: unlocked ? 1 : 0.35,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.line),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _icons[badgeKey] ?? '⭐',
              style: const TextStyle(fontSize: 19),
            ),
            const SizedBox(height: 5),
            Text(
              _label(l10n, badgeKey),
              style: t.bodySmall?.copyWith(fontSize: 9.5),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

const _icons = <String, String>{
  'day7': '🔥',
  'day30': '💪',
  'day90': '🏆',
  'year1': '👑',
};

String _label(L10n l10n, String badgeKey) => switch (badgeKey) {
      'day7' => l10n.badgeDay7,
      'day30' => l10n.badgeDay30,
      'day90' => l10n.badgeDay90,
      'year1' => l10n.badgeYear1,
      _ => badgeKey,
    };
