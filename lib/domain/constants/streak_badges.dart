/// Sigarasız gün eşiğine dayalı başarı rozetleri.
///
/// NOT: Bu eşikler `health_facts.dart` içindeki gibi hakemli bir kaynağa
/// dayanmaz — kullanıcı motivasyonu için ürün kararıdır, bu yüzden
/// kaynak künyesi gerektirmez. Sıra SABİTTİR.
library;

class StreakBadge {
  const StreakBadge({required this.key, required this.after});

  final String key;
  final Duration after;
}

const streakBadges = <StreakBadge>[
  StreakBadge(key: 'day7', after: Duration(days: 7)),
  StreakBadge(key: 'day30', after: Duration(days: 30)),
  StreakBadge(key: 'day90', after: Duration(days: 90)),
  StreakBadge(key: 'year1', after: Duration(days: 365)),
];
