import 'package:flutter/material.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/glass_card.dart';

/// Tek istatistik kartı: renk noktası + etiket + değer + alt not.
///
/// Renk noktası kimliği taşır; DEĞER METNİ seri rengiyle boyanmaz —
/// metin daima mürekkep tonundadır. Renk-tek-başına kimlik taşımaz.
class StatCard extends StatelessWidget {
  const StatCard({
    required this.label,
    required this.value,
    required this.dotColor,
    this.sub,
    this.valueColor,
    this.borderColor,
    this.tint,
    super.key,
  });

  final String label;
  final String value;
  final Color dotColor;
  final String? sub;
  final Color? valueColor;
  final Color? borderColor;
  final Color? tint;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return GlassCard(
      borderColor: borderColor,
      tint: tint,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label.toUpperCase(),
                  style: t.labelSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Text(
            value,
            style: t.titleLarge?.copyWith(color: valueColor),
            maxLines: 1,
          ),
          if (sub != null) ...[
            const SizedBox(height: 3),
            Text(sub!, style: t.bodySmall, maxLines: 2),
          ],
        ],
      ),
    );
  }
}

/// Doğrulanmamış sabit nedeniyle gösterilemeyen panel.
///
/// Kartı tamamen gizlemek yerine soluk gösteriyoruz: kullanıcıya
/// dürüstlük, geliştiriciye görünür TODO.
class PendingSourceCard extends StatelessWidget {
  const PendingSourceCard({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    return Opacity(
      opacity: 0.42,
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label.toUpperCase(), style: t.labelSmall),
            const SizedBox(height: 14),
            Text(
              l10n.pendingSourceVerifying,
              style: t.bodyMedium?.copyWith(color: AppColors.ink3),
            ),
            const SizedBox(height: 3),
            Text(l10n.pendingSourceHiddenPanel, style: t.bodySmall),
          ],
        ),
      ),
    );
  }
}
