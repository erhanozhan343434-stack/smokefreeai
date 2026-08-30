import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/cinematic_background.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/core/widgets/language_picker.dart';
import 'package:smokefree/data/local/database_providers.dart';
import 'package:smokefree/domain/models/product_type.dart';
import 'package:smokefree/domain/models/quit_profile.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';
import 'package:smokefree/features/onboarding/onboarding_providers.dart';
import 'package:smokefree/features/onboarding/widgets/profile_form_fields.dart';
import 'package:smokefree/features/settings/settings_providers.dart';

final _appVersionProvider = FutureProvider<String>((ref) async {
  final info = await PackageInfo.fromPlatform();
  return '${info.version} (${info.buildNumber})';
});

/// Ayarlar ekranı.
///
/// Dört bölüm: profil bilgilerini düzenleme (onboarding'le AYNI alanlar —
/// bkz. [SectionCard] ve kardeşleri), dil seçimi, bildirim tercihi, ve
/// tüm kullanıcı verisini sıfırlama. Profil formu [QuitProfile]'ın GÜNCEL
/// değeriyle önceden doldurulur; onboarding'den farkı budur.
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late ProductType _productType;
  late final TextEditingController _unitsPerDayController;
  late final TextEditingController _unitsPerPackController;
  late final TextEditingController _priceController;
  late String _currencyCode;
  late DateTime _quitDateLocal;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(quitProfileProvider);
    _productType = profile.productType;
    _unitsPerDayController = TextEditingController(
      text: _trimZero(profile.unitsPerDay),
    );
    _unitsPerPackController = TextEditingController(
      text: profile.unitsPerPack.toString(),
    );
    _priceController = TextEditingController(
      text: _trimZero(profile.packPriceMinor / 100),
    );
    _currencyCode = profile.currencyCode;
    _quitDateLocal = profile.quitDateUtc.toLocal();
  }

  static String _trimZero(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toString();

  @override
  void dispose() {
    _unitsPerDayController.dispose();
    _unitsPerPackController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  String _unitLabel(L10n l10n) => switch (_productType) {
        ProductType.cigarette || ProductType.rollYourOwn || ProductType.cigar =>
          l10n.unitPiece,
        ProductType.vape => l10n.unitVape,
        ProductType.hookah => l10n.unitHookah,
        ProductType.snus => l10n.unitSnus,
      };

  Future<void> _save(L10n l10n) async {
    final unitsPerDay = double.tryParse(
      _unitsPerDayController.text.replaceAll(',', '.'),
    );
    final unitsPerPack = int.tryParse(_unitsPerPackController.text);
    final price = double.tryParse(_priceController.text.replaceAll(',', '.'));

    if (unitsPerDay == null || unitsPerDay <= 0) {
      setState(() => _error = l10n.errorDailyInvalid);
      return;
    }
    if (unitsPerPack == null || unitsPerPack <= 0) {
      setState(() => _error = l10n.errorPerPackInvalid);
      return;
    }
    if (price == null || price < 0) {
      setState(() => _error = l10n.errorPriceInvalid);
      return;
    }

    setState(() {
      _error = null;
      _saving = true;
    });

    final profile = QuitProfile(
      quitDateUtc: _quitDateLocal.toUtc(),
      productType: _productType,
      unitsPerDay: unitsPerDay,
      unitsPerPack: unitsPerPack,
      packPriceMinor: (price * 100).round(),
      currencyCode: _currencyCode,
    );

    await ref.read(userProfileRepositoryProvider).save(profile);
    // Dashboard vb. AYNI oturumda anında güncellensin diye canlı provider'ı
    // da güncelliyoruz — savedProfileProvider'ı sadece invalidate etmek
    // AppRoot dışındaki ekranları hemen tetiklemez.
    ref.read(quitProfileProvider.notifier).set(profile);
    ref.invalidate(savedProfileProvider);

    if (!mounted) return;
    setState(() => _saving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.settingsSaved)),
    );
  }

  Future<void> _confirmReset(L10n l10n) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface2,
        title: Text(l10n.settingsResetDialogTitle),
        content: Text(l10n.settingsResetDialogBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.settingsResetCancel),
          ),
          FilledButton(
            key: const Key('settings_reset_confirm_button'),
            style: FilledButton.styleFrom(backgroundColor: AppColors.d5),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.settingsResetConfirm),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    await resetAllUserData(ref);
    // AppRoot, savedProfileProvider'ın null döndüğünü görüp otomatik
    // olarak OnboardingScreen'e geçecek — burada manuel navigasyon YOK.
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final unit = _unitLabel(l10n);

    return Scaffold(
      backgroundColor: AppColors.scene,
      body: CinematicBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            children: [
              Text(l10n.settingsTitle, style: t.titleLarge),
              const SizedBox(height: 6),
              Text(
                l10n.settingsSubtitle,
                style: t.bodyMedium,
              ),
              const SizedBox(height: 24),
              SectionCard(
                title: l10n.settingsLanguageTitle,
                child: const LanguagePicker(),
              ),
              const SizedBox(height: 16),
              SectionCard(
                title: l10n.sectionProductSettings,
                child: ProductTypeGrid(
                  selected: _productType,
                  onSelected: (p) => setState(() => _productType = p),
                ),
              ),
              const SizedBox(height: 16),
              SectionCard(
                title: l10n.sectionDaily,
                child: Row(
                  children: [
                    Expanded(
                      child: NumberField(
                        controller: _unitsPerDayController,
                        label: l10n.perDayLabel(unit),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: NumberField(
                        controller: _unitsPerPackController,
                        label: l10n.perPackLabel(unit),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SectionCard(
                title: l10n.sectionPrice,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: NumberField(
                        key: const Key('settings_price_field'),
                        controller: _priceController,
                        label: l10n.priceLabel,
                        allowDecimal: true,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: CurrencyDropdown(
                        value: _currencyCode,
                        onChanged: (c) => setState(() => _currencyCode = c),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SectionCard(
                title: l10n.sectionQuitMoment,
                child: QuitDatePicker(
                  value: _quitDateLocal,
                  onChanged: (d) => setState(() => _quitDateLocal = d),
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(
                  _error!,
                  style: t.bodySmall?.copyWith(color: AppColors.d5),
                ),
              ],
              const SizedBox(height: 16),
              SizedBox(
                height: 52,
                child: FilledButton(
                  key: const Key('settings_save_button'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.accentDeep,
                    foregroundColor: const Color(0xFF04140D),
                  ),
                  onPressed: _saving ? null : () => _save(l10n),
                  child: _saving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l10n.settingsSave),
                ),
              ),
              const SizedBox(height: 24),
              const _NotificationsCard(),
              const SizedBox(height: 24),
              _DangerZoneCard(onReset: () => _confirmReset(l10n)),
              const SizedBox(height: 24),
              const _VersionFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationsCard extends ConsumerWidget {
  const _NotificationsCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final enabled = ref.watch(notificationsEnabledProvider);

    return SectionCard(
      title: l10n.settingsNotificationsTitle,
      child: Row(
        children: [
          Expanded(
            child: Text(
              l10n.settingsNotificationsBody,
              style: t.bodyMedium,
            ),
          ),
          Switch(
            key: const Key('settings_notifications_switch'),
            value: enabled.value ?? true,
            activeTrackColor: AppColors.accentDeep,
            onChanged: enabled.isLoading
                ? null
                : (v) => ref
                    .read(notificationsEnabledProvider.notifier)
                    .setEnabled(v),
          ),
        ],
      ),
    );
  }
}

class _DangerZoneCard extends StatelessWidget {
  const _DangerZoneCard({required this.onReset});

  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    return GlassCard(
      tint: AppColors.d5,
      borderColor: const Color(0x38DC2626),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.settingsDangerTitle,
            style: t.labelSmall?.copyWith(color: const Color(0xFFFCA5A5)),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.settingsDangerBody,
            style: t.bodySmall?.copyWith(color: AppColors.ink2),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              key: const Key('settings_reset_button'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFFCA5A5),
                side: const BorderSide(color: Color(0x38DC2626)),
              ),
              onPressed: onReset,
              child: Text(l10n.settingsResetButton),
            ),
          ),
        ],
      ),
    );
  }
}

class _VersionFooter extends ConsumerWidget {
  const _VersionFooter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version = ref.watch(_appVersionProvider);
    final l10n = L10n.of(context);
    return Center(
      child: Text(
        version.when(
          data: (v) => l10n.settingsVersion(v),
          loading: () => 'SmokeFree AI',
          error: (_, __) => 'SmokeFree AI',
        ),
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: AppColors.ink3),
      ),
    );
  }
}
