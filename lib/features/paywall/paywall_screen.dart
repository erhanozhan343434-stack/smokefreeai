import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:smokefree/core/config/purchases_ready_provider.dart';
import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/cinematic_background.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/features/paywall/paywall_providers.dart';

/// Premium / deneme ekranı.
///
/// [purchasesReadyProvider] `false` ise (RevenueCat henüz kurulmadıysa)
/// satın alma seçenekleri YERİNE dürüst bir "yakında" mesajı gösterir —
/// tıpkı [AiCoachScreen] deseninde olduğu gibi, hiçbir zaman "bozuk"
/// hissettirmez.
class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ready = ref.watch(purchasesReadyProvider);
    return Scaffold(
      backgroundColor: AppColors.scene,
      appBar: AppBar(
        backgroundColor: AppColors.surface1,
        foregroundColor: AppColors.ink,
        title: Text(L10n.of(context).paywallTitle),
      ),
      body: CinematicBackground(
        child: SafeArea(
          child: ready ? const _OfferingsBody() : const _ComingSoonBody(),
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
    final l10n = L10n.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: GlassCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('✨', style: TextStyle(fontSize: 32)),
              const SizedBox(height: 12),
              Text(
                l10n.paywallComingSoonTitle,
                style: t.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.paywallComingSoonBody,
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

class _OfferingsBody extends ConsumerWidget {
  const _OfferingsBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerings = ref.watch(offeringsProvider);
    final l10n = L10n.of(context);

    return offerings.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => _MessagePanel(text: l10n.paywallLoadError),
      data: (data) {
        final packages = data.current?.availablePackages ?? const <Package>[];
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          children: [
            const _FeatureList(),
            const SizedBox(height: 20),
            if (packages.isEmpty)
              _MessagePanel(text: l10n.paywallNoPackages)
            else
              for (final package in packages)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _PackageTile(package: package),
                ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () => _restore(context),
                child: Text(l10n.paywallRestore),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => _openLegalUrl(
                      'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
                    ),
                    child: const Text('Kullanım Şartları'),
                  ),
                  const Text('•', style: TextStyle(color: AppColors.ink2)),
                  TextButton(
                    onPressed: () => _openLegalUrl(
                      'https://smokefreeaiapp.com/privacy',
                    ),
                    child: const Text('Gizlilik Politikası'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _restore(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = L10n.of(context);
    try {
      final info = await restorePurchases();
      final hasActive = info.entitlements.active.isNotEmpty;
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            hasActive ? l10n.paywallRestoreSuccess : l10n.paywallRestoreNone,
          ),
        ),
      );
    } on Object {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.paywallRestoreFailed)),
      );
    }
  }
}

class _FeatureList extends StatelessWidget {
  const _FeatureList();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final features = [
      l10n.paywallFeatureSos,
      l10n.paywallFeatureTimeline,
      l10n.paywallFeatureBadges,
      l10n.paywallFeatureAdFree,
    ];
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.paywallFeaturesTitle, style: t.labelSmall),
          const SizedBox(height: 10),
          for (final feature in features)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('✓ ', style: TextStyle(color: AppColors.accent)),
                  Expanded(child: Text(feature, style: t.bodyMedium)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _PackageTile extends StatefulWidget {
  const _PackageTile({required this.package});

  final Package package;

  @override
  State<_PackageTile> createState() => _PackageTileState();
}

class _PackageTileState extends State<_PackageTile> {
  bool _buying = false;

  Future<void> _buy() async {
    setState(() => _buying = true);
    final messenger = ScaffoldMessenger.of(context);
    final l10n = L10n.of(context);
    try {
      final bought = await purchasePackage(widget.package);
      if (!mounted) return;
      setState(() => _buying = false);
      if (bought) {
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.paywallThanks)),
        );
      }
    } on Object {
      if (!mounted) return;
      setState(() => _buying = false);
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.paywallPurchaseFailed)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final product = widget.package.storeProduct;
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: _buying ? null : _buy,
      child: GlassCard(
        borderColor: const Color(0x3834D399),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.title,
                    style: t.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    product.description,
                    style: t.bodySmall?.copyWith(color: AppColors.ink2),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (_buying)
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              Text(
                product.priceString,
                style: t.titleMedium?.copyWith(color: AppColors.accent),
              ),
          ],
        ),
      ),
    );
  }
}

class _MessagePanel extends StatelessWidget {
  const _MessagePanel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return GlassCard(
      child: Text(
        text,
        style: t.bodyMedium?.copyWith(color: AppColors.ink2),
        textAlign: TextAlign.center,
      ),
    );
  }
}

Future<void> _openLegalUrl(String url) async {
  await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}
