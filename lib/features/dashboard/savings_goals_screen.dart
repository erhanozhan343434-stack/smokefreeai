import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smokefree/core/config/purchases_ready_provider.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';
import 'package:smokefree/features/dashboard/savings_goal_progress.dart';
import 'package:smokefree/features/paywall/paywall_screen.dart';
import 'package:smokefree/features/paywall/premium_status_provider.dart';

/// Current balance is always free. Creating, storing and tracking a personal
/// savings goal requires a verified active Premium entitlement.
class SavingsGoalsScreen extends ConsumerStatefulWidget {
  const SavingsGoalsScreen({super.key});

  @override
  ConsumerState<SavingsGoalsScreen> createState() => _SavingsGoalsScreenState();
}

class _SavingsGoalsScreenState extends ConsumerState<SavingsGoalsScreen> {
  static const _titleKey = 'premium_savings_goal_title_v1';
  static const _amountKey = 'premium_savings_goal_minor_v1';

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  bool _loading = true;
  bool _saving = false;
  String? _goalTitle;
  int? _goalMinor;

  @override
  void initState() {
    super.initState();
    _loadGoal();
  }

  Future<void> _loadGoal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (!mounted) return;
      final amount = prefs.getInt(_amountKey);
      setState(() {
        _goalTitle = prefs.getString(_titleKey);
        _goalMinor = amount != null && amount > 0 ? amount : null;
        _loading = false;
      });
    } on Object {
      if (!mounted) return;
      setState(() => _loading = false);
      _notify('Kayıtlı hedef yüklenemedi.');
    }
  }

  void _notify(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _openPremium() async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const PaywallScreen()),
    );
    if (!mounted) return;
    // Re-check after purchase or restore, including when the user returns
    // without buying. Never infer Premium from navigation alone.
    ref.invalidate(isPremiumProvider);
  }

  Future<void> _editGoal() async {
    final title = _titleController;
    final amount = _amountController;
    title.text = _goalTitle ?? '';
    amount.text = _goalMinor == null ? '' : (_goalMinor! ~/ 100).toString();
    final result = await showDialog<({String title, int minor})>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Birikim hedefini belirle'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: title,
              maxLength: 60,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Hedefin (ör. tatil)',
              ),
            ),
            TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Hedef tutarı (tam para birimi)',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Vazgeç'),
          ),
          FilledButton(
            onPressed: () {
              final name = title.text.trim();
              final whole = int.tryParse(amount.text.trim());
              // Keep values in a safe range for minor-unit arithmetic.
              if (name.isEmpty || whole == null || whole <= 0 ||
                  whole > 100000000) {
                ScaffoldMessenger.of(dialogContext).showSnackBar(
                  const SnackBar(content: Text(
                    'Hedef adı ve geçerli, pozitif bir tutar gir.',
                  )),
                );
                return;
              }
              Navigator.pop(dialogContext, (title: name, minor: whole * 100));
            },
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
    if (result == null || !mounted) return;
    // Re-check the entitlement immediately before persisting.
    setState(() => _saving = true);
    try {
      ref.invalidate(isPremiumProvider);
      final active = await ref.read(isPremiumProvider.future);
      if (!active) {
        _notify('Hedef kaydetmek için aktif Premium üyelik gerekiyor.');
        return;
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_titleKey, result.title);
      final ok = await prefs.setInt(_amountKey, result.minor);
      if (!ok) throw StateError('Goal storage failed');
      if (!mounted) return;
      setState(() {
        _goalTitle = result.title;
        _goalMinor = result.minor;
      });
      _notify('Birikim hedefin kaydedildi.');
    } on Object {
      _notify('Hedef kaydedilemedi. Tekrar deneyebilirsin.');
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(nowProvider);
    final profile = ref.watch(quitProfileProvider);
    final savedMinor = moneyMinorOf(ref);
    final currency = NumberFormat.currency(
      locale: Localizations.localeOf(context).toString(),
      symbol: profile.currencyCode == 'TRY' ? '₺' : profile.currencyCode,
      decimalDigits: 0,
    );
    final purchasesReady = ref.watch(purchasesReadyProvider);
    final premiumStatus = purchasesReady ? ref.watch(isPremiumProvider) : null;
    final premium = premiumStatus?.asData?.value == true;
    final statusLoading = purchasesReady && premiumStatus?.isLoading == true;
    final statusError = purchasesReady && premiumStatus?.hasError == true;
    final goalMinor = _goalMinor;
    final progress = SavingsGoalProgress.fraction(
      savedMinor, goalMinor ?? 0,
    );

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
                  const Text('Kendine bir ödül belirle ve hedefine '
                    'ne kadar yaklaştığını takip et.',
                    style: TextStyle(color: AppColors.ink2)),
                  const SizedBox(height: 16),
                  if (_loading || statusLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (statusError)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Premium durumun doğrulanamadı. '
                          'Bağlantını kontrol edip tekrar dene.',
                          style: TextStyle(color: AppColors.ink2)),
                        TextButton(
                          onPressed: () => ref.invalidate(isPremiumProvider),
                          child: const Text('Tekrar dene'),
                        ),
                      ],
                    )
                  else if (premium) ...[
                    if (goalMinor != null && _goalTitle != null) ...[
                      Text(_goalTitle!,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.ink)),
                      const SizedBox(height: 8),
                      Text('${currency.format(savedMinor / 100)} / '
                        '${currency.format(goalMinor / 100)}',
                        style: const TextStyle(color: AppColors.ink2)),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(value: progress),
                      const SizedBox(height: 6),
                      Text('%${(progress * 100).round()} tamamlandı',
                        style: const TextStyle(color: AppColors.ink2)),
                      Text('Kalan: ${currency.format(
                        SavingsGoalProgress.remainingMinor(savedMinor, goalMinor) / 100,
                      )}', style: const TextStyle(color: AppColors.ink2)),
                      const SizedBox(height: 14),
                    ],
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _saving ? null : _editGoal,
                        icon: Icon(goalMinor == null
                            ? Icons.add_rounded : Icons.edit_rounded),
                        label: Text(goalMinor == null
                            ? 'Yeni hedef oluştur' : 'Hedefi düzenle'),
                      ),
                    ),
                  ] else ...[
                    const Text('Kişisel hedef oluşturma ve ilerleme '
                      'takibi Premium ile açılır.',
                      style: TextStyle(color: AppColors.ink2)),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _openPremium,
                        icon: const Icon(Icons.lock_open_rounded),
                        label: const Text('Premium özelliklerini incele'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
