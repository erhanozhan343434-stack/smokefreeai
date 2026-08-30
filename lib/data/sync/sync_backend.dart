/// Senkron katmanı arayüzü.
///
/// Drift/SQLite BİRİNCİL kaynaktır. Bu arayüz opsiyonel yedeklemedir.
/// Firebase implementasyonu Faz 2'de gelir; Supabase'e geçmek istenirse
/// yalnızca bu arayüzün yeni bir implementasyonu yazılır — üst katmanlar
/// değişmez.
///
/// KVKK: bu arayüz, kullanıcı yurt dışı aktarımına AÇIK RIZA vermeden
/// çağrılamaz.
abstract class SyncBackend {
  Future<bool> get isAvailable;
  Future<void> pushAll();
  Future<void> pullAll();
  Future<void> deleteRemoteAccount();
}

/// Varsayılan: senkron kapalı. Uygulama tam offline çalışır.
class NoopSyncBackend implements SyncBackend {
  const NoopSyncBackend();
  @override
  Future<bool> get isAvailable async => false;
  @override
  Future<void> pushAll() async {}
  @override
  Future<void> pullAll() async {}
  @override
  Future<void> deleteRemoteAccount() async {}
}
