import 'package:drift/drift.dart';

part 'app_database.g.dart';

/// Kullanıcı profili — tek satır (id = 1).
///
/// KVKK notu: bu tablo sağlık verisi İÇERMEZ; tüketim ve fiyat bilgisidir.
/// Sağlık verisi sayılan kayıtlar (kraving, ruh hali) ayrı tablolardadır
/// ve yurt dışına yalnızca AYRI açık rıza ile senkronize edilebilir.
class UserProfiles extends Table {
  IntColumn get id => integer()();

  /// DAİMA UTC. Gösterim yerel saatte yapılır; saklama asla.
  DateTimeColumn get quitDateUtc => dateTime()();

  /// ProductType enum'unun adı (cigarette, vape, hookah...).
  TextColumn get productType => text()();
  RealColumn get unitsPerDay => real()();
  IntColumn get unitsPerPack => integer()();

  /// Kuruş/cent — para asla double saklanmaz.
  IntColumn get packPriceMinor => integer()();
  TextColumn get currencyCode => text().withLength(min: 3, max: 3)();
  TextColumn get countryCode => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// Kraving (istek krizi) kayıtları — tetikleyici ısı haritasının kaynağı.
class CravingLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get atUtc => dateTime()();
  IntColumn get intensity =>
      // Drift'in resmi CHECK kalibi; sutun tanimi kendi getter'ini
      // referanslar gorunur ama calisma zamaninda ozyineleme yoktur.
      // ignore: recursive_getters
      integer().check(intensity.isBetweenValues(1, 10))();
  TextColumn get cue => text().nullable()(); // tetikleyici
  TextColumn get emotion => text().nullable()();
  TextColumn get place => text().nullable()();
  TextColumn get coping => text().nullable()(); // ne yaptın
  BoolColumn get resisted => boolean().withDefault(const Constant(true))();
}

/// Kaçamak kayıtları.
///
/// TASARIM KURALI: kaçamak seriyi SIFIRLAMAZ; nötr veri olarak durur.
/// Suçlayıcı çerçeve bırakma oranını düşürür.
class SlipLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get atUtc => dateTime()();
  IntColumn get units => integer().withDefault(const Constant(1))();
  TextColumn get context => text().nullable()();
}

/// Rıza kayıtları — KVKK/GDPR için VERSİYONLU ve EKLE-YALNIZ (append-only).
///
/// Satır asla güncellenmez/silinmez; her verme ve geri çekme yeni satırdır.
/// Bir rıza türünün güncel durumu = o türün en son satırı.
/// Denetimde "şu tarihte hangi metnin hangi sürümüne onay verildi"
/// sorusunun tek cevabı bu tablodur.
class Consents extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// health_data | cross_border | analytics | marketing
  TextColumn get kind => text()();

  /// Onaylanan metnin sürümü (ör. "2026-08-tr-v1").
  TextColumn get docVersion => text()();
  BoolColumn get granted => boolean()();
  DateTimeColumn get atUtc => dateTime()();
}

/// Günlük "bugün nasılsın?" check-in kayıtları.
///
/// KVKK notu: bu tablo RUH HALİ verisi içerir → sağlık verisi sayılır.
/// [Consents] tablosundaki `health_data` rızası olmadan yurt dışına
/// senkronize edilmez (bkz. [CravingLogs] notu).
class CheckinLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get atUtc => dateTime()();

  /// CheckinResponse enum adı ('good' | 'struggling').
  TextColumn get response => text()();
}

/// Uygulama ayarları — tek satır (id = 1).
///
/// Şimdilik yalnızca bildirim tercihi tutuluyor; gerçek zamanlanmış
/// bildirimler (flutter_local_notifications) TODO(faz-4) kapsamında.
class AppSettings extends Table {
  IntColumn get id => integer()();
  BoolColumn get notificationsEnabled =>
      boolean().withDefault(const Constant(true))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// Uygulama veritabanı.
@DriftDatabase(
  tables: [
    UserProfiles,
    CravingLogs,
    SlipLogs,
    Consents,
    CheckinLogs,
    AppSettings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(checkinLogs);
          }
          if (from < 3) {
            await m.createTable(appSettings);
          }
        },
      );

  /// Ayarlar ekranındaki "Verilerimi sıfırla" eylemi.
  ///
  /// Profil dahil TÜM kullanıcı verisini siler; şema/tablolar kalır.
  /// [AppSettings] KASITLI OLARAK silinmez — bildirim tercihi gibi cihaz
  /// ayarları bir "veri sıfırlama"nın kapsamı dışındadır.
  Future<void> wipeAllUserData() {
    return transaction(() async {
      await delete(userProfiles).go();
      await delete(cravingLogs).go();
      await delete(slipLogs).go();
      await delete(consents).go();
      await delete(checkinLogs).go();
    });
  }
}
