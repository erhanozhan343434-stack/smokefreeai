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

class _SavingsGoalsScreenState extends ConsumerState<SavingsGoalsScreen>
    with SingleTickerProviderStateMixin {
  static const _titleKey = 'premium_savings_goal_title_v1';
  static const _amountKey = 'premium_savings_goal_minor_v1';

  late final AnimationController _moneyFall;

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  bool _loading = true;
  bool _saving = false;
  String? _goalTitle;
  int? _goalMinor;

  @override
  void initState() {
    super.initState();
    _moneyFall = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 2900),
    )..forward();
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Localizations.localeOf(dialogContext).languageCode == 'tr'
                    ? 'Hızlı hedef seç veya kendin yaz'
                    : 'Choose an idea or create your own',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 9),
            Wrap(
              spacing: 7,
              runSpacing: 7,
              children: [
                for (final item in <({String tr, String en, IconData icon})>[
                  (tr: 'Tatil', en: 'Holiday', icon: Icons.beach_access_rounded),
                  (tr: 'Telefon', en: 'Phone', icon: Icons.smartphone_rounded),
                  (tr: 'Kendime hediye', en: 'A gift', icon: Icons.card_giftcard),
                  (tr: 'Başka bir hedef', en: 'Other goal',
                    icon: Icons.flag_outlined),
                ])
                  ActionChip(
                    avatar: Icon(item.icon, size: 17),
                    label: Text(
                      Localizations.localeOf(dialogContext).languageCode == 'tr'
                          ? item.tr : item.en,
                    ),
                    onPressed: () => title.text =
                        Localizations.localeOf(dialogContext).languageCode == 'tr'
                            ? item.tr : item.en,
                  ),
              ],
            ),
            const SizedBox(height: 12),
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
    _moneyFall.dispose();
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
    final progress = SavingsGoalProgress.fraction(savedMinor, goalMinor ?? 0);
    final isTr = Localizations.localeOf(context).languageCode == 'tr';
    final saved = currency.format(savedMinor / 100);
    const mint = Color(0xFF34D399);
    const muted = Color(0xFFACBAC5);
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Colors.white, fontWeight: FontWeight.w800,
    );

    return Scaffold(
      backgroundColor: AppColors.scene,
      appBar: AppBar(
        title: Text(isTr ? 'Birikim hedeflerim' : 'My savings goals'),
        centerTitle: true,
        backgroundColor: AppColors.scene,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 36),
          children: [
            Container(
              padding: const EdgeInsets.all(23),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                  colors: [Color(0xFF15352F), Color(0xFF101A24)],
                ),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: const Color(0x7734D399)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(Icons.account_balance_wallet_outlined, color: mint, size: 22),
                    const SizedBox(width: 9),
                    Expanded(child: Text(
                      isTr ? 'Sigarasız hayatın kazancı' : 'What quitting has saved you',
                      style: const TextStyle(
                        color: Color(0xFFE2F5EB), fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ]),
                  const SizedBox(height: 14),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(saved, style: const TextStyle(
                      color: Colors.white, fontSize: 44,
                      fontWeight: FontWeight.w800,
                      fontFeatures: [FontFeature.tabularFigures()],
                    )),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isTr
                      ? 'Her içmediğin sigara seni istediğin hayata biraz daha yaklaştırıyor.'
                      : 'Every cigarette you skip brings your next goal a little closer.',
                    style: const TextStyle(
                      color: Color(0xFFD0DED9), fontSize: 14, height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(children: [
                    const Icon(Icons.check_circle_outline, color: mint, size: 17),
                    const SizedBox(width: 7),
                    Expanded(child: Text(
                      isTr ? 'Birikim sayacın her zaman ücretsiz.' :
                        'Your savings counter is always free.',
                      style: const TextStyle(
                        color: Color(0xFFC0D5CD), fontSize: 12,
                      ),
                    )),
                  ]),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Text(
              isTr ? 'Biriktirdiğin paranın bir amacı olsun.'
                   : 'Give your savings a purpose.',
              style: titleStyle,
            ),
            const SizedBox(height: 8),
            Text(
              isTr
                ? 'Bir tatil, yeni bir telefon ya da kendine vereceğin küçük bir ödül… '
                  'Sigarayı bırakırken neye yaklaştığını gör.'
                : 'A holiday, a new phone or a treat for yourself. '
                  'See what your smoke-free days are bringing you closer to.',
              style: const TextStyle(color: muted, fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 18),
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_loading || statusLoading)
                    const Center(child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(color: mint),
                    ))
                  else if (statusError) ...[
                    Text(
                      isTr ? 'Üyelik durumunu şu anda doğrulayamadık.' :
                        'We could not verify your membership just now.',
                      style: const TextStyle(color: muted),
                    ),
                    const SizedBox(height: 10),
                    TextButton.icon(
                      onPressed: () => ref.invalidate(isPremiumProvider),
                      icon: const Icon(Icons.refresh),
                      label: Text(isTr ? 'Tekrar dene' : 'Try again'),
                    ),
                  ] else if (premium) ...[
                    Row(children: [
                      const Icon(Icons.flag_rounded, color: mint),
                      const SizedBox(width: 10),
                      Expanded(child: Text(
                        goalMinor == null
                          ? (isTr ? 'İlk hedefini belirle' : 'Set your first goal')
                          : (_goalTitle ?? (isTr ? 'Hedefim' : 'My goal')),
                        style: const TextStyle(
                          fontSize: 19, color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      )),
                    ]),
                    const SizedBox(height: 13),
                    if (goalMinor != null && _goalTitle != null) ...[
                      Text(
                        '${currency.format(savedMinor / 100)} / ${currency.format(goalMinor / 100)}',
                        style: const TextStyle(
                          color: Color(0xFFE3F7EF), fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 12,
                          color: mint,
                          backgroundColor: const Color(0xFF294039),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        isTr
                          ? '%${(progress * 100).round()} tamamlandı • ${currency.format(SavingsGoalProgress.remainingMinor(savedMinor, goalMinor) / 100)} kaldı'
                          : '${(progress * 100).round()}% complete • ${currency.format(SavingsGoalProgress.remainingMinor(savedMinor, goalMinor) / 100)} to go',
                        style: const TextStyle(color: muted, fontSize: 13),
                      ),
                    ] else
                      Text(
                        isTr ? 'Ne için biriktirmek istediğini seç. '
                          'İlerlemen sigarasız kaldıkça otomatik güncellensin.'
                          : 'Choose what you want to save for. Your progress '
                            'updates as your smoke-free days add up.',
                        style: const TextStyle(
                          color: muted, fontSize: 14, height: 1.45,
                        ),
                      ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _saving ? null : _editGoal,
                        icon: Icon(goalMinor == null
                          ? Icons.add_circle_outline_rounded
                          : Icons.edit_outlined),
                        label: Text(goalMinor == null
                          ? (isTr ? 'Hedefimi oluştur' : 'Create my goal')
                          : (isTr ? 'Hedefimi düzenle' : 'Edit my goal')),
                        style: FilledButton.styleFrom(
                          backgroundColor: mint,
                          foregroundColor: const Color(0xFF061B16),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: const Color(0x2234D399),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.lock_outline_rounded,
                          color: mint, size: 21),
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Text(
                        isTr ? 'Hedef takibini Premium ile aç'
                             : 'Unlock goal tracking with Premium',
                        style: const TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w800, fontSize: 17),
                      )),
                    ]),
                    const SizedBox(height: 15),
                    Text(
                      isTr ? 'Örnek hedef: Hayalindeki tatil'
                           : 'Example goal: Your dream holiday',
                      style: const TextStyle(
                        color: Color(0xFFE8EDF1), fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF16232A),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFF30414A)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(Icons.beach_access_rounded,
                              color: Color(0xFFFFD38B), size: 22),
                            const SizedBox(width: 10),
                            Expanded(child: Text(
                              isTr ? 'Kendi hedefini seç' : 'Choose your reward',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                            const Icon(Icons.lock_rounded,
                              color: Color(0xFF93A5AF), size: 17),
                          ]),
                          const SizedBox(height: 14),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const LinearProgressIndicator(
                              value: 0.34, minHeight: 9,
                              color: Color(0xFF34D399),
                              backgroundColor: Color(0xFF30414A),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            isTr ? 'Örnek görünüm • Gerçek ilerlemen hedef oluşturunca hesaplanır'
                                 : 'Illustration • Your actual progress starts with your goal',
                            style: const TextStyle(
                              color: muted, fontSize: 11, height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _openPremium,
                        icon: const Icon(Icons.arrow_forward_rounded),
                        label: Text(isTr ? 'Hedefimi oluşturmaya başla'
                                         : 'Start building my goal'),
                        style: FilledButton.styleFrom(
                          backgroundColor: mint,
                          foregroundColor: const Color(0xFF061B16),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(child: Text(
                      isTr ? 'Önce Premium seçeneklerini göreceksin. '
                        'Onayın olmadan ödeme yapılmaz.'
                        : 'Review Premium options first. '
                          'No charge without your confirmation.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: muted, fontSize: 12,
                        height: 1.4),
                    )),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 22),
            Text(
              isTr ? 'Nasıl çalışır?' : 'How it works',
              style: titleStyle,
            ),
            const SizedBox(height: 12),
            _step(
              Icons.card_giftcard_outlined,
              isTr ? 'Kendine bir ödül seç' : 'Pick a reward',
              isTr ? 'Ulaşmak istediğin hedefin adını ve tutarını belirle.'
                   : 'Set a name and amount for something you want.',
            ),
            const SizedBox(height: 10),
            _step(
              Icons.trending_up_rounded,
              isTr ? 'İlerlemeni gör' : 'See your progress',
              isTr ? 'Sigarasız günlerinden doğan birikim otomatik hesaplansın.'
                   : 'Your estimated savings update as smoke-free days pass.',
            ),
            const SizedBox(height: 10),
            _step(
              Icons.celebration_outlined,
              isTr ? 'Motivasyonunu canlı tut' : 'Keep your motivation close',
              isTr ? 'Zor bir anda neden başladığını kendine hatırlat.'
                   : 'Remember what you are working towards on harder days.',
            ),
            const SizedBox(height: 18),
            Text(
              isTr ? 'Birikim tutarları sigara harcama bilgilerine dayanan '
                'tahmini hesaplamalardır; hesabına para aktarılmaz.'
                : 'Savings are estimates based on your smoking costs. '
                  'No money is transferred to an account.',
              style: const TextStyle(
                color: Color(0xFF82949E), fontSize: 11, height: 1.45,
              ),
            ),
          ],
            ),
            // A short asymmetric banknote shower. Decorative and non-interactive.
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedBuilder(
                  animation: _moneyFall,
                  builder: (context, child) {
                    if (_moneyFall.isCompleted) return const SizedBox.shrink();
                    return LayoutBuilder(
                      builder: (context, bounds) {
                        final time = _moneyFall.value;
                        // Different horizontal origins, delays, speeds and drifts
                        // create a natural rather than sequential fall.
                        const origins = <double>[
                          0.72, 0.08, 0.48, 0.88, 0.29,
                          0.61, 0.17, 0.81, 0.38,
                        ];
                        const delays = <double>[
                          0.00, 0.17, 0.06, 0.26, 0.11,
                          0.35, 0.21, 0.02, 0.31,
                        ];
                        const drifts = <double>[
                          -28, 19, -12, -36, 22, -17, 31, -22, 13,
                        ];
                        return Stack(
                          children: List.generate(origins.length, (i) {
                            final local = ((time - delays[i]) /
                                    (0.80 - delays[i]))
                                .clamp(0.0, 1.0);
                            if (local <= 0 || local >= 1) {
                              return const SizedBox.shrink();
                            }
                            final eased = Curves.easeInOutSine.transform(local);
                            final opacity = local < 0.18
                                ? (local / 0.18) * 0.87
                                : ((1 - local) / 0.82 * 0.87)
                                    .clamp(0.0, 0.87);
                            final x = (bounds.maxWidth - 72) * origins[i] +
                                drifts[i] * eased;
                            final y = -55 + (bounds.maxHeight + 90) * eased;
                            return Positioned(
                              left: x,
                              top: y,
                              child: Opacity(
                                opacity: opacity,
                                child: Transform.rotate(
                                  angle: (i.isEven ? 1 : -1) *
                                      (0.12 + eased * 0.38),
                                  child: const _FallingBanknote(),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _step(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF142029),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFF283640)),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: const Color(0xFF34D399), size: 24),
        const SizedBox(width: 13),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14,
            )),
            const SizedBox(height: 4),
            Text(description, style: const TextStyle(
              color: Color(0xFFACBAC5), fontSize: 12.5, height: 1.4,
            )),
          ],
        )),
      ]),
    );
  }

}

/// A stylised large banknote, not a coin or generic savings icon.
class _FallingBanknote extends StatelessWidget {
  const _FallingBanknote();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFC5E9AE),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF427E53), width: 1.5),
        boxShadow: const [
          BoxShadow(color: Color(0x6650A76A), blurRadius: 8),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('₺', style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: Color(0xFF30633B),
          )),
          Container(
            width: 25,
            height: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF579365), width: 1.5),
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              size: 15,
              color: Color(0xFF437F51),
            ),
          ),
          const Text('₺', style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: Color(0xFF30633B),
          )),
        ],
      ),
    );
  }
}
