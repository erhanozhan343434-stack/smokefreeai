/// BİLİMSEL SABİTLER — HER DEĞER KAYNAKLI
///
/// KURAL: Kaynağı yazılmamış hiçbir sayı bu dosyaya giremez.
/// `null` + TODO olarak duran sabitler, doğrulanana kadar üretimde
/// KULLANILMAZ; ilgili panel gizlenir. Doğrulanmamış rakam göstermek
/// hem mağaza incelemesinde red sebebi hem kullanıcı güveninin sonudur.
///
/// Uygulamada gösterilen her sağlık rakamının yanında ⓘ ikonu bulunur ve
/// bu dosyadaki kaynak künyesini açar.
library;

/// Ömür kaybı sabitleri.
class LifeLostFacts {
  const LifeLostFacts._();

  /// Sigara başına ortalama ömür kaybı (dakika).
  ///
  /// Kaynak: Jackson SE, Jarvis MJ, West R. "The price of a cigarette:
  /// 20 minutes of life?" Addiction. 2025;120(5):810-812.
  /// DOI: 10.1111/add.16757
  /// UCL Discovery: https://discovery.ucl.ac.uk/id/eprint/10203237
  /// Erişim: 2026-08-19.
  ///
  /// Çalışma UK Sağlık ve Sosyal Bakım Bakanlığı tarafından ısmarlanmıştır.
  /// Kullanıcıya DAİMA "tahmini" ibaresiyle sunulur — bu bir popülasyon
  /// ortalamasıdır, kişisel tahmin değildir.
  static const double minutesPerCigarette = 20;

  // TODO(faz-1): Cinsiyete göre ayrışan tahminler (erkek/kadın) basında
  /// 17 / 22 dakika olarak aktarılıyor ancak birincil makaleden
  /// doğrulanmadı. DOI 10.1111/add.16757 tam metninden teyit edilmeden
  /// KULLANILMAYACAK. Doğrulanana kadar herkese ortalama değer gösterilir.
  static const double? minutesPerCigaretteMale = null;
  static const double? minutesPerCigaretteFemale = null;

  /// Referans: daha eski literatürde ~11 dakika tahmini yaygındı
  /// (Shaw M, Mitchell R, Dorling D. BMJ. 2000;320:53 — "Time for a smoke?").
  /// Ayarlar ekranında "muhafazakâr tahmin" seçeneği olarak sunulabilir.
  // TODO(faz-1): birincil kaynaktan doğrula, sonra aktif et.
  static const double? minutesPerCigaretteConservative = null;
}

/// Toksin miktarları — ÖLÇÜM REJİMİ BELİRTİLMEDEN SAYI YAZILAMAZ.
///
/// Katran/nikotin/CO değerleri ISO 3308 ile Health Canada Intense
/// rejimlerinde 2-3 kata varan farklar verir. Hangi rejimin kullanıldığı
/// yazılmadan verilen bir "katran mg" rakamı bilimsel olarak anlamsızdır
/// ve mağaza incelemesinde yanıltıcı sağlık iddiası sayılabilir.
class ToxinFacts {
  const ToxinFacts._();

  // TODO(faz-1): Ölçüm rejimi seçilecek (ISO 3308 veya Health Canada
  /// Intense), kaynak künyesi yazılacak, sonra değer girilecek.
  static const double? tarPerCigaretteMg = null;
  static const double? nicotinePerCigaretteMg = null;
  static const double? carbonMonoxidePerCigaretteMg = null;

  /// Vape ve snus YANMA ürünü değildir → katran ve karbonmonoksit sıfırdır.
  /// Sigara katsayısını bu ürünlere uygulamak ürünü bilimsel olarak çürütür.
  static const double tarPerVapePuffMg = 0;
  static const double carbonMonoxidePerVapePuffMg = 0;
  static const double tarPerSnusPouchMg = 0;
  static const double carbonMonoxidePerSnusPouchMg = 0;
}

/// Çevresel etki.
class EnvironmentFacts {
  const EnvironmentFacts._();

  /// İçilmeyen her sigara = doğaya bırakılmayan bir izmarit.
  /// Bu bir birebir eşleme, kaynak gerektirmez.
  static const int buttsPerCigarette = 1;

  /// Bağlam metni için: yılda ~4,5 trilyon sigara filtresi çevreye karışıyor
  /// ve filtreler dünyadaki ikinci en büyük plastik kirlilik kalemidir.
  /// Kaynak: WHO, "WHO raises alarm on tobacco industry environmental
  /// impact", 31 Mayıs 2022.
  /// Tam künye ve bağlantı: docs/health_sources.md (WHO-ENV-2022)
  /// Erişim: 2026-08-19.
  static const double globalFiltersPerYearTrillions = 4.5;

  /// Tütün endüstrisinin yıllık CO2 salımı: 84 milyon ton
  /// (ticari havayolu endüstrisinin yıllık CO2'sinin yaklaşık beşte biri).
  /// Kaynak: WHO, 31 Mayıs 2022 (yukarıdaki bağlantı). Erişim: 2026-08-19.
  static const double globalCo2PerYearMegatonnes = 84;

  // TODO(faz-1): Sigara başına CO2 eşdeğeri.
  /// Türetme yöntemi: globalCo2PerYearMegatonnes / yıllık küresel sigara
  /// tüketimi. Payda için kaynak (WHO/Tobacco Atlas yıllık tüketim rakamı)
  /// doğrulanmadan hesaplanmayacak. Türetilmiş değer olduğu için kullanıcıya
  /// "yaklaşık" ibaresiyle ve türetme notuyla gösterilecek.
  static const double? co2PerCigaretteGrams = null;

  // TODO(faz-1): Tek filtrenin selüloz asetat ağırlığı (gram) ve doğada
  /// bozunma süresi. Hakemli kaynak bulunana kadar boş.
  static const double? filterWeightGrams = null;
  static const double? filterDecompositionYears = null;
}

/// Zaman kazanımı.
class TimeFacts {
  const TimeFacts._();

  // TODO(faz-1): Sigara başına ortalama içme süresi (~5-6 dk aralığı
  /// raporlanıyor). Hakemli kaynak bulunana kadar "zaman kazanımı" paneli
  /// gizli kalır.
  static const double? smokingMinutesPerCigarette = null;
}

/// Sağlık iyileşme kilometre taşı.
///
/// [key] ARB anahtarının kökü: `milestone_<key>_title` / `_body`.
/// [source] kullanıcıya ⓘ ile gösterilen kaynak künyesi.
class RecoveryMilestone {
  const RecoveryMilestone({
    required this.key,
    required this.after,
    required this.source,
  });

  final String key;
  final Duration after;
  final RecoverySource source;
}

enum RecoverySource {
  /// WHO — "Tobacco: Health benefits of smoking cessation".
  /// Tam künye ve bağlantı: docs/health_sources.md (WHO-CESSATION)
  who,

  /// CDC — "Benefits of Quitting Smoking".
  /// https://www.cdc.gov/tobacco/about/benefits-of-quitting.html
  cdc,

  /// NHS (NHS Lanarkshire, World No Tobacco Day 2025 zaman çizelgesi).
  /// https://www.nhslanarkshire.scot.nhs.uk/pulse-world-no-tobacco-day-2025/
  nhs,
}

/// Sağlık iyileşme zaman çizelgesi.
///
/// Her taşın metni ARB'de 9 dilde tutulur; burada yalnızca zaman eşiği ve
/// kaynak vardır. Kaynaklar arasında küçük farklar mevcuttur (örn. CDC
/// erken saatlik taşları listelemez); bu yüzden her taş kendi kaynağını
/// taşır ve uygulamada o kaynak gösterilir.
///
/// Tüm kaynaklara erişim: 2026-08-19.
const recoveryTimeline = <RecoveryMilestone>[
  RecoveryMilestone(
    key: 'min20',
    after: Duration(minutes: 20),
    source: RecoverySource.who, // nabız ve tansiyon düşer
  ),
  RecoveryMilestone(
    key: 'hour8',
    after: Duration(hours: 8),
    source: RecoverySource.nhs, // CO ve oksijen normale dönmeye başlar
  ),
  RecoveryMilestone(
    key: 'hour12',
    after: Duration(hours: 12),
    source: RecoverySource.who, // kandaki CO normale döner
  ),
  RecoveryMilestone(
    key: 'hour24',
    after: Duration(hours: 24),
    source: RecoverySource.cdc, // kandaki nikotin sıfırlanır
  ),
  RecoveryMilestone(
    key: 'hour48',
    after: Duration(hours: 48),
    source: RecoverySource.nhs, // tat ve koku duyusu düzelir
  ),
  RecoveryMilestone(
    key: 'hour72',
    after: Duration(hours: 72),
    source: RecoverySource.nhs, // enerji seviyesi artmaya başlar
  ),
  RecoveryMilestone(
    key: 'week2',
    after: Duration(days: 14),
    source: RecoverySource.who, // dolaşım düzelir, akciğer kapasitesi artar
  ),
  RecoveryMilestone(
    key: 'month1',
    after: Duration(days: 30),
    source: RecoverySource.who, // öksürük ve nefes darlığı azalır
  ),
  RecoveryMilestone(
    key: 'month9',
    after: Duration(days: 274),
    source: RecoverySource.who,
  ),
  RecoveryMilestone(
    key: 'year1',
    after: Duration(days: 365),
    source: RecoverySource.who, // koroner kalp hastalığı riski yarıya iner
  ),
  RecoveryMilestone(
    key: 'year5',
    after: Duration(days: 1826),
    source: RecoverySource.who, // inme riski azalır
  ),
  RecoveryMilestone(
    key: 'year10',
    after: Duration(days: 3652),
    source: RecoverySource.who, // akciğer kanseri riski yarıya iner
  ),
  RecoveryMilestone(
    key: 'year15',
    after: Duration(days: 5479),
    source: RecoverySource.who, // KKH riski sigara içmeyenle aynı
  ),
  RecoveryMilestone(
    key: 'year20',
    after: Duration(days: 7305),
    source: RecoverySource.cdc, // ağız/boğaz/gırtlak kanseri riski normale
  ),
];
