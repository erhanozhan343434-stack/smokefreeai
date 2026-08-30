import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('nl'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh')
  ];

  /// Uygulama adı
  ///
  /// In en, this message translates to:
  /// **'SmokeFree AI'**
  String get appTitle;

  /// Ana ekran başlığı (şu an kullanılmıyor, ileride kullanılabilir)
  ///
  /// In en, this message translates to:
  /// **'Your progress'**
  String get dashboardTitle;

  /// Sigarasız süre sayacı etiketi
  ///
  /// In en, this message translates to:
  /// **'Smoke-free for'**
  String get counterSmokeFree;

  /// Biriken para sayacı etiketi
  ///
  /// In en, this message translates to:
  /// **'Money saved'**
  String get counterMoneySaved;

  /// İçilmeyen sigara sayacı etiketi
  ///
  /// In en, this message translates to:
  /// **'Cigarettes not smoked'**
  String get counterUnitsAvoided;

  /// Kriz butonu — en belirgin öğe
  ///
  /// In en, this message translates to:
  /// **'I want to smoke'**
  String get sosButton;

  /// Tıbbi sorumluluk reddi — mağaza incelemesi için ZORUNLU, silinemez
  ///
  /// In en, this message translates to:
  /// **'This app is for information and motivation only. It is not medical advice, diagnosis or treatment.'**
  String get disclaimerMedical;

  /// Genel 'Kaydet' butonu
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// Genel 'Vazgeç' butonu
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// Genel 'Bitir' butonu
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get commonFinish;

  /// Genel 'Sıradaki' butonu
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// Alt gezinme: özet/dashboard sekmesi
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get navSummary;

  /// Alt gezinme: sağlık/timeline sekmesi
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get navHealth;

  /// Alt gezinme: SOS sekmesi
  ///
  /// In en, this message translates to:
  /// **'SOS'**
  String get navSos;

  /// Alt gezinme: ayarlar sekmesi
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// Hero sayaç üstündeki küçük etiket
  ///
  /// In en, this message translates to:
  /// **'SMOKE-FREE'**
  String get heroSmokeFreeLabel;

  /// Hero sayaçtaki büyük gün sayısının yanındaki birim
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get heroDaysUnit;

  /// Hero sayaç altındaki kilometre taşı ilerlemesi. {unlocked} ve {total} sayı metni olarak gelir.
  ///
  /// In en, this message translates to:
  /// **'{unlocked} / {total} health milestones'**
  String heroMilestonesProgress(String unlocked, String total);

  /// İstatistik kartı: biriken para etiketi
  ///
  /// In en, this message translates to:
  /// **'Money saved'**
  String get statMoneySavedLabel;

  /// İstatistik kartı: biriken para alt notu
  ///
  /// In en, this message translates to:
  /// **'growing every day'**
  String get statMoneySavedSub;

  /// İstatistik kartı: içilmeyen sigara etiketi
  ///
  /// In en, this message translates to:
  /// **'Avoided'**
  String get statUnitsAvoidedLabel;

  /// İstatistik kartı: içilmeyen sigara alt notu (birim adı)
  ///
  /// In en, this message translates to:
  /// **'cigarettes'**
  String get statUnitsAvoidedSub;

  /// İstatistik kartı: geri kazanılan ömür etiketi
  ///
  /// In en, this message translates to:
  /// **'Life regained'**
  String get statLifeRegainedLabel;

  /// İstatistik kartı: geri kazanılan ömür alt notu (kaynak)
  ///
  /// In en, this message translates to:
  /// **'estimate · Addiction 2025'**
  String get statLifeRegainedSub;

  /// İstatistik kartı: iyileşme yüzdesi etiketi
  ///
  /// In en, this message translates to:
  /// **'Recovery'**
  String get statRecoveryLabel;

  /// İstatistik kartı: iyileşme alt notu. {unlocked} ve {total} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'{unlocked} / {total} milestones'**
  String statRecoverySub(String unlocked, String total);

  /// Doğrulanmamış veri paneli: ana mesaj
  ///
  /// In en, this message translates to:
  /// **'Source being verified'**
  String get pendingSourceVerifying;

  /// Doğrulanmamış veri paneli: alt not
  ///
  /// In en, this message translates to:
  /// **'panel hidden'**
  String get pendingSourceHiddenPanel;

  /// Rozet şeridi başlığı
  ///
  /// In en, this message translates to:
  /// **'BADGES'**
  String get badgesTitle;

  /// Kaç rozet açıldığı. {count} ve {total} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'{count} / {total} unlocked'**
  String badgesUnlockedCount(String count, String total);

  /// 7 gün rozeti
  ///
  /// In en, this message translates to:
  /// **'7 Days'**
  String get badgeDay7;

  /// 30 gün rozeti
  ///
  /// In en, this message translates to:
  /// **'30 Days'**
  String get badgeDay30;

  /// 90 gün rozeti
  ///
  /// In en, this message translates to:
  /// **'90 Days'**
  String get badgeDay90;

  /// 1 yıl rozeti
  ///
  /// In en, this message translates to:
  /// **'1 Year'**
  String get badgeYear1;

  /// Günlük check-in kartı başlığı
  ///
  /// In en, this message translates to:
  /// **'HOW ARE YOU TODAY?'**
  String get checkinTitle;

  /// Günlük check-in gövde metni. {days} gün sayısı metin olarak gelir.
  ///
  /// In en, this message translates to:
  /// **'You\'re on day {days} — every day you get through helps your body heal a little more.'**
  String checkinBody(String days);

  /// Check-in: iyiyim butonu
  ///
  /// In en, this message translates to:
  /// **'I\'m good'**
  String get checkinGood;

  /// Check-in: zorlanıyorum butonu
  ///
  /// In en, this message translates to:
  /// **'Struggling'**
  String get checkinStruggling;

  /// Check-in: 'iyiyim' sonrası bildirim
  ///
  /// In en, this message translates to:
  /// **'Good to hear. Keep going.'**
  String get checkinSnackGood;

  /// Check-in: gün içinde zaten 'iyiyim' yanıtı verildiğinde gösterilen not
  ///
  /// In en, this message translates to:
  /// **'You said \"I\'m good\" today — saved.'**
  String get checkinAnsweredGood;

  /// Check-in: gün içinde zaten 'zorlanıyorum' yanıtı verildiğinde gösterilen not
  ///
  /// In en, this message translates to:
  /// **'You said \"Struggling\" today — SOS is right here.'**
  String get checkinAnsweredStruggling;

  /// Tüm sağlık kilometre taşları açıldığında gösterilen kutlama metni
  ///
  /// In en, this message translates to:
  /// **'You\'ve unlocked every health milestone.'**
  String get milestoneAllUnlocked;

  /// Sıradaki kilometre taşı kartı başlığı
  ///
  /// In en, this message translates to:
  /// **'NEXT MILESTONE'**
  String get milestoneNextLabel;

  /// Kilometre taşının ne zaman açılacağı ve kaynağı. {time} süre metni, {source} kaynak kısaltması (WHO/CDC/NHS).
  ///
  /// In en, this message translates to:
  /// **'Unlocks in {time} · Source: {source}'**
  String milestoneOpensIn(String time, String source);

  /// 'Bırakmasaydın' panelinin başlığı
  ///
  /// In en, this message translates to:
  /// **'IF YOU HADN\'T QUIT'**
  String get counterfactualTitle;

  /// Bırakmasaydı içilecek sigara sayısı. {units} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'{units} cigarettes'**
  String counterfactualUnits(String units);

  /// Ömür verisi yokken gösterilen kayıp metni. {money} biçimlendirilmiş para metni.
  ///
  /// In en, this message translates to:
  /// **'you would have burned {money}.'**
  String counterfactualMoneyOnly(String money);

  /// Ömür verisi varken gösterilen kayıp metni. {money} para, {life} süre metni.
  ///
  /// In en, this message translates to:
  /// **'you would have burned {money} and lost {life} of life.'**
  String counterfactualMoneyAndLife(String money, String life);

  /// Deneme banner'ı başlığı
  ///
  /// In en, this message translates to:
  /// **'Unlock everything'**
  String get trialTitle;

  /// Deneme banner'ı alt açıklaması
  ///
  /// In en, this message translates to:
  /// **'Unlimited SOS, full health data and all badges'**
  String get trialSubtitle;

  /// Deneme banner'ı çağrı butonu (satır sonu \n içerir)
  ///
  /// In en, this message translates to:
  /// **'Try free\nfor 3 days'**
  String get trialCta;

  /// Premium ekranı başlığı
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get paywallTitle;

  /// Premium henüz kurulmadıysa gösterilen başlık
  ///
  /// In en, this message translates to:
  /// **'Premium is coming soon'**
  String get paywallComingSoonTitle;

  /// Premium henüz kurulmadıysa gösterilen açıklama
  ///
  /// In en, this message translates to:
  /// **'Store-side setup for payments isn\'t finished yet. This screen will switch to purchase options automatically once it\'s ready.'**
  String get paywallComingSoonBody;

  /// Fiyatlar yüklenemediğinde gösterilen hata
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load prices. Check your internet connection.'**
  String get paywallLoadError;

  /// Satın alınabilir paket yokken gösterilen mesaj
  ///
  /// In en, this message translates to:
  /// **'No packages available right now.'**
  String get paywallNoPackages;

  /// Satın alımları geri yükle butonu
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get paywallRestore;

  /// Geri yükleme başarılı mesajı
  ///
  /// In en, this message translates to:
  /// **'Your purchases have been restored.'**
  String get paywallRestoreSuccess;

  /// Geri yüklenecek aktif satın alım yokken gösterilen mesaj
  ///
  /// In en, this message translates to:
  /// **'No active purchase found to restore.'**
  String get paywallRestoreNone;

  /// Geri yükleme başarısız mesajı
  ///
  /// In en, this message translates to:
  /// **'Restore failed.'**
  String get paywallRestoreFailed;

  /// Premium özellik listesi başlığı
  ///
  /// In en, this message translates to:
  /// **'UNLOCK EVERYTHING'**
  String get paywallFeaturesTitle;

  /// Premium özellik 1
  ///
  /// In en, this message translates to:
  /// **'Unlimited SOS and AI Coach chat'**
  String get paywallFeatureSos;

  /// Premium özellik 2
  ///
  /// In en, this message translates to:
  /// **'Full health recovery timeline'**
  String get paywallFeatureTimeline;

  /// Premium özellik 3
  ///
  /// In en, this message translates to:
  /// **'All badges and milestones'**
  String get paywallFeatureBadges;

  /// Premium özellik 4
  ///
  /// In en, this message translates to:
  /// **'Ad-free experience'**
  String get paywallFeatureAdFree;

  /// Satın alma başarılı mesajı
  ///
  /// In en, this message translates to:
  /// **'Thank you! You\'re premium now.'**
  String get paywallThanks;

  /// Satın alma başarısız mesajı
  ///
  /// In en, this message translates to:
  /// **'Purchase couldn\'t be completed.'**
  String get paywallPurchaseFailed;

  /// SOS ekranı üst etiket
  ///
  /// In en, this message translates to:
  /// **'THIS MOMENT IS HARD'**
  String get sosHeader;

  /// SOS ekranı alt açıklama (satır sonu \n içerir)
  ///
  /// In en, this message translates to:
  /// **'A craving lasts about 3 minutes on average.\nLet\'s get through it together.'**
  String get sosSubtitle;

  /// SOS ekranındaki büyük nefes butonu
  ///
  /// In en, this message translates to:
  /// **'BREATHE'**
  String get sosBreatheButton;

  /// SOS eylem kutusu: nefes egzersizi (satır sonu \n içerir)
  ///
  /// In en, this message translates to:
  /// **'4-7-8 breathing\nexercise'**
  String get sosActionBreathing;

  /// SOS eylem kutusu: AI koç (satır sonu \n içerir)
  ///
  /// In en, this message translates to:
  /// **'Talk to\nAI Coach'**
  String get sosActionCoach;

  /// SOS eylem kutusu: kraving kaydet (satır sonu \n içerir)
  ///
  /// In en, this message translates to:
  /// **'Log a\ncraving'**
  String get sosActionCraving;

  /// SOS eylem kutusu: dikkat dağıt (satır sonu \n içerir)
  ///
  /// In en, this message translates to:
  /// **'Distract\nyourself'**
  String get sosActionDistract;

  /// SOS ekranı alt uyarı başlığı. {days} gün sayısı metin.
  ///
  /// In en, this message translates to:
  /// **'DON\'T THROW AWAY {days} DAYS'**
  String sosDontWaste(String days);

  /// SOS ekranı alt uyarı gövdesi. {units} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'Smoking now won\'t reset your streak — it\'ll be marked as a slip. But you\'ve earned {units} cigarettes\' worth of effort.'**
  String sosRelapseWarning(String units);

  /// Kraving kaydet formu başlığı
  ///
  /// In en, this message translates to:
  /// **'LOG A CRAVING'**
  String get cravingTitle;

  /// Kraving şiddeti. {value} 1-10 arası sayı metni.
  ///
  /// In en, this message translates to:
  /// **'Intensity: {value}'**
  String cravingIntensity(String value);

  /// Kraving tetikleyici seçeneği
  ///
  /// In en, this message translates to:
  /// **'Coffee'**
  String get cravingCueCoffee;

  /// Kraving tetikleyici seçeneği
  ///
  /// In en, this message translates to:
  /// **'Stress'**
  String get cravingCueStress;

  /// Kraving tetikleyici seçeneği
  ///
  /// In en, this message translates to:
  /// **'After a meal'**
  String get cravingCueAfterMeal;

  /// Kraving tetikleyici seçeneği
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get cravingCueSocial;

  /// Kraving tetikleyici seçeneği
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get cravingCueOther;

  /// Kraving formu kaydet butonu
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get cravingSave;

  /// Kraving kaydedildi bildirimi
  ///
  /// In en, this message translates to:
  /// **'Saved. This will pass too.'**
  String get cravingSaved;

  /// 4-7-8 nefes egzersizi ekran başlığı
  ///
  /// In en, this message translates to:
  /// **'4-7-8 Breathing Exercise'**
  String get breathingTitle;

  /// Kaçıncı turda olunduğu. {cycle} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'Round {cycle}'**
  String breathingRound(String cycle);

  /// Nefes alma fazı etiketi
  ///
  /// In en, this message translates to:
  /// **'BREATHE IN'**
  String get breathingInhaleLabel;

  /// Nefes alma fazı ipucu
  ///
  /// In en, this message translates to:
  /// **'Slowly breathe in through your nose.'**
  String get breathingInhaleHint;

  /// Nefes tutma fazı etiketi
  ///
  /// In en, this message translates to:
  /// **'HOLD'**
  String get breathingHoldLabel;

  /// Nefes tutma fazı ipucu
  ///
  /// In en, this message translates to:
  /// **'Hold your breath, let your shoulders relax.'**
  String get breathingHoldHint;

  /// Nefes verme fazı etiketi
  ///
  /// In en, this message translates to:
  /// **'BREATHE OUT'**
  String get breathingExhaleLabel;

  /// Nefes verme fazı ipucu
  ///
  /// In en, this message translates to:
  /// **'Slowly breathe out through your mouth.'**
  String get breathingExhaleHint;

  /// Egzersizi bitir butonu
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get breathingFinish;

  /// 5-4-3-2-1 dikkat dağıtma ekran başlığı
  ///
  /// In en, this message translates to:
  /// **'Distract Yourself'**
  String get distractionTitle;

  /// Adım sayacı. {index} ve {total} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'{index} / {total}'**
  String distractionStep(String index, String total);

  /// Adım açıklaması
  ///
  /// In en, this message translates to:
  /// **'Look around and count them off. No rush — take a few seconds for each one.'**
  String get distractionInstructions;

  /// Son adımda bitir butonu
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get distractionFinish;

  /// Sıradaki adım butonu
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get distractionNext;

  /// 5 duyu adımı: görme. {count} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'Name {count} things you can SEE'**
  String distractionStep1(String count);

  /// 5 duyu adımı: dokunma. {count} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'Name {count} things you can TOUCH'**
  String distractionStep2(String count);

  /// 5 duyu adımı: duyma. {count} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'Name {count} things you can HEAR'**
  String distractionStep3(String count);

  /// 5 duyu adımı: koklama. {count} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'Name {count} things you can SMELL'**
  String distractionStep4(String count);

  /// 5 duyu adımı: tatma. {count} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'Name {count} thing you can TASTE'**
  String distractionStep5(String count);

  /// AI Koç ekran başlığı
  ///
  /// In en, this message translates to:
  /// **'AI Coach'**
  String get aiCoachTitle;

  /// AI Koç kurulmadıysa başlık
  ///
  /// In en, this message translates to:
  /// **'AI Coach is coming soon'**
  String get aiCoachComingSoonTitle;

  /// AI Koç kurulmadıysa açıklama
  ///
  /// In en, this message translates to:
  /// **'Server-side setup for this feature isn\'t finished yet. This screen will switch to chat automatically once it\'s ready.'**
  String get aiCoachComingSoonBody;

  /// Sohbet boşken gösterilen karşılama
  ///
  /// In en, this message translates to:
  /// **'Hi, I\'m your AI Coach. Tell me how you\'re feeling — I\'m here with you.'**
  String get aiCoachEmptyState;

  /// Kriz numarası gösterimi. {number} telefon numarası.
  ///
  /// In en, this message translates to:
  /// **'Call now: {number}'**
  String aiCoachCallNow(String number);

  /// Kriz banner'ı alt notu
  ///
  /// In en, this message translates to:
  /// **'You\'re not alone.'**
  String get aiCoachNotAlone;

  /// Mesaj gönderilemediğinde gösterilen hata
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t send the message. Check your connection and try again?'**
  String get aiCoachSendError;

  /// Mesaj yazma alanı placeholder metni
  ///
  /// In en, this message translates to:
  /// **'Type...'**
  String get aiCoachInputHint;

  /// Onboarding karşılama başlığı
  ///
  /// In en, this message translates to:
  /// **'Welcome to SmokeFree AI'**
  String get onboardingWelcome;

  /// Onboarding açıklama metni
  ///
  /// In en, this message translates to:
  /// **'We need a few details to calculate your counter and stats correctly. You can change these anytime in Settings.'**
  String get onboardingIntro;

  /// Form bölümü başlığı: ne içiyorsun (onboarding'de 'içiyordun')
  ///
  /// In en, this message translates to:
  /// **'WHAT DID YOU USE?'**
  String get sectionProduct;

  /// Form bölümü başlığı: ne içiyorsun (Ayarlar ekranında)
  ///
  /// In en, this message translates to:
  /// **'WHAT DO YOU USE?'**
  String get sectionProductSettings;

  /// Form bölümü başlığı: günlük tüketim
  ///
  /// In en, this message translates to:
  /// **'DAILY USE'**
  String get sectionDaily;

  /// Form bölümü başlığı: paket fiyatı
  ///
  /// In en, this message translates to:
  /// **'PACK PRICE'**
  String get sectionPrice;

  /// Form bölümü başlığı: bırakma anı
  ///
  /// In en, this message translates to:
  /// **'QUIT MOMENT'**
  String get sectionQuitMoment;

  /// Günlük tüketim alan etiketi. {unit} birim adı (adet/puf/ml/seans/poşet).
  ///
  /// In en, this message translates to:
  /// **'How many {unit} per day'**
  String perDayLabel(String unit);

  /// Paket başına birim alan etiketi. {unit} birim adı.
  ///
  /// In en, this message translates to:
  /// **'How many {unit} per pack'**
  String perPackLabel(String unit);

  /// Fiyat alanı etiketi
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get priceLabel;

  /// Onboarding formunu bitirme butonu
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get onboardingStart;

  /// Form hatası: ürün seçilmedi
  ///
  /// In en, this message translates to:
  /// **'Please choose what you used.'**
  String get errorSelectProduct;

  /// Form hatası: günlük tüketim geçersiz
  ///
  /// In en, this message translates to:
  /// **'Daily use must be a valid number.'**
  String get errorDailyInvalid;

  /// Form hatası: paket başına birim geçersiz
  ///
  /// In en, this message translates to:
  /// **'Units per pack must be a valid number.'**
  String get errorPerPackInvalid;

  /// Form hatası: fiyat geçersiz
  ///
  /// In en, this message translates to:
  /// **'Price must be a valid number.'**
  String get errorPriceInvalid;

  /// Ayarlar ekranı başlığı
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Ayarlar ekranı açıklaması
  ///
  /// In en, this message translates to:
  /// **'Update your profile, manage notifications, or reset your data.'**
  String get settingsSubtitle;

  /// Ayarlar formu kaydet butonu
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get settingsSave;

  /// Ayarlar kaydedildi bildirimi
  ///
  /// In en, this message translates to:
  /// **'Your info has been saved.'**
  String get settingsSaved;

  /// Bildirimler bölümü başlığı
  ///
  /// In en, this message translates to:
  /// **'NOTIFICATIONS'**
  String get settingsNotificationsTitle;

  /// Bildirimler bölümü açıklaması
  ///
  /// In en, this message translates to:
  /// **'Daily reminders and support notifications'**
  String get settingsNotificationsBody;

  /// Tehlikeli bölge başlığı
  ///
  /// In en, this message translates to:
  /// **'DANGER ZONE'**
  String get settingsDangerTitle;

  /// Tehlikeli bölge açıklaması
  ///
  /// In en, this message translates to:
  /// **'Your profile and entire history will be permanently deleted and the app will start over.'**
  String get settingsDangerBody;

  /// Verileri sıfırla butonu
  ///
  /// In en, this message translates to:
  /// **'Reset My Data'**
  String get settingsResetButton;

  /// Sıfırlama onay diyaloğu başlığı
  ///
  /// In en, this message translates to:
  /// **'Reset your data?'**
  String get settingsResetDialogTitle;

  /// Sıfırlama onay diyaloğu açıklaması
  ///
  /// In en, this message translates to:
  /// **'Your profile and entire history (check-ins, craving logs) will be permanently deleted. This CANNOT be undone.'**
  String get settingsResetDialogBody;

  /// Sıfırlama onay diyaloğu vazgeç butonu
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settingsResetCancel;

  /// Sıfırlama onay diyaloğu onayla butonu
  ///
  /// In en, this message translates to:
  /// **'Yes, delete'**
  String get settingsResetConfirm;

  /// Dil seçimi bölümü başlığı
  ///
  /// In en, this message translates to:
  /// **'LANGUAGE'**
  String get settingsLanguageTitle;

  /// Dil seçiminde 'telefonun dilini kullan' seçeneği
  ///
  /// In en, this message translates to:
  /// **'System language'**
  String get settingsLanguageSystemDefault;

  /// Sürüm bilgisi gösterimi. {version} sürüm numarası metni.
  ///
  /// In en, this message translates to:
  /// **'SmokeFree AI · v{version}'**
  String settingsVersion(String version);

  /// Ürün tipi: sigara
  ///
  /// In en, this message translates to:
  /// **'Cigarettes'**
  String get productCigarette;

  /// Ürün tipi: elle sarma
  ///
  /// In en, this message translates to:
  /// **'Roll-your-own'**
  String get productRollYourOwn;

  /// Ürün tipi: elektronik sigara
  ///
  /// In en, this message translates to:
  /// **'Vape'**
  String get productVape;

  /// Ürün tipi: nargile
  ///
  /// In en, this message translates to:
  /// **'Hookah'**
  String get productHookah;

  /// Ürün tipi: puro
  ///
  /// In en, this message translates to:
  /// **'Cigar'**
  String get productCigar;

  /// Ürün tipi: snus
  ///
  /// In en, this message translates to:
  /// **'Snus'**
  String get productSnus;

  /// Birim: adet (sigara/elle sarma/puro)
  ///
  /// In en, this message translates to:
  /// **'pieces'**
  String get unitPiece;

  /// Birim: elektronik sigara (puf/ml)
  ///
  /// In en, this message translates to:
  /// **'puffs/ml'**
  String get unitVape;

  /// Birim: nargile (seans)
  ///
  /// In en, this message translates to:
  /// **'sessions'**
  String get unitHookah;

  /// Birim: snus (poşet)
  ///
  /// In en, this message translates to:
  /// **'pouches'**
  String get unitSnus;

  /// Birim: ürün seçilmeden önce genel birim
  ///
  /// In en, this message translates to:
  /// **'units'**
  String get unitGeneric;

  /// Tarih hızlı seçim: şu an
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get dateNow;

  /// Tarih hızlı seçim: dün
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get dateYesterday;

  /// Tarih hızlı seçim: 1 hafta önce
  ///
  /// In en, this message translates to:
  /// **'1 week ago'**
  String get dateWeekAgo;

  /// Tarih hızlı seçim: 1 ay önce
  ///
  /// In en, this message translates to:
  /// **'1 month ago'**
  String get dateMonthAgo;

  /// Süre biçimi: gün + saat. {days} ve {hours} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'{days}d {hours}h'**
  String durationDaysHours(String days, String hours);

  /// Süre biçimi: saat + dakika. {hours} ve {minutes} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String durationHoursMinutes(String hours, String minutes);

  /// Süre biçimi: sadece dakika. {minutes} sayı metni.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m'**
  String durationMinutes(String minutes);

  /// Süre biçimi: negatif/sıfır durumunda
  ///
  /// In en, this message translates to:
  /// **'0m'**
  String get durationZeroMinutes;

  /// Sağlık zaman çizelgesi üst etiket
  ///
  /// In en, this message translates to:
  /// **'HEALTH RECOVERY TIMELINE'**
  String get timelineHeader;

  /// Sağlık zaman çizelgesi alt başlık
  ///
  /// In en, this message translates to:
  /// **'Your body is repairing itself'**
  String get timelineSubheader;

  /// Şu anki kilometre taşı satırı. {title} taş adı metni.
  ///
  /// In en, this message translates to:
  /// **'{title} · you\'re here now'**
  String timelineNowHere(String title);

  /// Kilometre taşı kaynak etiketi. {source} kaynak kısaltması.
  ///
  /// In en, this message translates to:
  /// **'Source: {source}'**
  String timelineSource(String source);

  /// Kilometre taşı başlığı: 20 dakika
  ///
  /// In en, this message translates to:
  /// **'20 minutes'**
  String get milestoneMin20Title;

  /// Kilometre taşı açıklaması: 20 dakika
  ///
  /// In en, this message translates to:
  /// **'Heart rate and blood pressure drop.'**
  String get milestoneMin20Body;

  /// Kilometre taşı başlığı: 8 saat
  ///
  /// In en, this message translates to:
  /// **'8 hours'**
  String get milestoneHour8Title;

  /// Kilometre taşı açıklaması: 8 saat
  ///
  /// In en, this message translates to:
  /// **'Carbon monoxide and oxygen levels start returning to normal.'**
  String get milestoneHour8Body;

  /// Kilometre taşı başlığı: 12 saat
  ///
  /// In en, this message translates to:
  /// **'12 hours'**
  String get milestoneHour12Title;

  /// Kilometre taşı açıklaması: 12 saat
  ///
  /// In en, this message translates to:
  /// **'Blood carbon monoxide returns to normal.'**
  String get milestoneHour12Body;

  /// Kilometre taşı başlığı: 24 saat
  ///
  /// In en, this message translates to:
  /// **'24 hours'**
  String get milestoneHour24Title;

  /// Kilometre taşı açıklaması: 24 saat
  ///
  /// In en, this message translates to:
  /// **'Nicotine is cleared from your blood.'**
  String get milestoneHour24Body;

  /// Kilometre taşı başlığı: 48 saat
  ///
  /// In en, this message translates to:
  /// **'48 hours'**
  String get milestoneHour48Title;

  /// Kilometre taşı açıklaması: 48 saat
  ///
  /// In en, this message translates to:
  /// **'Taste and smell start to improve.'**
  String get milestoneHour48Body;

  /// Kilometre taşı başlığı: 72 saat
  ///
  /// In en, this message translates to:
  /// **'72 hours'**
  String get milestoneHour72Title;

  /// Kilometre taşı açıklaması: 72 saat
  ///
  /// In en, this message translates to:
  /// **'Energy levels start to rise.'**
  String get milestoneHour72Body;

  /// Kilometre taşı başlığı: 2-12 hafta
  ///
  /// In en, this message translates to:
  /// **'2–12 weeks'**
  String get milestoneWeek2Title;

  /// Kilometre taşı açıklaması: 2-12 hafta
  ///
  /// In en, this message translates to:
  /// **'Circulation improves, lung function increases.'**
  String get milestoneWeek2Body;

  /// Kilometre taşı başlığı: 1-9 ay
  ///
  /// In en, this message translates to:
  /// **'1–9 months'**
  String get milestoneMonth1Title;

  /// Kilometre taşı açıklaması: 1-9 ay
  ///
  /// In en, this message translates to:
  /// **'Coughing and shortness of breath decrease.'**
  String get milestoneMonth1Body;

  /// Kilometre taşı başlığı: 9 ay
  ///
  /// In en, this message translates to:
  /// **'9 months'**
  String get milestoneMonth9Title;

  /// Kilometre taşı açıklaması: 9 ay
  ///
  /// In en, this message translates to:
  /// **'Lung cilia recover, lowering infection risk.'**
  String get milestoneMonth9Body;

  /// Kilometre taşı başlığı: 1 yıl
  ///
  /// In en, this message translates to:
  /// **'1 year'**
  String get milestoneYear1Title;

  /// Kilometre taşı açıklaması: 1 yıl
  ///
  /// In en, this message translates to:
  /// **'Coronary heart disease risk drops to about half that of a smoker.'**
  String get milestoneYear1Body;

  /// Kilometre taşı başlığı: 5 yıl
  ///
  /// In en, this message translates to:
  /// **'5 years'**
  String get milestoneYear5Title;

  /// Kilometre taşı açıklaması: 5 yıl
  ///
  /// In en, this message translates to:
  /// **'Stroke risk decreases.'**
  String get milestoneYear5Body;

  /// Kilometre taşı başlığı: 10 yıl
  ///
  /// In en, this message translates to:
  /// **'10 years'**
  String get milestoneYear10Title;

  /// Kilometre taşı açıklaması: 10 yıl
  ///
  /// In en, this message translates to:
  /// **'Lung cancer risk drops to about half that of a smoker.'**
  String get milestoneYear10Body;

  /// Kilometre taşı başlığı: 15 yıl
  ///
  /// In en, this message translates to:
  /// **'15 years'**
  String get milestoneYear15Title;

  /// Kilometre taşı açıklaması: 15 yıl
  ///
  /// In en, this message translates to:
  /// **'Coronary heart disease risk matches that of a non-smoker.'**
  String get milestoneYear15Body;

  /// Kilometre taşı başlığı: 20 yıl
  ///
  /// In en, this message translates to:
  /// **'20 years'**
  String get milestoneYear20Title;

  /// Kilometre taşı açıklaması: 20 yıl
  ///
  /// In en, this message translates to:
  /// **'Risk of mouth, throat and larynx cancer approaches that of a non-smoker.'**
  String get milestoneYear20Body;

  /// İyileşme yüzdesi gösterimi. {percent} zaten hesaplanmış tam sayı (örn. 86).
  ///
  /// In en, this message translates to:
  /// **'{percent}%'**
  String statRecoveryValue(String percent);

  /// Bildirim anahtarının altında gösterilen, henüz aktif olmadığını belirten alt yazı.
  ///
  /// In en, this message translates to:
  /// **'Reminders coming soon'**
  String get settingsNotificationsComingSoon;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'de',
        'el',
        'en',
        'es',
        'fr',
        'it',
        'nl',
        'ru',
        'tr',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return L10nAr();
    case 'de':
      return L10nDe();
    case 'el':
      return L10nEl();
    case 'en':
      return L10nEn();
    case 'es':
      return L10nEs();
    case 'fr':
      return L10nFr();
    case 'it':
      return L10nIt();
    case 'nl':
      return L10nNl();
    case 'ru':
      return L10nRu();
    case 'tr':
      return L10nTr();
    case 'zh':
      return L10nZh();
  }

  throw FlutterError(
      'L10n.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
