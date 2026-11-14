import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:smokefree/core/config/purchases_ready_provider.dart';
import 'package:smokefree/core/format/duration_format.dart';
import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/cinematic_background.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';
import 'package:smokefree/features/dashboard/savings_goals_screen.dart';
import 'package:smokefree/features/dashboard/widgets/badge_strip_card.dart';
import 'package:smokefree/features/dashboard/widgets/daily_checkin_card.dart';
import 'package:smokefree/features/dashboard/widgets/hero_counter.dart';
import 'package:smokefree/features/dashboard/widgets/next_milestone_card.dart';
import 'package:smokefree/features/journey/premium_journey_screen.dart';
import 'package:smokefree/features/paywall/paywall_screen.dart';
import 'package:smokefree/features/paywall/premium_status_provider.dart';
import 'package:smokefree/features/paywall/widgets/trial_banner.dart';
import 'package:smokefree/features/ai_coach/ai_coach_screen.dart';
import 'package:smokefree/music_screen.dart';

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
            // iOS bouncing/stretching can leave this long, animated screen
            // visually displaced during rapid back-and-forth swipes.
            // Keep the scroll offset within its content bounds.
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            children: const [
              SizedBox(height: 8),
              _TrialBannerSlot(),
              SizedBox(height: 18),
              _OrbitStatCluster(),
              SizedBox(height: 16),
              _SavingsGoalsEntry(),
              SizedBox(height: 16),
              _PulsingSos(),
              SizedBox(height: 14),
              _MusicButton(),
              SizedBox(height: 22),
              NextMilestoneCard(),
              SizedBox(height: 12),
              BadgeStripCard(),
              SizedBox(height: 12),
              DailyCheckinCard(),
              SizedBox(height: 14),
              _MotivationJourneyEntry(),
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
class _TrialBannerSlot extends ConsumerWidget {
  const _TrialBannerSlot();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ready = ref.watch(purchasesReadyProvider);
    if (ready && ref.watch(isPremiumProvider).asData?.value == true) {
      return const SizedBox.shrink();
    }
    return TrialBanner(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => const PaywallScreen()),
      ),
    );
  }
}

class _SavingsGoalsEntry extends StatefulWidget {
  const _SavingsGoalsEntry();

  @override
  State<_SavingsGoalsEntry> createState() => _SavingsGoalsEntryState();
}

class _SavingsGoalsEntryState extends State<_SavingsGoalsEntry>
    with SingleTickerProviderStateMixin {
  late final AnimationController _light;

  @override
  void initState() {
    super.initState();
    _light = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    )..repeat();
  }

  @override
  void dispose() {
    _light.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTr = Localizations.localeOf(context).languageCode == 'tr';
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const SavingsGoalsScreen()),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF5B16C9),
                Color(0xFFA329F6),
                Color(0xFF6626DF),
              ],
            ),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFD1A4FF), width: 1.2),
            boxShadow: const [
              BoxShadow(
                color: Color(0x907C24DB),
                blurRadius: 22,
                offset: Offset(0, 7),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(21),
            child: Stack(
              children: [
                // Soft white sheen moves across the purple surface.
                // IgnorePointer keeps the entire button easy to tap.
                Positioned.fill(
                  child: IgnorePointer(
                    child: RepaintBoundary(
                      child: AnimatedBuilder(
                      animation: _light,
                      builder: (context, child) => LayoutBuilder(
                        builder: (context, constraints) {
                          final offset = (constraints.maxWidth + 160) *
                              _light.value - 100;
                          return Stack(
                            children: [
                              Positioned(
                                left: offset - 100,
                                top: -30,
                                bottom: -30,
                                width: 80,
                                child: Transform.rotate(
                                  angle: 0.28,
                                  child: const DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0x00FFFFFF),
                                          Color(0x55FFFFFF),
                                          Color(0x00FFFFFF),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17, vertical: 18,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0x36FFFFFF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.auto_awesome_rounded,
                          color: Colors.white, size: 27),
                      ),
                      const SizedBox(width: 13),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isTr
                                ? 'Birikim Hedeflerimi Keşfet'
                                : 'Explore My Savings Goals',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              isTr
                                ? 'Hayallerine ne kadar yaklaştığını gör'
                                : 'See how close you are to your dreams',
                              style: const TextStyle(
                                color: Color(0xFFF0DAFE),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white, size: 18),
                    ],
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

/// Four small circular counters orbit the larger smoke-free timer.
/// Numbers remain the same as the old 2x2 statistic grid; only the layout
/// changes. Sized with constraints to avoid clipping on smaller phones.
/// An optional upsell after useful free dashboard content, not in SOS.
class _MotivationJourneyEntry extends StatelessWidget {
  const _MotivationJourneyEntry();

  @override
  Widget build(BuildContext context) {
    final isTr = Localizations.localeOf(context).languageCode == 'tr';
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(19),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const PremiumJourneyScreen(),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: const Color(0xFF231835),
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: const Color(0xFF7349A2)),
          ),
          child: Row(
            children: [
              const Icon(Icons.route_rounded,
                color: Color(0xFFCA9BFF), size: 29),
              const SizedBox(width: 12),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isTr ? 'Kişisel motivasyon planım' :
                      'My personal motivation plan',
                    style: const TextStyle(
                      color: Colors.white, fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    isTr ? '7 ve 30 günlük görevleri keşfet' :
                      'Explore 7- and 30-day challenges',
                    style: const TextStyle(
                      color: Color(0xFFD7C3E8), fontSize: 12,
                    ),
                  ),
                ],
              )),
              const Icon(Icons.chevron_right_rounded,
                color: Color(0xFFCA9BFF)),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrbitStatCluster extends ConsumerWidget {
  const _OrbitStatCluster();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(nowProvider);
    final l10n = L10n.of(context);
    final locale = Localizations.localeOf(context).toString();
    final currency = ref.read(quitProfileProvider).currencyCode;
    final money = _money(currency, locale).format(moneyMinorOf(ref) / 100);
    final cigarettes = NumberFormat.decimalPattern(locale)
        .format(unitsOf(ref).floor());
    final life = lifeOf(ref);
    final recovery = recoveryOf(ref);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final compact = width < 340;
        final bubble = compact ? 82.0 : 96.0;
        final ring = compact ? 196.0 : 220.0;
        final clusterHeight = compact ? 288.0 : 318.0;
        final ringTop = (clusterHeight - ring) / 2;

        return Column(
          children: [
            SizedBox(
              height: clusterHeight,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: ringTop,
                    child: HeroCounter(
                      ringSize: ring,
                      showMilestones: false,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: _OrbitStatCircle(
                      key: const ValueKey('summary_money'),
                      diameter: bubble,
                      color: AppColors.d1,
                      icon: Icons.account_balance_wallet_outlined,
                      label: l10n.statMoneySavedLabel,
                      value: money,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: _OrbitStatCircle(
                      key: const ValueKey('summary_cigarettes'),
                      diameter: bubble,
                      color: AppColors.d2,
                      icon: Icons.smoke_free_rounded,
                      label: l10n.statUnitsAvoidedLabel,
                      value: cigarettes,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: _OrbitStatCircle(
                      key: const ValueKey('summary_life'),
                      diameter: bubble,
                      color: AppColors.d4,
                      icon: Icons.timelapse_rounded,
                      label: l10n.statLifeRegainedLabel,
                      value: life == null
                          ? '–'
                          : formatDurationShort(context, life),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: _OrbitStatCircle(
                      key: const ValueKey('summary_recovery'),
                      diameter: bubble,
                      color: AppColors.d3,
                      icon: Icons.favorite_outline_rounded,
                      label: l10n.statRecoveryLabel,
                      value: l10n.statRecoveryValue(
                        '${(recovery.progress * 100).round()}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.heroMilestonesProgress(
                '${recovery.unlocked}',
                '${recovery.total}',
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
      },
    );
  }
}

class _OrbitStatCircle extends StatelessWidget {
  const _OrbitStatCircle({
    required this.diameter,
    required this.color,
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  final double diameter;
  final Color color;
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$label: $value',
      child: Container(
        width: diameter,
        height: diameter,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF15202B),
          border: Border.all(color: color.withValues(alpha: 0.7)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.17),
              blurRadius: 14,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: diameter < 90 ? 15 : 18, color: color),
            const SizedBox(height: 3),
            SizedBox(
              height: diameter < 90 ? 23 : 27,
              child: Center(
                child: Text(
                  label.toUpperCase(),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFFB9C5D1),
                    fontSize: diameter < 90 ? 8 : 9,
                    fontWeight: FontWeight.w600,
                    height: 1.15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              width: diameter - 18,
              height: diameter < 90 ? 19 : 23,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Text(
                  value,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: diameter < 90 ? 17 : 21,
                    fontWeight: FontWeight.w800,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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


class _SosButton extends StatelessWidget {
  const _SosButton();

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const AiCoachScreen()),
        ),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Color(0x55DC2626),
                blurRadius: 18,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_rounded, color: Colors.white, size: 22),
              const SizedBox(width: 10),
              Flexible(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.sosHeader,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const Text(
                    'Sohbet et',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}


class _PulsingSos extends StatefulWidget {
  const _PulsingSos();

  @override
  State<_PulsingSos> createState() => _PulsingSosState();
}

class _PulsingSosState extends State<_PulsingSos>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _scale = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _scale, child: const _SosButton());
  }
}

class _MusicButton extends StatelessWidget {
  const _MusicButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const MusicScreen()),
        ),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0x228B5CF6),
            border: Border.all(color: const Color(0x668B5CF6)),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.music_note_rounded, color: Color(0xFFC4B5FD), size: 22),
              SizedBox(width: 10),
              Flexible(child: Text(
                'Sakinleştirici müzik',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
