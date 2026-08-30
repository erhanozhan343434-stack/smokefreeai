import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/config/locale_repository.dart';

final localeRepositoryProvider = Provider<LocaleRepository>(
  (ref) => const LocaleRepository(),
);

/// Kullanıcının Ayarlar'dan el ile seçtiği dil.
///
/// `null` = "Sistem dili" seçili — [SmokeFreeApp] bu durumda `locale`
/// parametresini boş bırakır ve Flutter cihazın sistem dilini (desteklenen
/// 11 dilden biriyse) otomatik seçer.
class LocaleController extends AsyncNotifier<Locale?> {
  @override
  Future<Locale?> build() async {
    final repo = ref.watch(localeRepositoryProvider);
    final code = await repo.getLanguageCode();
    return code == null ? null : Locale(code);
  }

  Future<void> setLocale(Locale? locale) async {
    final repo = ref.read(localeRepositoryProvider);
    await repo.setLanguageCode(locale?.languageCode);
    state = AsyncData(locale);
  }
}

final localeControllerProvider =
    AsyncNotifierProvider<LocaleController, Locale?>(LocaleController.new);
