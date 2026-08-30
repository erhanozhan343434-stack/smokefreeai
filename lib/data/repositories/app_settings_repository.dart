import 'package:drift/drift.dart';

import 'package:smokefree/data/local/app_database.dart';

/// Uygulama ayarları — tablo tek satırdır (id = 1).
class AppSettingsRepository {
  const AppSettingsRepository(this._db);

  final AppDatabase _db;

  static const _rowId = 1;

  /// Bildirimler açık mı? Hiç kayıt yoksa varsayılan: açık.
  Future<bool> notificationsEnabled() async {
    final row = await (_db.select(_db.appSettings)
          ..where((t) => t.id.equals(_rowId)))
        .getSingleOrNull();
    return row?.notificationsEnabled ?? true;
  }

  Future<void> setNotificationsEnabled(bool enabled) {
    return _db.into(_db.appSettings).insertOnConflictUpdate(
          AppSettingsCompanion.insert(
            id: const Value(_rowId),
            notificationsEnabled: Value(enabled),
          ),
        );
  }
}
