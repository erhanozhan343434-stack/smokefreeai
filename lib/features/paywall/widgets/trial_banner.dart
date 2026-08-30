import 'package:flutter/material.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/glass_card.dart';

/// "3 gün ücretsiz dene" çağrı-to-action banner'ı.
///
/// TODO(faz-5): RevenueCat entegrasyonu tamamlanınca gerçek paywall
/// akışına (`features/paywall`) bağlanacak. Şimdilik yalnızca görsel
/// bileşendir — [onTap] neyi tetikleyeceğine çağıran karar verir, bu
/// widget hiçbir satın alma akışını kendiliğinden başlatmaz.
class TrialBanner extends StatelessWidget {
  const TrialBanner({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: GlassCard(
        borderColor: const Color(0x3834D399),
        tint: AppColors.accent,
        child: Row(
          children: [
            const Text('✨', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.trialTitle,
                    style: t.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    l10n.trialSubtitle,
                    style: t.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.accentDeep,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                l10n.trialCta,
                textAlign: TextAlign.center,
                style: t.bodySmall?.copyWith(
                  color: const Color(0xFF04140D),
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
