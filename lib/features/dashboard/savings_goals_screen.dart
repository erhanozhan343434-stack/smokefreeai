import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';
import 'package:smokefree/features/paywall/paywall_screen.dart';
import 'package:smokefree/features/paywall/premium_status_provider.dart';

/// A free savings summary with an optional, user-initiated Premium upsell.
/// No paywall is shown on launch and the current savings balance remains free.
class SavingsGoalsScreen extends ConsumerWidget {
  const SavingsGoalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(nowProvider);
    final profile = ref.watch(quitProfileProvider);
    final savedMinor = moneyMinorOf(ref);
    final currency = NumberFormat.currency(
      locale: Localizations.localeOf(context).toString(),
      symbol: profile.currencyCode == 'TRY' ? '₺' : profile.currencyCode,
      decimalDigits: 0,
    );
    final premium = ref.watch(isPremiumProvider).asData?.value == true;
    return Scaffold(
      backgroundColor: AppColors.scene,
      appBar: AppBar(
        title: const Text('Birikim hedeflerim'),
        backgroundColor: AppColors.surface1,
        foregroundColor: AppColors.ink,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sigarasız kalarak biriktirdiğin para',
                    style: TextStyle(color: AppColors.ink2)),
                  const SizedBox(height: 10),
                  Text(currency.format(savedMinor / 100),
                    style: Theme.of(context).textTheme.headlineMedium
                        ?.copyWith(color: AppColors.accent)),
                  const SizedBox(height: 8),
                  const Text('Bu tutar her zaman ücretsiz.',
                    style: TextStyle(color: AppColors.ink2)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Birikimini bir hedefe dönüştür',
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(color: AppColors.ink)),
                  const SizedBox(height: 8),
                  const Text(
                    'Kendine bir ödül belirle, hedef tutarını takip et ve '
                    'gelecekteki tasarrufunu planla.',
                    style: TextStyle(color: AppColors.ink2)),
                  const SizedBox(height: 16),
                  if (premium)
                    const Text('Premium üyeliğin aktif. Kişisel hedef '
                      'oluşturma özelliği yakında eklenecek.',
                      style: TextStyle(color: AppColors.ink2))
                  else
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const PaywallScreen(),
                          ),
                        ),
                        icon: const Icon(Icons.lock_open_rounded),
                        label: const Text('Premium özelliklerini incele'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
