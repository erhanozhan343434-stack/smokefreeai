import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smokefree/core/config/purchases_ready_provider.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/features/paywall/paywall_screen.dart';
import 'package:smokefree/features/paywall/premium_status_provider.dart';

/// A local-only, optional motivation tool. Basic SOS/craving logging remain free.
/// No claims of medical effectiveness or automated push notifications.
class PremiumJourneyScreen extends ConsumerStatefulWidget {
  const PremiumJourneyScreen({super.key});

  @override
  ConsumerState<PremiumJourneyScreen> createState() =>
      _PremiumJourneyScreenState();
}

class _PremiumJourneyScreenState
    extends ConsumerState<PremiumJourneyScreen> {
  static const _triggerKey = 'premium_journey_trigger_v1';
  static const _dayKeyPrefix = 'premium_journey_done_v1_';

  static const triggers = ['stress', 'coffee', 'meal', 'social', 'boredom'];
  String? _trigger;
  int _planLength = 7;
  Set<int> _completed = {};
  bool _loading = true;
  bool _saving = false;

  bool get _isTr => Localizations.localeOf(context).languageCode == 'tr';
  String _copy(String tr, String en) => _isTr ? tr : en;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (!mounted) return;
      setState(() {
        _trigger = prefs.getString(_triggerKey);
        _completed = (prefs.getStringList('${_dayKeyPrefix}7') ?? [])
            .map(int.tryParse)
            .whereType<int>()
            .toSet();
        _loading = false;
      });
    } on Object {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _changeLength(int days) async {
    if (_saving || _planLength == days) return;
    setState(() {
      _planLength = days;
      _loading = true;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      final stored = prefs.getStringList('$_dayKeyPrefix$days') ?? [];
      if (!mounted) return;
      setState(() {
        _completed = stored.map(int.tryParse).whereType<int>().toSet();
      });
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _selectTrigger(String trigger) async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      // Verify entitlement before storing premium-specific preferences.
      ref.invalidate(isPremiumProvider);
      if (!await ref.read(isPremiumProvider.future)) return;
      final prefs = await SharedPreferences.getInstance();
      if (!await prefs.setString(_triggerKey, trigger)) {
        throw StateError('Failed to save trigger');
      }
      if (mounted) setState(() => _trigger = trigger);
    } on Object {
      if (mounted) _error();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _toggleDay(int day) async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      ref.invalidate(isPremiumProvider);
      if (!await ref.read(isPremiumProvider.future)) return;
      final next = {..._completed};
      if (!next.add(day)) next.remove(day);
      final prefs = await SharedPreferences.getInstance();
      if (!await prefs.setStringList(
        '$_dayKeyPrefix$_planLength',
        next.map((d) => '$d').toList()..sort(),
      )) {
        throw StateError('Failed to save progress');
      }
      if (mounted) setState(() => _completed = next);
    } on Object {
      if (mounted) _error();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  void _error() => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(_copy(
      'Kaydedilemedi. Tekrar deneyebilirsin.',
      'Could not save. Please try again.',
    ))),
  );

  String _triggerName(String id) => switch (id) {
    'stress' => _copy('Stres', 'Stress'),
    'coffee' => _copy('Kahve', 'Coffee'),
    'meal' => _copy('Yemek sonrası', 'After meals'),
    'social' => _copy('Sosyal ortam', 'Social situations'),
    _ => _copy('Can sıkıntısı', 'Boredom'),
  };

  String _triggerAdvice(String? id) => switch (id) {
    'stress' => _copy(
      'Zor anlarda kısa bir mola ver, nefesine odaklan ve ortamını değiştir.',
      'Take a short break, focus on breathing, and change your surroundings.',
    ),
    'coffee' => _copy(
      'Kahve rutinine yeni bir eşlikçi ekle: kısa yürüyüş veya su molası.',
      'Pair your coffee with a new ritual, like a short walk or water break.',
    ),
    'meal' => _copy(
      'Yemekten sonra hemen kalkıp kısa bir yürüyüş yapmayı dene.',
      'Try standing up and taking a short walk after eating.',
    ),
    'social' => _copy(
      'Önceden nazik bir ret cümlesi hazırla ve gerekirse kısa bir mola ver.',
      'Prepare a simple way to say no, and step outside if needed.',
    ),
    'boredom' => _copy(
      'Ellerini ve zihnini meşgul edecek kısa bir alternatif seç.',
      'Choose a quick activity that occupies your hands and mind.',
    ),
    _ => _copy(
      'En zorlandığın zamanı seç; sana uygun küçük adımları gösterelim.',
      'Pick your toughest trigger to see a useful small-step plan.',
    ),
  };

  static const _stepsTr = [
    'Bugün neden bırakmak istediğini tek cümleyle hatırla.',
    'Bir tetikleyicini fark et ve kısa bir alternatif belirle.',
    'Sigarasız bir mola rutini oluştur.',
    'İlerlemeni kontrol et ve küçük bir başarını kutla.',
    'Zor bir an için destek alabileceğin bir kişiyi düşün.',
    'Sigaraya ayırmadığın zamanla keyifli bir şey yap.',
    'Bir sonraki haftan için gerçekçi bir hedef yaz.',
  ];

  static const _stepsEn = [
    'Remind yourself why you chose to quit in one sentence.',
    'Notice one trigger and plan a small alternative.',
    'Build a smoke-free break ritual.',
    'Check your progress and celebrate a small win.',
    'Think of someone you can reach out to when things get tough.',
    'Do something you enjoy with the time you have gained.',
    'Choose one realistic goal for your next week.',
  ];

  String _stepFor(int day) {
    final steps = _isTr ? _stepsTr : _stepsEn;
    final index = (day - 1) % steps.length;
    if (day <= 7) return steps[index];
    return _copy(
      '${steps[index]} Bu alışkanlığı sürdürmek için küçük bir adım daha at.',
      '${steps[index]} Take one more small step to keep the habit going.',
    );
  }

  @override
  Widget build(BuildContext context) {
    final ready = ref.watch(purchasesReadyProvider);
    final status = ready ? ref.watch(isPremiumProvider) : null;
    final premium = status?.asData?.value == true;
    final checking = ready && status?.isLoading == true;
    final failed = ready && status?.hasError == true;
    const purple = Color(0xFFAD68F7);
    const ink = Color(0xFFEDECF6);

    return Scaffold(
      backgroundColor: AppColors.scene,
      appBar: AppBar(
        backgroundColor: AppColors.scene,
        foregroundColor: ink,
        title: Text(_copy('Motivasyon yolculuğum', 'My motivation journey')),
      ),
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 38),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3E1A67), Color(0xFF151C2B)],
                ),
                border: Border.all(color: const Color(0xFF8151B5)),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.auto_awesome_rounded,
                    color: purple, size: 30),
                  const SizedBox(height: 12),
                  Text(
                    _copy('Her gün küçük bir adım, kendi hızında.',
                      'One small step each day, at your pace.'),
                    style: const TextStyle(
                      color: Colors.white, fontSize: 23,
                      fontWeight: FontWeight.w800, height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 11),
                  Text(
                    _copy(
                      'Kendi tetikleyicilerini tanı ve 7 veya 30 günlük motivasyon '
                      'görevlerini takip et.',
                      'Understand your triggers and follow 7- or 30-day '
                      'motivation tasks.',
                    ),
                    style: const TextStyle(
                      color: Color(0xFFD8CDE5), height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            if (!ready || checking || _loading)
              const Center(child: Padding(
                padding: EdgeInsets.all(24),
                child: CircularProgressIndicator(color: purple),
              ))
            else if (failed)
              OutlinedButton.icon(
                onPressed: () => ref.invalidate(isPremiumProvider),
                icon: const Icon(Icons.refresh),
                label: Text(_copy('Üyeliği tekrar kontrol et',
                                  'Retry membership check')),
              )
            else if (!premium) ...[
              _card(
                icon: Icons.lock_open_rounded,
                title: _copy('Kişisel planını Premium ile aç',
                             'Unlock your personal plan with Premium'),
                detail: _copy(
                  'Temel SOS desteği ve sigara isteği kaydı ücretsiz kalır. '
                  'Premium ile tetikleyicine özel öneriler ve günlük '
                  'motivasyon takibi açılır.',
                  'Basic SOS support and craving logging stay free. '
                  'Premium adds trigger-based tips and daily motivation tracking.',
                ),
              ),
              const SizedBox(height: 14),
              FilledButton.icon(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (_) => const PaywallScreen(),
                  ));
                  ref.invalidate(isPremiumProvider);
                },
                icon: const Icon(Icons.auto_awesome),
                label: Text(_copy('Premium seçeneklerini gör',
                                  'See Premium options')),
                style: FilledButton.styleFrom(
                  backgroundColor: purple,
                  foregroundColor: const Color(0xFF130C20),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ] else ...[
              Text(_copy('Beni en çok ne tetikliyor?',
                         'What triggers me most?'),
                style: const TextStyle(
                  color: ink, fontSize: 19, fontWeight: FontWeight.w800,
                )),
              const SizedBox(height: 11),
              Wrap(
                spacing: 8, runSpacing: 8,
                children: triggers.map((id) => ChoiceChip(
                  selected: _trigger == id,
                  onSelected: _saving ? null : (_) => _selectTrigger(id),
                  label: Text(_triggerName(id)),
                  selectedColor: purple,
                )).toList(),
              ),
              const SizedBox(height: 13),
              _card(
                icon: Icons.lightbulb_outline,
                title: _copy('Kişisel küçük adım', 'Your small step'),
                detail: _triggerAdvice(_trigger),
              ),
              const SizedBox(height: 25),
              Text(_copy('Günlük motivasyon programım',
                         'My daily motivation plan'),
                style: const TextStyle(
                  color: ink, fontSize: 19, fontWeight: FontWeight.w800,
                )),
              const SizedBox(height: 10),
              SegmentedButton<int>(
                segments: [
                  ButtonSegment(
                    value: 7, label: Text(_copy('7 gün', '7 days')),
                  ),
                  ButtonSegment(
                    value: 30, label: Text(_copy('30 gün', '30 days')),
                  ),
                ],
                selected: {_planLength},
                onSelectionChanged: (selection) =>
                    _changeLength(selection.single),
              ),
              const SizedBox(height: 13),
              LinearProgressIndicator(
                value: _completed.length / _planLength,
                color: purple,
                backgroundColor: const Color(0xFF293040),
                minHeight: 9,
                borderRadius: BorderRadius.circular(6),
              ),
              const SizedBox(height: 8),
              Text(
                _copy(
                  '${_completed.length} / $_planLength görev tamamlandı',
                  '${_completed.length} / $_planLength tasks completed',
                ),
                style: const TextStyle(color: Color(0xFFBBC0D5)),
              ),
              const SizedBox(height: 13),
              for (var day = 1; day <= _planLength; day++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CheckboxListTile(
                    key: ValueKey('journey_day_$day'),
                    value: _completed.contains(day),
                    onChanged: _saving ? null : (_) => _toggleDay(day),
                    activeColor: purple,
                    title: Text(
                      _copy('Gün $day', 'Day $day'),
                      style: const TextStyle(
                        color: ink, fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(_stepFor(day),
                      style: const TextStyle(
                        color: Color(0xFFBFC4CF), height: 1.4,
                      )),
                    controlAffinity: ListTileControlAffinity.leading,
                    tileColor: const Color(0xFF171D2C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: const BorderSide(color: Color(0xFF30384A)),
                    ),
                  ),
                ),
            ],
            const SizedBox(height: 18),
            Text(
              _copy(
                'Bu araç motivasyon amaçlıdır; tıbbi danışmanlık veya tedavi '
                'yerine geçmez. Zorlandığında SOS ekranındaki ücretsiz '
                'desteği kullanabilirsin.',
                'This tool is for motivation, not medical advice or treatment. '
                'Free support remains available on the SOS screen.',
              ),
              style: const TextStyle(
                color: Color(0xFF9AA5B5), fontSize: 12, height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({
    required IconData icon,
    required String title,
    required String detail,
  }) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: const Color(0xFF171D2C),
      border: Border.all(color: const Color(0xFF3B3C54)),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(icon, color: const Color(0xFFAD68F7)),
          const SizedBox(width: 10),
          Expanded(child: Text(title, style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800, fontSize: 16,
          ))),
        ]),
        const SizedBox(height: 10),
        Text(detail, style: const TextStyle(
          color: Color(0xFFCCD1DB), height: 1.45,
        )),
      ],
    ),
  );
}
