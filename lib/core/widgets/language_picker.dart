import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/config/app_locales.dart' as app_locales;
import 'package:smokefree/core/config/locale_provider.dart';
import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';

/// Dil kodu → o dilin kendi adı (native name). Bilinçli olarak
/// ÇEVRİLMEZ — kullanıcı kendi dilini, o an ekranda hangi dil aktif
/// olursa olsun, kendi alfabesiyle tanıyabilsin diye.
const languageDisplayNames = <String, String>{
  'tr': 'Türkçe',
  'en': 'English',
  'de': 'Deutsch',
  'nl': 'Nederlands',
  'zh': '中文',
  'ru': 'Русский',
  'ar': 'العربية',
  'el': 'Ελληνικά',
  'fr': 'Français',
  'it': 'Italiano',
  'es': 'Español',
};

/// Dil seçici — hem Ayarlar ekranında hem de ilk açılış (onboarding)
/// ekranında kullanılır ki uygulamayı nereden indirdiği belli olmayan
/// global kullanıcı, en baştan kendi dilini seçebilsin.
///
/// [localeControllerProvider] üzerinden kaydedilir ve uygulama geneli
/// anında bu dile geçer; seçim kalıcıdır (uygulama kapatılıp açılsa
/// da korunur).
class LanguagePicker extends ConsumerWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final current = ref.watch(localeControllerProvider).value;
    final controller = ref.read(localeControllerProvider.notifier);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _LanguageChip(
          label: l10n.settingsLanguageSystemDefault,
          selected: current == null,
          onTap: () => controller.setLocale(null),
        ),
        for (final locale in app_locales.supportedLocales)
          _LanguageChip(
            label: languageDisplayNames[locale.languageCode] ??
                locale.languageCode,
            selected: current?.languageCode == locale.languageCode,
            onTap: () => controller.setLocale(locale),
          ),
      ],
    );
  }
}

class _LanguageChip extends StatelessWidget {
  const _LanguageChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.accent.withValues(alpha: 0.16)
              : Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? AppColors.accent : AppColors.line,
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: selected ? AppColors.ink : AppColors.ink2,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
