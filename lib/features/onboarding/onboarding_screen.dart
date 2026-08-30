import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/cinematic_background.dart';
import 'package:smokefree/core/widgets/language_picker.dart';
import 'package:smokefree/data/local/database_providers.dart';
import 'package:smokefree/domain/models/product_type.dart';
import 'package:smokefree/domain/models/quit_profile.dart';
import 'package:smokefree/features/onboarding/onboarding_providers.dart';
import 'package:smokefree/features/onboarding/widgets/profile_form_fields.dart';

/// İlk açılış formu — sayaç ve istatistiklerin gerçek kullanıcı verisiyle
/// çalışması için gereken minimum bilgiyi toplar.
///
/// [AppRoot], [savedProfileProvider] `null` döndüğü sürece bu ekranı
/// gösterir; kayıt başarılı olunca [savedProfileProvider] geçersiz
/// kılınır ve `AppRoot` otomatik olarak Dashboard'a geçer.
///
/// NOT: Bu formun alanları (ürün tipi, miktar, fiyat, tarih) Ayarlar
/// ekranındaki profil düzenleme formuyla aynıdır — ortak widget'lar
/// `widgets/profile_form_fields.dart` içinde paylaşılır.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  ProductType? _productType;
  final _unitsPerDayController = TextEditingController(text: '20');
  final _unitsPerPackController = TextEditingController(text: '20');
  final _priceController = TextEditingController();
  String _currencyCode = 'TRY';
  DateTime _quitDateLocal = DateTime.now();
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _unitsPerDayController.dispose();
    _unitsPerPackController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  String _unitLabel(L10n l10n) => switch (_productType) {
        null => l10n.unitGeneric,
        ProductType.cigarette || ProductType.rollYourOwn || ProductType.cigar =>
          l10n.unitPiece,
        ProductType.vape => l10n.unitVape,
        ProductType.hookah => l10n.unitHookah,
        ProductType.snus => l10n.unitSnus,
      };

  Future<void> _submit(L10n l10n) async {
    final productType = _productType;
    final unitsPerDay = double.tryParse(
      _unitsPerDayController.text.replaceAll(',', '.'),
    );
    final unitsPerPack = int.tryParse(_unitsPerPackController.text);
    final price = double.tryParse(_priceController.text.replaceAll(',', '.'));

    if (productType == null) {
      setState(() => _error = l10n.errorSelectProduct);
      return;
    }
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
      productType: productType,
      unitsPerDay: unitsPerDay,
      unitsPerPack: unitsPerPack,
      packPriceMinor: (price * 100).round(),
      currencyCode: _currencyCode,
    );

    await ref.read(userProfileRepositoryProvider).save(profile);
    ref.invalidate(savedProfileProvider);
    // AppRoot bu değişimi izleyip Dashboard'a geçirecek — burada manuel
    // bir navigasyon YAPILMAZ, tek doğruluk kaynağı savedProfileProvider'dır.
    if (mounted) setState(() => _saving = false);
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
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
            children: [
              // Uygulama global bir kitleye indirilebildiği için, sistem
              // dili yanlış/eksikse kullanıcı en baştan kendi dilini
              // seçebilsin diye dil seçici ilk açılışta en üstte gösterilir
              // (bkz. [LanguagePicker] — Ayarlar ekranıyla paylaşılan
              // aynı widget).
              SectionCard(
                title: l10n.settingsLanguageTitle,
                child: const LanguagePicker(),
              ),
              const SizedBox(height: 16),
              Text(l10n.onboardingWelcome, style: t.titleLarge),
              const SizedBox(height: 6),
              Text(
                l10n.onboardingIntro,
                style: t.bodyMedium,
              ),
              const SizedBox(height: 24),
              SectionCard(
                title: l10n.sectionProduct,
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
                        key: const Key('onboarding_price_field'),
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
              const SizedBox(height: 24),
              SizedBox(
                height: 52,
                child: FilledButton(
                  key: const Key('onboarding_start_button'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.accentDeep,
                    foregroundColor: const Color(0xFF04140D),
                  ),
                  onPressed: _saving ? null : () => _submit(l10n),
                  child: _saving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l10n.onboardingStart),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
