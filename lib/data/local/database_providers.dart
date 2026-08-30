import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/data/local/app_database.dart';
import 'package:smokefree/data/repositories/app_settings_repository.dart';
import 'package:smokefree/data/repositories/checkin_repository.dart';
import 'package:smokefree/data/repositories/craving_repository.dart';
import 'package:smokefree/data/repositories/user_profile_repository.dart';

/// Veritabanı. Testlerde NativeDatabase.memory() ile override edilir.
///
/// Web hedefinde drift, `sqlite3.wasm` ve `drift_worker.js` dosyalarının
/// `web/` klasöründe bulunmasını gerektirir (bkz. README/kurulum notu).
/// Bu dosyalar yoksa okuma/yazma sessizce başarısız olur.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase(
    driftDatabase(
      name: 'smokefree',
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.js'),
      ),
    ),
  );
  ref.onDispose(db.close);
  return db;
});

final cravingRepositoryProvider = Provider<CravingRepository>(
  (ref) => CravingRepository(ref.watch(databaseProvider)),
);

final consentRepositoryProvider = Provider<ConsentRepository>(
  (ref) => ConsentRepository(ref.watch(databaseProvider)),
);

final checkinRepositoryProvider = Provider<CheckinRepository>(
  (ref) => CheckinRepository(ref.watch(databaseProvider)),
);

final userProfileRepositoryProvider = Provider<UserProfileRepository>(
  (ref) => UserProfileRepository(ref.watch(databaseProvider)),
);

final appSettingsRepositoryProvider = Provider<AppSettingsRepository>(
  (ref) => AppSettingsRepository(ref.watch(databaseProvider)),
);
