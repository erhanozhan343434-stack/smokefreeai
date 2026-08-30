import 'package:drift/drift.dart';

import 'package:smokefree/data/local/app_database.dart';
import 'package:smokefree/domain/models/product_type.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

/// Kullanıcının bırakma profili — tablo tek satırdır (id = 1).
///
/// TODO(faz-2): onboarding tamamlanınca bu repository üzerinden okunur.
class UserProfileRepository {
  const UserProfileRepository(this._db);

  final AppDatabase _db;

  static const _rowId = 1;

  /// Kaydedilmiş profil var mı? Yoksa null — onboarding henüz yapılmamış
  /// demektir.
  Future<QuitProfile?> load() async {
    final row = await (_db.select(_db.userProfiles)
          ..where((t) => t.id.equals(_rowId)))
        .getSingleOrNull();
    return row == null ? null : _toQuitProfile(row);
  }

  /// Profili kaydeder (ilk kayıt = onboarding, sonraki kayıtlar = güncelleme).
  Future<void> save(QuitProfile profile) {
    return _db.into(_db.userProfiles).insertOnConflictUpdate(
          UserProfilesCompanion.insert(
            id: const Value(_rowId),
            quitDateUtc: profile.quitDateUtc,
            productType: profile.productType.name,
            unitsPerDay: profile.unitsPerDay,
            unitsPerPack: profile.unitsPerPack,
            packPriceMinor: profile.packPriceMinor,
            currencyCode: profile.currencyCode,
            countryCode: Value(profile.countryCode),
          ),
        );
  }

  /// Profili siler — kullanıcı verilerini sıfırlamak istediğinde
  /// (ör. Ayarlar ekranından) kullanılır. Uygulama bir sonraki açılışta
  /// tekrar onboarding'e döner.
  Future<void> clear() {
    return (_db.delete(_db.userProfiles)..where((t) => t.id.equals(_rowId)))
        .go();
  }

  QuitProfile _toQuitProfile(UserProfile row) => QuitProfile(
        quitDateUtc: row.quitDateUtc,
        productType: ProductType.values.byName(row.productType),
        unitsPerDay: row.unitsPerDay,
        unitsPerPack: row.unitsPerPack,
        packPriceMinor: row.packPriceMinor,
        currencyCode: row.currencyCode,
        countryCode: row.countryCode,
      );
}
