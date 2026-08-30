import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:smokefree/core/format/duration_format.dart';
import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/cinematic_background.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';
import 'package:smokefree/features/dashboard/widgets/badge_strip_card.dart';
import 'package:smokefree/features/dashboard/widgets/daily_checkin_card.dart';
import 'package:smokefree/features/dashboard/widgets/hero_counter.dart';
import 'package:smokefree/features/dashboard/widgets/next_milestone_card.dart';
import 'package:smokefree/features/dashboard/widgets/stat_card.dart';
import 'package:smokefree/features/paywall/paywall_screen.dart';
import 'package:smokefree/features/paywall/widgets/trial_banner.dart';

/// Ana ekran.
///
/// İskelet `StatelessWidget`'tır ve tick'i İZLEMEZ. Yalnızca canlı
/// değeri olan alt widget'lar `ConsumerWidget`'tır. Böylece saniyede bir
/// yeniden boyanan alan ekranın küçük bir bölümüdür.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scene,
      body: CinematicBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            children: const [
              SizedBox(height: 8),
              _TrialBannerSlot(),
              SizedBox(height: 18),
              HeroCounter(),
              SizedBox(height: 22),
              _StatGrid(),
              SizedBox(height: 14),
              NextMilestoneCard(),
              SizedBox(height: 12),
              BadgeStripCard(),
              SizedBox(height: 12),
              DailyCheckinCard(),
              SizedBox(height: 22),
              _CounterfactualPanel(),
              SizedBox(height: 22),
              _Disclaimer(),
            ],
          ),
        ),
      ),
    );
  }
}

/// [TrialBanner]'ı somut bir dokunma davranışıyla saran özel widget.
///
/// Dokununca [PaywallScreen]'i açar — RevenueCat henüz kurulmadıysa o
/// ekran dürüst bir "yakında" mesajı gösterir, burada sessizce hiçbir
/// şey yapılmaz diye bir durum yoktur.
class _TrialBannerSlot extends StatelessWidget {
  const _TrialBannerSlot();

  @override
  Widget build(BuildContext context) {
    return TrialBanner(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => const PaywallScreen()),
      ),
    );
  }
}

class _StatGrid extends ConsumerWidget {
  const _StatGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(nowProvider);

    final l10n = L10n.of(context);
    final localeTag = Localizations.localeOf(context).toString();
    final money = _money(ref.read(quitProfileProvider).currencyCode, localeTag)
        .format(moneyMinorOf(ref) / 100);
    final units =
        NumberFormat.decimalPattern(localeTag).format(unitsOf(ref).floor());
    final life = lifeOf(ref);
    final recovery = recoveryOf(ref);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                label: l10n.statMoneySavedLabel,
                value: money,
                dotColor: AppColors.d1,
                sub: l10n.statMoneySavedSub,
              ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: StatCard(
                label: l10n.statUnitsAvoidedLabel,
                value: units,
                dotColor: AppColors.d2,
                sub: l10n.statUnitsAvoidedSub,
              ),
            ),
          ],
        ),
        const SizedBox(height: 11),
        Row(
          children: [
            Expanded(
              child: life == null
                  ? PendingSourceCard(label: l10n.statLifeRegainedLabel)
                  : StatCard(
                      label: l10n.statLifeRegainedLabel,
                      value: formatDurationShort(context, life),
                      dotColor: AppColors.d4,
                      sub: l10n.statLifeRegainedSub,
                    ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: StatCard(
                label: l10n.statRecoveryLabel,
                value: l10n.statRecoveryValue(
                  '${(recovery.progress * 100).round()}',
                ),
                dotColor: AppColors.d3,
                sub: l10n.statRecoverySub(
                  '${recovery.unlocked}',
                  '${recovery.total}',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CounterfactualPanel extends ConsumerWidget {
  const _CounterfactualPanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(nowProvider);

    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final localeTag = Localizations.localeOf(context).toString();
    final loss = lossOf(ref);
    final code = ref.read(quitProfileProvider).currencyCode;
    final money = _money(code, localeTag).format(loss.moneyMinor / 100);
    final units =
        NumberFormat.decimalPattern(localeTag).format(loss.units.floor());
    final life = loss.lifeLost;

    return GlassCard(
      tint: AppColors.d5,
      borderColor: const Color(0x38DC2626),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.counterfactualTitle,
            style: t.labelSmall?.copyWith(color: const Color(0xFFFCA5A5)),
          ),
          const SizedBox(height: 9),
          Text(
            l10n.counterfactualUnits(units),
            style: t.titleLarge?.copyWith(color: const Color(0xFFFCA5A5)),
          ),
          const SizedBox(height: 4),
          Text(
            life == null
                ? l10n.counterfactualMoneyOnly(money)
                : l10n.counterfactualMoneyAndLife(
                    money,
                    formatDurationShort(context, life),
                  ),
            style: t.bodySmall?.copyWith(color: const Color(0xBFFCA5A5)),
          ),
        ],
      ),
    );
  }
}

class _Disclaimer extends StatelessWidget {
  const _Disclaimer();

  @override
  Widget build(BuildContext context) {
    return Text(
      L10n.of(context).disclaimerMedical,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.5),
    );
  }
}

NumberFormat _money(String currencyCode, String localeTag) =>
    NumberFormat.currency(
      locale: localeTag,
      symbol: currencyCode == 'TRY' ? '₺' : currencyCode,
      decimalDigits: 0,
    );
