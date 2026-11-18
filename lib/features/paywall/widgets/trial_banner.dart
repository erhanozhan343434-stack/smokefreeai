import 'package:flutter/material.dart';

/// Premium trial entry on the dashboard.
/// Store checkout remains the source of truth for eligibility and price.
class TrialBanner extends StatefulWidget {
  const TrialBanner({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  State<TrialBanner> createState() => _TrialBannerState();
}

class _TrialBannerState extends State<TrialBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shine;

  @override
  void initState() {
    super.initState();
    _shine = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5200),
    )..repeat();
  }

  @override
  void dispose() {
    _shine.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFFFD990);
    const lavender = Color(0xFFE8DAFF);
    final isTr = Localizations.localeOf(context).languageCode == 'tr';
    return Semantics(
      button: true,
      label: isTr
          ? 'Premium: uygun yeni abonelere 3 gün ücretsiz deneme. Planları gör.'
          : 'Premium: 3-day trial for eligible new subscribers. View plans.',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF312050),
                  Color(0xFF1A2445),
                  Color(0xFF102E31),
                ],
              ),
              border: Border.all(color: const Color(0xFF9F83E9), width: 1.2),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x553E1C8D),
                  blurRadius: 26,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Stack(
                children: [
                  Positioned(
                    right: -55,
                    top: -65,
                    child: IgnorePointer(
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [Color(0x559D72FF), Color(0x009D72FF)],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: IgnorePointer(
                      child: RepaintBoundary(
                        child: AnimatedBuilder(
                          animation: _shine,
                          builder: (context, _) => LayoutBuilder(
                            builder: (context, constraints) {
                              final left =
                                  (constraints.maxWidth + 190) * _shine.value - 130;
                              return Stack(
                                children: [
                                  Positioned(
                                    left: left,
                                    top: -50,
                                    bottom: -50,
                                    width: 70,
                                    child: Transform.rotate(
                                      angle: 0.3,
                                      child: const DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x00FFFFFF),
                                              Color(0x24FFFFFF),
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
                    padding: const EdgeInsets.fromLTRB(18, 17, 18, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.workspace_premium_rounded,
                                color: gold, size: 23),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'SMOKEFREE AI PREMIUM',
                                style: const TextStyle(
                                  color: gold,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            const Icon(Icons.auto_awesome_rounded,
                                color: gold, size: 18),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          isTr ? '3 Gün Ücretsiz Keşfet' : 'Explore 3 Days Free',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          isTr
                              ? 'AI koç, sınırsız SOS ve sağlık takibi bir arada.'
                              : 'AI coach, unlimited SOS and health tracking.',
                          style: const TextStyle(
                            color: lavender,
                            fontSize: 12,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFFFE6B4),
                                Color(0xFFDDB5FF),
                                Color(0xFFAAEBDD),
                              ],
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x449C79E9),
                                blurRadius: 14,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.card_giftcard_rounded,
                                  color: Color(0xFF261C3C), size: 21),
                              const SizedBox(width: 9),
                              Flexible(
                                child: Text(
                                  isTr ? '3 Gün Ücretsiz Dene' : 'Try 3 Days Free',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xFF261C3C),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward_rounded,
                                  color: Color(0xFF261C3C), size: 20),
                            ],
                          ),
                        ),
                        const SizedBox(height: 9),
                        Text(
                          isTr
                              ? 'Uygun yeni aboneler için. Deneme sonrası seçilen plan ücretlendirilir; koşullar ödeme öncesi gösterilir.'
                              : 'For eligible new subscribers. Your selected plan is billed after the trial; terms appear before purchase.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFFC6BED7),
                            fontSize: 10.5,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
