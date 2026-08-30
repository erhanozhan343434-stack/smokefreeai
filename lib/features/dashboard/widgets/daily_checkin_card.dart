import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/navigation/navigation_providers.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/domain/models/checkin_response.dart';
import 'package:smokefree/features/dashboard/checkin_providers.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';

/// Günlük kısa check-in kartı.
///
/// Yanıt ([CheckinResponse]) `CheckinLogs` tablosuna kaydedilir; aynı
/// (yerel) gün içinde tekrar sorulmaz — [todayCheckinProvider] bunu takip
/// eder.
class DailyCheckinCard extends ConsumerWidget {
  const DailyCheckinCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(nowProvider);

    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final days = abstinenceOf(ref).days;
    final todayCheckin = ref.watch(todayCheckinProvider);
    final body = todayCheckin.when(
      data: (answered) => answered != null
          ? _AnsweredNote(response: answered)
          : const _ResponseButtons(loading: false),
      loading: () => const _ResponseButtons(loading: true),
      error: (_, __) => const _ResponseButtons(loading: false),
    );

    return GlassCard(
      borderColor: const Color(0x3834D399),
      tint: AppColors.accent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.checkinTitle,
            style: t.labelSmall?.copyWith(color: AppColors.accent),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.checkinBody('$days'),
            style: t.bodyMedium?.copyWith(height: 1.4),
          ),
          const SizedBox(height: 12),
          body,
        ],
      ),
    );
  }
}

class _ResponseButtons extends ConsumerWidget {
  const _ResponseButtons({required this.loading});

  final bool loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.accentDeep,
              foregroundColor: const Color(0xFF04140D),
            ),
            onPressed: loading
                ? null
                : () async {
                    await ref
                        .read(todayCheckinProvider.notifier)
                        .respond(CheckinResponse.good);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.checkinSnackGood)),
                      );
                    }
                  },
            child: Text(l10n.checkinGood),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.ink2,
              side: const BorderSide(color: AppColors.lineStrong),
            ),
            onPressed: loading
                ? null
                : () async {
                    await ref
                        .read(todayCheckinProvider.notifier)
                        .respond(CheckinResponse.struggling);
                    ref.read(homeTabIndexProvider.notifier).select(2);
                  },
            child: Text(l10n.checkinStruggling),
          ),
        ),
      ],
    );
  }
}

class _AnsweredNote extends StatelessWidget {
  const _AnsweredNote({required this.response});

  final CheckinResponse response;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final isGood = response == CheckinResponse.good;

    return Row(
      children: [
        Icon(
          isGood ? Icons.check_circle : Icons.favorite,
          color: isGood ? AppColors.accent : AppColors.d5,
          size: 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            isGood ? l10n.checkinAnsweredGood : l10n.checkinAnsweredStruggling,
            style: t.bodySmall?.copyWith(color: AppColors.ink2),
          ),
        ),
      ],
    );
  }
}
