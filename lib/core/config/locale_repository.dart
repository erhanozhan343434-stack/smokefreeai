import 'package:shared_preferences/shared_preferences.dart';

/// Kullanıcının el ile seçtiği uygulama dili.
///
/// `null` = kullanıcı hiç seçim yapmadı, telefonun sistem dili kullanılır
/// (desteklenen 11 dilden biriyse). Basit bir tercih olduğu için drift
/// yerine `shared_preferences` kullanılır — şema değişikliği/migration
/// gerektirmez.
class LocaleRepository {
  const LocaleRepository();

  static const _key = 'app_language_code';

  Future<String?> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  Future<void> setLanguageCode(String? code) async {
    final prefs = await SharedPreferences.getInstance();
    if (code == null) {
      await prefs.remove(_key);
    } else {
      await prefs.setString(_key, code);
    }
  }
}
