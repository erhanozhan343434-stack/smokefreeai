import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/cinematic_background.dart';
import 'package:smokefree/domain/constants/health_facts.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';
import 'package:smokefree/features/timeline/milestone_copy.dart';

/// Sağlık iyileşme zaman çizelgesi.
///
/// Her taşın altında kaynağı görünür (WHO/CDC/NHS) — mağaza incelemesinde
/// sağlık iddialarının dayanağını gösteren şey budur.
class TimelineScreen extends ConsumerWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recovery = recoveryOf(ref);

    return Scaffold(
      backgroundColor: AppColors.scene,
      body: CinematicBackground(
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
            itemCount: recoveryTimeline.length + 1,
            itemBuilder: (context, i) {
              if (i == 0) return const _Header();
              final m = recoveryTimeline[i - 1];
              final idx = i - 1;
              final state = idx < recovery.unlocked
                  ? _MilestoneState.done
                  : idx == recovery.unlocked
                      ? _MilestoneState.now
                      : _MilestoneState.pending;
              return _MilestoneRow(
                milestone: m,
                state: state,
                isFirst: idx == 0,
                isLast: idx == recoveryTimeline.length - 1,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.timelineHeader, style: t.labelSmall),
          const SizedBox(height: 8),
          Text(
            l10n.timelineSubheader,
            style: t.titleLarge?.copyWith(fontSize: 22),
          ),
        ],
      ),
    );
  }
}

enum _MilestoneState { done, now, pending }

class _MilestoneRow extends StatelessWidget {
  const _MilestoneRow({
    required this.milestone,
    required this.state,
    required this.isFirst,
    required this.isLast,
  });

  final RecoveryMilestone milestone;
  final _MilestoneState state;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final done = state == _MilestoneState.done;
    final now = state == _MilestoneState.now;
    final title = milestoneTitle(l10n, milestone.key);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Expanded(
                  child: isFirst ? const SizedBox.shrink() : const _Rail(),
                ),
                _Node(done: done, now: now),
                Expanded(
                  child: isLast ? const SizedBox.shrink() : const _Rail(),
                ),
              ],
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    now ? l10n.timelineNowHere(title) : title,
                    style: t.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: now
                          ? AppColors.accent
                          : done
                              ? AppColors.ink
                              : AppColors.ink3,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    milestoneBody(l10n, milestone.key),
                    style: t.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.timelineSource(milestoneSourceLabel(milestone.source)),
                    style: t.bodySmall?.copyWith(
                      fontSize: 9.5,
                      color: AppColors.ink3.withValues(alpha: 0.65),
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Rail extends StatelessWidget {
  const _Rail();

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(width: 2, color: AppColors.line));
  }
}

class _Node extends StatelessWidget {
  const _Node({required this.done, required this.now});

  final bool done;
  final bool now;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: done ? AppColors.accentDeep : AppColors.surface2,
        border: Border.all(
          color: done || now ? AppColors.accent : AppColors.lineStrong,
          width: 1.5,
        ),
        boxShadow: done || now
            ? const [
                BoxShadow(color: AppColors.accentGlow, blurRadius: 12),
              ]
            : null,
      ),
      child: done
          ? const Icon(Icons.check, size: 12, color: Color(0xFF04120C))
          : null,
    );
  }
}
