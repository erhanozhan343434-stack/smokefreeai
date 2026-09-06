import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Ücretsiz kullanıcıların günlük SOS mesaj hakkı.
const dailyFreeMessageLimit = 2;

String _todayKey() {
  final now = DateTime.now();
  return 'ai_coach_free_count_${now.year}-${now.month}-${now.day}';
}

/// Bugün ücretsiz kullanıcının gönderdiği SOS mesaj sayısı.
final todayFreeMessageCountProvider = FutureProvider.autoDispose<int>((
  ref,
) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(_todayKey()) ?? 0;
});

/// Mesaj gönderildikten sonra sayacı bir artırır.
Future<void> incrementTodayFreeMessageCount() async {
  final prefs = await SharedPreferences.getInstance();
  final key = _todayKey();
  final current = prefs.getInt(key) ?? 0;
  await prefs.setInt(key, current + 1);
}
