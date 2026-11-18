import 'package:flutter/material.dart';

import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/glass_card.dart';

/// Ana sayfadaki deneme fırsatı tanıtımı.
/// Denemenin kullanıcıya uygunluğu ve kesin fiyat mağaza ekranında doğrulanır.
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
        borderColor: const Color(0x6634D399),
        tint: AppColors.accent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Icons.auto_awesome, color: Color(0xFF34D399), size: 21),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'SMOKEFREE AI PREMIUM',
                    style: t.labelMedium?.copyWith(
                      color: const Color(0xFF68E4B7),
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '3 Gün Ücretsiz Deneme Fırsatı',
              style: t.titleMedium?.copyWith(
                color: AppColors.ink,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'AI koç, sınırsız SOS desteği ve sağlık takibini keşfet.',
              style: t.bodySmall?.copyWith(color: AppColors.ink2),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.accentDeep,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.card_giftcard, color: Color(0xFF04140D), size: 20),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      '3 Gün Ücretsiz Dene',
                      textAlign: TextAlign.center,
                      style: t.titleSmall?.copyWith(
                        color: const Color(0xFF04140D),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, color: Color(0xFF04140D), size: 19),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Uygun yeni aboneler için. Deneme sonrası seçilen plan ücretlendirilir; koşullar ödeme öncesi gösterilir.',
              textAlign: TextAlign.center,
              style: t.bodySmall?.copyWith(
                color: AppColors.ink2,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
