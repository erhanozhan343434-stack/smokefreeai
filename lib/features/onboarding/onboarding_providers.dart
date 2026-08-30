import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/data/local/database_providers.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

/// Kaydedilmiş kullanıcı profili. `null` → onboarding henüz tamamlanmadı.
///
/// [AppRoot] bunu izleyip Onboarding ile Dashboard arasında geçiş yapar.
final savedProfileProvider = FutureProvider<QuitProfile?>((ref) async {
  final repo = ref.watch(userProfileRepositoryProvider);
  return repo.load();
});
