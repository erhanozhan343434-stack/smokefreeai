/// Günlük "bugün nasılsın?" check-in yanıtı.
enum CheckinResponse {
  good,
  struggling;

  /// Veritabanında saklanan anahtar (şimdilik enum adıyla aynı — ileride
  /// sunucu tarafı isim değişse bile burası sabit kalabilsin diye ayrı).
  String get storageKey => name;

  static CheckinResponse fromStorageKey(String key) =>
      CheckinResponse.values.byName(key);
}
