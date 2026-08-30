import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/config/firebase_ready_provider.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/cinematic_background.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/features/ai_coach/ai_coach_providers.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';

/// AI Koç sohbet ekranı.
///
/// [firebaseReadyProvider] `false` ise (Firebase henüz kurulmadıysa —
/// bkz. docs/runbooks/firebase.md) sohbet YERİNE dürüst bir "yakında"
/// mesajı gösterir. Böylece SOS ekranındaki buton hiçbir zaman "bozuk"
/// hissettirmez; ya çalışır ya da neden çalışmadığını açıkça söyler.
class AiCoachScreen extends ConsumerWidget {
  const AiCoachScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ready = ref.watch(firebaseReadyProvider);
    return Scaffold(
      backgroundColor: AppColors.scene,
      appBar: AppBar(
        backgroundColor: AppColors.surface1,
        foregroundColor: AppColors.ink,
        title: const Text('AI Koç'),
      ),
      body: CinematicBackground(
        child: SafeArea(
          child: ready ? const _ChatBody() : const _ComingSoonBody(),
        ),
      ),
    );
  }
}

class _ComingSoonBody extends StatelessWidget {
  const _ComingSoonBody();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: GlassCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('💬', style: TextStyle(fontSize: 32)),
              const SizedBox(height: 12),
              Text(
                'AI Koç yakında burada',
                style: t.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Bu özellik için sunucu tarafı kurulum henüz tamamlanmadı. '
                'Hazır olduğunda bu ekran otomatik olarak sohbete dönüşecek.',
                style: t.bodySmall?.copyWith(color: AppColors.ink2),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatBody extends ConsumerStatefulWidget {
  const _ChatBody();

  @override
  ConsumerState<_ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends ConsumerState<_ChatBody> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final _messages = <AiCoachTurn>[];
  bool _sending = false;
  String? _error;
  String? _crisisNumber;

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _sending) return;

    final profile = ref.read(quitProfileProvider);
    final locale = Localizations.localeOf(context).languageCode;
    final history = List<AiCoachTurn>.from(_messages);

    setState(() {
      _messages.add(AiCoachTurn(role: 'user', text: text));
      _controller.clear();
      _sending = true;
      _error = null;
    });
    _scrollToBottom();

    try {
      final reply = await ref.read(aiCoachRepositoryProvider).send(
            message: text,
            history: history,
            locale: locale,
            countryCode: profile.countryCode,
            hoursSmokeFree: abstinenceOf(ref).duration.inMinutes / 60,
            facts: {
              'daysSmokeFree': abstinenceOf(ref).days,
              'unitsAvoided': unitsOf(ref).floor(),
              'moneySavedMinor': moneyMinorOf(ref),
              'currencyCode': profile.currencyCode,
            },
          );

      if (!mounted) return;
      setState(() {
        _messages.add(AiCoachTurn(role: 'assistant', text: reply.text));
        _sending = false;
        if (reply.crisisEscalated) _crisisNumber = reply.emergencyNumber;
      });
      _scrollToBottom();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _sending = false;
        _error = 'Mesaj gönderilemedi. İnternet bağlantını kontrol edip '
            'tekrar dener misin?';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_crisisNumber != null) _CrisisBanner(number: _crisisNumber!),
        Expanded(
          child: _messages.isEmpty
              ? const _EmptyState()
              : ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  // _sending true iken listenin sonuna "yazıyor..." balonu
                  // ekleniyor — kullanıcı yanıt gelmeden önce kaç mesaj
                  // yazarsa yazsın gönderemez (bkz. _Composer: enabled:
                  // !sending), bu balon da bunu görsel olarak netleştiriyor.
                  itemCount: _messages.length + (_sending ? 1 : 0),
                  itemBuilder: (context, i) {
                    if (i == _messages.length) {
                      return const _TypingBubble();
                    }
                    return _MessageBubble(turn: _messages[i]);
                  },
                ),
        ),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _error!,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.d5),
            ),
          ),
        _Composer(
          controller: _controller,
          // sending true iken hem yazı kutusu hem gönder butonu kilitli —
          // kullanıcı bir sonraki mesajını ancak AI Koç'un yanıtı
          // geldikten sonra yazıp gönderebiliyor.
          sending: _sending,
          onSend: _send,
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Merhaba, ben AI Koç. Ne hissettiğini yazabilirsin, seninle '
          'buradayım.',
          style: t.bodyMedium?.copyWith(color: AppColors.ink2),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _CrisisBanner extends StatelessWidget {
  const _CrisisBanner({required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: GlassCard(
        tint: AppColors.d5,
        borderColor: const Color(0x38DC2626),
        child: Row(
          children: [
            const Text('☎️', style: TextStyle(fontSize: 22)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hemen ara: $number',
                    style: t.titleMedium?.copyWith(
                      color: const Color(0xFFFCA5A5),
                    ),
                  ),
                  Text(
                    'Yalnız değilsin.',
                    style: t.bodySmall?.copyWith(color: AppColors.ink2),
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

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.turn});

  final AiCoachTurn turn;

  @override
  Widget build(BuildContext context) {
    final isUser = turn.role == 'user';
    final t = Theme.of(context).textTheme;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.78,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isUser
              ? AppColors.accentDeep.withValues(alpha: 0.85)
              : AppColors.surface2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          turn.text,
          style: t.bodyMedium?.copyWith(
            color: isUser ? const Color(0xFF04140D) : AppColors.ink,
          ),
        ),
      ),
    );
  }
}

class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.surface2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.ink2,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'AI Koç yazıyor...',
              style: t.bodySmall?.copyWith(color: AppColors.ink2),
            ),
          ],
        ),
      ),
    );
  }
}

class _Composer extends StatelessWidget {
  const _Composer({
    required this.controller,
    required this.sending,
    required this.onSend,
  });

  final TextEditingController controller;
  final bool sending;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              enabled: !sending,
              minLines: 1,
              maxLines: 4,
              textInputAction: TextInputAction.send,
              onSubmitted: sending ? null : (_) => onSend(),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.ink),
              decoration: InputDecoration(
                hintText: sending ? 'AI Koç yanıtlıyor...' : 'Yaz...',
                filled: true,
                fillColor: AppColors.surface2,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 44,
            height: 44,
            child: IconButton.filled(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.accentDeep,
              ),
              onPressed: sending ? null : onSend,
              icon: sending
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Color(0xFF04140D),
                      ),
                    )
                  : const Icon(Icons.arrow_upward, color: Color(0xFF04140D)),
            ),
          ),
        ],
      ),
    );
  }
}
