// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class L10nTr extends L10n {
  L10nTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'SmokeFree AI';

  @override
  String get dashboardTitle => 'İlerlemen';

  @override
  String get counterSmokeFree => 'Sigarasız süre';

  @override
  String get counterMoneySaved => 'Biriken para';

  @override
  String get counterUnitsAvoided => 'İçilmeyen sigara';

  @override
  String get sosButton => 'Canım sigara istiyor';

  @override
  String get disclaimerMedical =>
      'Bu uygulama bilgilendirme ve motivasyon amaçlıdır; tıbbi tavsiye, teşhis veya tedavi yerine geçmez.';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonCancel => 'Vazgeç';

  @override
  String get commonFinish => 'Bitir';

  @override
  String get commonNext => 'Sıradaki';

  @override
  String get navSummary => 'Özet';

  @override
  String get navHealth => 'Sağlık';

  @override
  String get navSos => 'SOS';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get heroSmokeFreeLabel => 'SIGARASIZ';

  @override
  String get heroDaysUnit => 'gün';

  @override
  String heroMilestonesProgress(String unlocked, String total) {
    return '$unlocked / $total sağlık kilometre taşı';
  }

  @override
  String get statMoneySavedLabel => 'Biriken para';

  @override
  String get statMoneySavedSub => 'her gün artıyor';

  @override
  String get statUnitsAvoidedLabel => 'İçilmeyen';

  @override
  String get statUnitsAvoidedSub => 'sigara';

  @override
  String get statLifeRegainedLabel => 'Geri kazanılan ömür';

  @override
  String get statLifeRegainedSub => 'tahmini · Addiction 2025';

  @override
  String get statRecoveryLabel => 'İyileşme';

  @override
  String statRecoverySub(String unlocked, String total) {
    return '$unlocked / $total taş';
  }

  @override
  String get pendingSourceVerifying => 'Kaynak doğrulanıyor';

  @override
  String get pendingSourceHiddenPanel => 'panel gizli';

  @override
  String get badgesTitle => 'ROZETLER';

  @override
  String badgesUnlockedCount(String count, String total) {
    return '$count / $total açık';
  }

  @override
  String get badgeDay7 => '7 Gün';

  @override
  String get badgeDay30 => '30 Gün';

  @override
  String get badgeDay90 => '90 Gün';

  @override
  String get badgeYear1 => '1 Yıl';

  @override
  String get checkinTitle => 'BUGÜN NASILSIN?';

  @override
  String checkinBody(String days) {
    return '$days. günündesin — az önce geçirdiğin her gün bedeninin kendini onarmasına bir gün daha kazandırıyor.';
  }

  @override
  String get checkinGood => 'İyiyim';

  @override
  String get checkinStruggling => 'Zorlanıyorum';

  @override
  String get checkinSnackGood => 'Bunu duymak güzel. Devam et.';

  @override
  String get checkinAnsweredGood => 'Bugün için \"İyiyim\" dedin — kaydedildi.';

  @override
  String get checkinAnsweredStruggling =>
      'Bugün için \"Zorlanıyorum\" dedin — SOS yanında.';

  @override
  String get milestoneAllUnlocked => 'Tüm sağlık kilometre taşlarını açtın.';

  @override
  String get milestoneNextLabel => 'SIRADAKİ KİLOMETRE TAŞI';

  @override
  String milestoneOpensIn(String time, String source) {
    return '$time sonra açılıyor · Kaynak: $source';
  }

  @override
  String get counterfactualTitle => 'BIRAKMASAYDIN';

  @override
  String counterfactualUnits(String units) {
    return '$units sigara';
  }

  @override
  String counterfactualMoneyOnly(String money) {
    return '$money yakmış olacaktın.';
  }

  @override
  String counterfactualMoneyAndLife(String money, String life) {
    return '$money yakmış, $life ömür kaybetmiş olacaktın.';
  }

  @override
  String get trialTitle => 'Tüm özellikleri aç';

  @override
  String get trialSubtitle => 'Sınırsız SOS, tam sağlık verisi ve tüm rozetler';

  @override
  String get trialCta => '3 gün\nücretsiz dene';

  @override
  String get paywallTitle => 'Premium';

  @override
  String get paywallComingSoonTitle => 'Premium yakında burada';

  @override
  String get paywallComingSoonBody =>
      'Ödeme altyapısı için mağaza tarafı kurulum henüz tamamlanmadı. Hazır olduğunda bu ekran otomatik olarak satın alma seçeneklerine dönüşecek.';

  @override
  String get paywallLoadError =>
      'Fiyatlar yüklenemedi. İnternet bağlantını kontrol et.';

  @override
  String get paywallNoPackages => 'Şu anda satın alınabilir paket yok.';

  @override
  String get paywallRestore => 'Satın alımları geri yükle';

  @override
  String get paywallRestoreSuccess => 'Satın alımların geri yüklendi.';

  @override
  String get paywallRestoreNone =>
      'Geri yüklenecek aktif bir satın alım bulunamadı.';

  @override
  String get paywallRestoreFailed => 'Geri yükleme başarısız oldu.';

  @override
  String get paywallFeaturesTitle => 'TÜM ÖZELLİKLERİ AÇ';

  @override
  String get paywallFeatureSos => 'Sınırsız SOS ve AI Koç sohbeti';

  @override
  String get paywallFeatureTimeline => 'Tam sağlık iyileşme zaman çizelgesi';

  @override
  String get paywallFeatureBadges => 'Tüm rozetler ve kilometre taşları';

  @override
  String get paywallFeatureAdFree => 'Reklamsız deneyim';

  @override
  String get paywallThanks => 'Teşekkürler! Artık premium\'sun.';

  @override
  String get paywallPurchaseFailed => 'Satın alma tamamlanamadı.';

  @override
  String get sosHeader => 'ŞU AN ZOR AN';

  @override
  String get sosSubtitle =>
      'Kriz ortalama 3 dakika sürer.\nBirlikte geçirelim.';

  @override
  String get sosBreatheButton => 'NEFES AL';

  @override
  String get sosActionBreathing => '4-7-8 nefes\negzersizi';

  @override
  String get sosActionCoach => 'AI Koç ile\nkonuş';

  @override
  String get sosActionCraving => 'Kraving\nkaydet';

  @override
  String get sosActionDistract => 'Dikkat\ndağıt';

  @override
  String sosDontWaste(String days) {
    return '$days GÜNÜ ÇÖPE ATMA';
  }

  @override
  String sosRelapseWarning(String units) {
    return 'Şimdi içersen serin sıfırlanmaz — kaçamak olarak işaretlenir. Ama $units sigaralık emeğin var.';
  }

  @override
  String get cravingTitle => 'KRAVING KAYDET';

  @override
  String cravingIntensity(String value) {
    return 'Şiddet: $value';
  }

  @override
  String get cravingCueCoffee => 'Kahve';

  @override
  String get cravingCueStress => 'Stres';

  @override
  String get cravingCueAfterMeal => 'Yemek sonrası';

  @override
  String get cravingCueSocial => 'Sosyal';

  @override
  String get cravingCueOther => 'Diğer';

  @override
  String get cravingSave => 'Kaydet';

  @override
  String get cravingSaved => 'Kaydedildi. Bu da geçecek.';

  @override
  String get breathingTitle => '4-7-8 Nefes Egzersizi';

  @override
  String breathingRound(String cycle) {
    return '$cycle. tur';
  }

  @override
  String get breathingInhaleLabel => 'NEFES AL';

  @override
  String get breathingInhaleHint => 'Burnundan yavaşça içeri çek.';

  @override
  String get breathingHoldLabel => 'TUT';

  @override
  String get breathingHoldHint => 'Nefesini tut, omuzların gevşesin.';

  @override
  String get breathingExhaleLabel => 'VER';

  @override
  String get breathingExhaleHint => 'Ağzından yavaşça üfleyerek ver.';

  @override
  String get breathingFinish => 'Bitir';

  @override
  String get distractionTitle => 'Dikkat Dağıt';

  @override
  String distractionStep(String index, String total) {
    return '$index / $total';
  }

  @override
  String get distractionInstructions =>
      'Etrafına bak ve sırayla say. Aceleye gerek yok, her biri için birkaç saniye ayır.';

  @override
  String get distractionFinish => 'Bitir';

  @override
  String get distractionNext => 'Sıradaki';

  @override
  String distractionStep1(String count) {
    return '$count şeyi GÖR';
  }

  @override
  String distractionStep2(String count) {
    return '$count şeye DOKUN';
  }

  @override
  String distractionStep3(String count) {
    return '$count sesi DUY';
  }

  @override
  String distractionStep4(String count) {
    return '$count şeyi KOKLA';
  }

  @override
  String distractionStep5(String count) {
    return '$count şeyin tadına bak';
  }

  @override
  String get aiCoachTitle => 'AI Koç';

  @override
  String get aiCoachComingSoonTitle => 'AI Koç yakında burada';

  @override
  String get aiCoachComingSoonBody =>
      'Bu özellik için sunucu tarafı kurulum henüz tamamlanmadı. Hazır olduğunda bu ekran otomatik olarak sohbete dönüşecek.';

  @override
  String get aiCoachEmptyState =>
      'Merhaba, ben AI Koç. Ne hissettiğini yazabilirsin, seninle buradayım.';

  @override
  String aiCoachCallNow(String number) {
    return 'Hemen ara: $number';
  }

  @override
  String get aiCoachNotAlone => 'Yalnız değilsin.';

  @override
  String get aiCoachSendError =>
      'Mesaj gönderilemedi. İnternet bağlantını kontrol edip tekrar dener misin?';

  @override
  String get aiCoachInputHint => 'Yaz...';

  @override
  String get onboardingWelcome => 'SmokeFree AI\'a hoş geldin';

  @override
  String get onboardingIntro =>
      'Sayaç ve istatistiklerin doğru hesaplanması için birkaç bilgiye ihtiyacımız var. İstediğin zaman Ayarlar\'dan değiştirebilirsin.';

  @override
  String get sectionProduct => 'NE İÇİYORDUN?';

  @override
  String get sectionProductSettings => 'NE İÇİYORSUN?';

  @override
  String get sectionDaily => 'GÜNLÜK TÜKETİM';

  @override
  String get sectionPrice => 'PAKET FİYATI';

  @override
  String get sectionQuitMoment => 'BIRAKMA ANI';

  @override
  String perDayLabel(String unit) {
    return 'Günde kaç $unit';
  }

  @override
  String perPackLabel(String unit) {
    return 'Pakette kaç $unit';
  }

  @override
  String get priceLabel => 'Fiyat';

  @override
  String get onboardingStart => 'Başla';

  @override
  String get errorSelectProduct => 'Lütfen ne içtiğini seç.';

  @override
  String get errorDailyInvalid => 'Günlük tüketim geçerli bir sayı olmalı.';

  @override
  String get errorPerPackInvalid =>
      'Paketteki birim sayısı geçerli bir sayı olmalı.';

  @override
  String get errorPriceInvalid => 'Fiyat geçerli bir sayı olmalı.';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsSubtitle =>
      'Profilini güncelle, bildirimleri yönet ya da verilerini sıfırla.';

  @override
  String get settingsSave => 'Kaydet';

  @override
  String get settingsSaved => 'Bilgilerin kaydedildi.';

  @override
  String get settingsNotificationsTitle => 'BİLDİRİMLER';

  @override
  String get settingsNotificationsBody =>
      'Günlük hatırlatma ve destek bildirimleri';

  @override
  String get settingsDangerTitle => 'TEHLİKELİ BÖLGE';

  @override
  String get settingsDangerBody =>
      'Profilin ve tüm geçmişin kalıcı olarak silinir, uygulama baştan başlar.';

  @override
  String get settingsResetButton => 'Verilerimi Sıfırla';

  @override
  String get settingsResetDialogTitle => 'Verilerini sıfırla?';

  @override
  String get settingsResetDialogBody =>
      'Profilin ve tüm geçmişin (check-in, kraving kayıtları) kalıcı olarak silinecek. Bu işlem GERİ ALINAMAZ.';

  @override
  String get settingsResetCancel => 'Vazgeç';

  @override
  String get settingsResetConfirm => 'Evet, sil';

  @override
  String get settingsLanguageTitle => 'DİL';

  @override
  String get settingsLanguageSystemDefault => 'Sistem dili';

  @override
  String settingsVersion(String version) {
    return 'SmokeFree AI · v$version';
  }

  @override
  String get productCigarette => 'Sigara';

  @override
  String get productRollYourOwn => 'Elle sarma';

  @override
  String get productVape => 'Elektronik sigara';

  @override
  String get productHookah => 'Nargile';

  @override
  String get productCigar => 'Puro';

  @override
  String get productSnus => 'Snus';

  @override
  String get unitPiece => 'adet';

  @override
  String get unitVape => 'puf/ml';

  @override
  String get unitHookah => 'seans';

  @override
  String get unitSnus => 'poşet';

  @override
  String get unitGeneric => 'birim';

  @override
  String get dateNow => 'Şu an';

  @override
  String get dateYesterday => 'Dün';

  @override
  String get dateWeekAgo => '1 hafta önce';

  @override
  String get dateMonthAgo => '1 ay önce';

  @override
  String durationDaysHours(String days, String hours) {
    return '$days gün $hours sa';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '$hours sa $minutes dk';
  }

  @override
  String durationMinutes(String minutes) {
    return '$minutes dk';
  }

  @override
  String get durationZeroMinutes => '0 dk';

  @override
  String get timelineHeader => 'SAĞLIK İYİLEŞME ÇİZELGESİ';

  @override
  String get timelineSubheader => 'Vücudun kendini onarıyor';

  @override
  String timelineNowHere(String title) {
    return '$title · şu an buradasın';
  }

  @override
  String timelineSource(String source) {
    return 'Kaynak: $source';
  }

  @override
  String get milestoneMin20Title => '20 dakika';

  @override
  String get milestoneMin20Body => 'Nabız ve tansiyon düşer.';

  @override
  String get milestoneHour8Title => '8 saat';

  @override
  String get milestoneHour8Body =>
      'Karbonmonoksit ve oksijen seviyeleri normale dönmeye başlar.';

  @override
  String get milestoneHour12Title => '12 saat';

  @override
  String get milestoneHour12Body => 'Kandaki karbonmonoksit normale döner.';

  @override
  String get milestoneHour24Title => '24 saat';

  @override
  String get milestoneHour24Body => 'Kandaki nikotin sıfırlanır.';

  @override
  String get milestoneHour48Title => '48 saat';

  @override
  String get milestoneHour48Body => 'Tat ve koku duyusu düzelir.';

  @override
  String get milestoneHour72Title => '72 saat';

  @override
  String get milestoneHour72Body => 'Enerji seviyesi artmaya başlar.';

  @override
  String get milestoneWeek2Title => '2–12 hafta';

  @override
  String get milestoneWeek2Body => 'Dolaşım düzelir, akciğer kapasitesi artar.';

  @override
  String get milestoneMonth1Title => '1–9 ay';

  @override
  String get milestoneMonth1Body => 'Öksürük ve nefes darlığı azalır.';

  @override
  String get milestoneMonth9Title => '9 ay';

  @override
  String get milestoneMonth9Body =>
      'Akciğer silia yapıları toparlanır, enfeksiyon riski azalır.';

  @override
  String get milestoneYear1Title => '1 yıl';

  @override
  String get milestoneYear1Body =>
      'Koroner kalp hastalığı riski, içenlerin yarısına iner.';

  @override
  String get milestoneYear5Title => '5 yıl';

  @override
  String get milestoneYear5Body => 'İnme riski azalır.';

  @override
  String get milestoneYear10Title => '10 yıl';

  @override
  String get milestoneYear10Body =>
      'Akciğer kanseri riski, içenlerin yaklaşık yarısına iner.';

  @override
  String get milestoneYear15Title => '15 yıl';

  @override
  String get milestoneYear15Body =>
      'Koroner kalp hastalığı riski içmeyenle aynı seviyeye iner.';

  @override
  String get milestoneYear20Title => '20 yıl';

  @override
  String get milestoneYear20Body =>
      'Ağız, boğaz ve gırtlak kanseri riski içmeyen seviyesine yaklaşır.';

  @override
  String statRecoveryValue(String percent) {
    return '%$percent';
  }

  @override
  String get settingsNotificationsComingSoon =>
      'Hatırlatmalar yakında aktif olacak';
}
