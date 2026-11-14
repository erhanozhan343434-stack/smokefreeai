import 'package:flutter/material.dart';

import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/glass_card.dart';

/// "3 gün ücretsiz dene" çağrı-to-action banner'ı.
///
/// Satın alma ekranına yönlendiren banner. Gerçek teklif uygunluğu ve
/// ücretlendirme bilgileri mağaza ekranında doğrulanmalıdır.
class TrialBanner extends StatelessWidget {
  const TrialBanner({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: GlassCard(
        borderColor: const Color(0x3834D399),
        tint: AppColors.accent,
        child: LayoutBuilder(
          builder: (context, constraints) => constraints.maxWidth < 290
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Zor anlarında desteğin yanında',
                    style: t.bodyMedium?.copyWith(
                      color: AppColors.ink, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 5),
                  Text('AI koçu, SOS ve sağlık takibi',
                    style: t.bodySmall?.copyWith(color: AppColors.ink2)),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.accentDeep,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text('Premium’u keşfet',
                        style: t.bodySmall?.copyWith(
                          color: const Color(0xFF04140D),
                          fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              )
            : Row(
          children: [
            const Text('✨', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Zor anlarında desteğin yanında',
                    style: t.bodyMedium?.copyWith(color: AppColors.ink, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'AI koçu, sınırsız SOS ve sağlık takibi',
                    style: t.bodySmall?.copyWith(color: AppColors.ink2),
                    maxLines: 2,
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
                'Premium’u keşfet',
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
      ),
    );
  }
}
