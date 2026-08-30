// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class L10nAr extends L10n {
  L10nAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'SmokeFree AI';

  @override
  String get dashboardTitle => 'تقدّمك';

  @override
  String get counterSmokeFree => 'بلا تدخين منذ';

  @override
  String get counterMoneySaved => 'المال الموفَّر';

  @override
  String get counterUnitsAvoided => 'سجائر لم تُدخَّن';

  @override
  String get sosButton => 'أريد التدخين';

  @override
  String get disclaimerMedical =>
      'هذا التطبيق مخصص للمعلومات والتحفيز فقط، ولا يُغني عن الاستشارة الطبية أو التشخيص أو العلاج.';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonFinish => 'إنهاء';

  @override
  String get commonNext => 'التالي';

  @override
  String get navSummary => 'الملخص';

  @override
  String get navHealth => 'الصحة';

  @override
  String get navSos => 'استغاثة';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get heroSmokeFreeLabel => 'بلا تدخين';

  @override
  String get heroDaysUnit => 'يوم';

  @override
  String heroMilestonesProgress(String unlocked, String total) {
    return '$unlocked / $total من محطات الصحة';
  }

  @override
  String get statMoneySavedLabel => 'المال الموفَّر';

  @override
  String get statMoneySavedSub => 'يزداد كل يوم';

  @override
  String get statUnitsAvoidedLabel => 'تم تجنبها';

  @override
  String get statUnitsAvoidedSub => 'سجائر';

  @override
  String get statLifeRegainedLabel => 'عمر مُستعاد';

  @override
  String get statLifeRegainedSub => 'تقدير · Addiction 2025';

  @override
  String get statRecoveryLabel => 'التعافي';

  @override
  String statRecoverySub(String unlocked, String total) {
    return '$unlocked / $total محطة';
  }

  @override
  String get pendingSourceVerifying => 'جارٍ التحقق من المصدر';

  @override
  String get pendingSourceHiddenPanel => 'اللوحة مخفية';

  @override
  String get badgesTitle => 'الأوسمة';

  @override
  String badgesUnlockedCount(String count, String total) {
    return '$count / $total مفتوح';
  }

  @override
  String get badgeDay7 => '7 أيام';

  @override
  String get badgeDay30 => '30 يومًا';

  @override
  String get badgeDay90 => '90 يومًا';

  @override
  String get badgeYear1 => 'سنة واحدة';

  @override
  String get checkinTitle => 'كيف حالك اليوم؟';

  @override
  String checkinBody(String days) {
    return 'أنت في اليوم $days — كل يوم تجتازه يساعد جسدك على الشفاء أكثر قليلًا.';
  }

  @override
  String get checkinGood => 'أنا بخير';

  @override
  String get checkinStruggling => 'الأمر صعب';

  @override
  String get checkinSnackGood => 'سعيد بسماع ذلك. استمر.';

  @override
  String get checkinAnsweredGood => 'قلت اليوم \"أنا بخير\" — تم الحفظ.';

  @override
  String get checkinAnsweredStruggling =>
      'قلت اليوم \"الأمر صعب\" — زر الاستغاثة هنا بجانبك.';

  @override
  String get milestoneAllUnlocked => 'لقد فتحت جميع محطات الصحة.';

  @override
  String get milestoneNextLabel => 'المحطة التالية';

  @override
  String milestoneOpensIn(String time, String source) {
    return 'تُفتح خلال $time · المصدر: $source';
  }

  @override
  String get counterfactualTitle => 'لو لم تكن قد أقلعت';

  @override
  String counterfactualUnits(String units) {
    return '$units سيجارة';
  }

  @override
  String counterfactualMoneyOnly(String money) {
    return 'لكنت أحرقت $money.';
  }

  @override
  String counterfactualMoneyAndLife(String money, String life) {
    return 'لكنت أحرقت $money وخسرت $life من عمرك.';
  }

  @override
  String get trialTitle => 'افتح كل شيء';

  @override
  String get trialSubtitle =>
      'استغاثة بلا حدود، بيانات صحية كاملة، وجميع الأوسمة';

  @override
  String get trialCta => 'جرّب مجانًا\nلمدة 3 أيام';

  @override
  String get paywallTitle => 'بريميوم';

  @override
  String get paywallComingSoonTitle => 'بريميوم قريبًا';

  @override
  String get paywallComingSoonBody =>
      'لم يكتمل بعد إعداد المدفوعات من جهة المتجر. ستتحول هذه الشاشة تلقائيًا إلى خيارات الشراء بمجرد أن تصبح جاهزة.';

  @override
  String get paywallLoadError =>
      'تعذّر تحميل الأسعار. تحقق من اتصالك بالإنترنت.';

  @override
  String get paywallNoPackages => 'لا توجد باقات متاحة حاليًا.';

  @override
  String get paywallRestore => 'استعادة المشتريات';

  @override
  String get paywallRestoreSuccess => 'تمت استعادة مشترياتك.';

  @override
  String get paywallRestoreNone =>
      'لم يتم العثور على أي عملية شراء نشطة لاستعادتها.';

  @override
  String get paywallRestoreFailed => 'فشلت عملية الاستعادة.';

  @override
  String get paywallFeaturesTitle => 'افتح كل شيء';

  @override
  String get paywallFeatureSos => 'استغاثة بلا حدود ومحادثة مع المدرّب الذكي';

  @override
  String get paywallFeatureTimeline => 'الجدول الزمني الكامل للتعافي الصحي';

  @override
  String get paywallFeatureBadges => 'جميع الأوسمة والمحطات';

  @override
  String get paywallFeatureAdFree => 'تجربة بلا إعلانات';

  @override
  String get paywallThanks => 'شكرًا لك! أصبحت الآن مشتركًا في بريميوم.';

  @override
  String get paywallPurchaseFailed => 'تعذّر إتمام عملية الشراء.';

  @override
  String get sosHeader => 'هذه اللحظة صعبة';

  @override
  String get sosSubtitle =>
      'تدوم الرغبة الملحّة نحو 3 دقائق في المتوسط.\nلنتجاوزها معًا.';

  @override
  String get sosBreatheButton => 'تنفّس';

  @override
  String get sosActionBreathing => 'تمرين تنفس\n4-7-8';

  @override
  String get sosActionCoach => 'تحدّث مع\nالمدرّب الذكي';

  @override
  String get sosActionCraving => 'سجّل\nرغبة ملحّة';

  @override
  String get sosActionDistract => 'شتّت\nانتباهك';

  @override
  String sosDontWaste(String days) {
    return 'لا تُهدر $days يومًا';
  }

  @override
  String sosRelapseWarning(String units) {
    return 'إذا دخّنت الآن فلن يُصفَّر سجلك — بل سيُسجَّل كانتكاسة. لكنك بذلت بالفعل جهد $units سيجارة.';
  }

  @override
  String get cravingTitle => 'تسجيل رغبة ملحّة';

  @override
  String cravingIntensity(String value) {
    return 'الشدة: $value';
  }

  @override
  String get cravingCueCoffee => 'قهوة';

  @override
  String get cravingCueStress => 'توتر';

  @override
  String get cravingCueAfterMeal => 'بعد الأكل';

  @override
  String get cravingCueSocial => 'اجتماعي';

  @override
  String get cravingCueOther => 'أخرى';

  @override
  String get cravingSave => 'حفظ';

  @override
  String get cravingSaved => 'تم الحفظ. هذا أيضًا سيمر.';

  @override
  String get breathingTitle => 'تمرين تنفس 4-7-8';

  @override
  String breathingRound(String cycle) {
    return 'الجولة $cycle';
  }

  @override
  String get breathingInhaleLabel => 'شهيق';

  @override
  String get breathingInhaleHint => 'استنشق ببطء من أنفك.';

  @override
  String get breathingHoldLabel => 'احبس';

  @override
  String get breathingHoldHint => 'احبس نفسك، ودع كتفيك يسترخيان.';

  @override
  String get breathingExhaleLabel => 'زفير';

  @override
  String get breathingExhaleHint => 'أخرج الزفير ببطء من فمك.';

  @override
  String get breathingFinish => 'إنهاء';

  @override
  String get distractionTitle => 'شتّت انتباهك';

  @override
  String distractionStep(String index, String total) {
    return '$index / $total';
  }

  @override
  String get distractionInstructions =>
      'انظر حولك وعدّها واحدة تلو الأخرى. لا داعي للعجلة — خذ بضع ثوانٍ لكل واحدة.';

  @override
  String get distractionFinish => 'إنهاء';

  @override
  String get distractionNext => 'التالي';

  @override
  String distractionStep1(String count) {
    return 'اذكر $count أشياء تستطيع رؤيتها';
  }

  @override
  String distractionStep2(String count) {
    return 'اذكر $count أشياء تستطيع لمسها';
  }

  @override
  String distractionStep3(String count) {
    return 'اذكر $count أصوات تستطيع سماعها';
  }

  @override
  String distractionStep4(String count) {
    return 'اذكر $count روائح تستطيع شمّها';
  }

  @override
  String distractionStep5(String count) {
    return 'اذكر $count طعمًا تستطيع تذوّقه';
  }

  @override
  String get aiCoachTitle => 'المدرّب الذكي';

  @override
  String get aiCoachComingSoonTitle => 'المدرّب الذكي قريبًا';

  @override
  String get aiCoachComingSoonBody =>
      'لم يكتمل بعد إعداد الخادم لهذه الميزة. ستتحول هذه الشاشة تلقائيًا إلى المحادثة بمجرد أن تصبح جاهزة.';

  @override
  String get aiCoachEmptyState =>
      'مرحبًا، أنا مدرّبك الذكي. أخبرني بما تشعر به — أنا هنا معك.';

  @override
  String aiCoachCallNow(String number) {
    return 'اتصل الآن: $number';
  }

  @override
  String get aiCoachNotAlone => 'أنت لست وحدك.';

  @override
  String get aiCoachSendError =>
      'تعذّر إرسال الرسالة. هل تتحقق من اتصالك وتحاول مرة أخرى؟';

  @override
  String get aiCoachInputHint => 'اكتب...';

  @override
  String get onboardingWelcome => 'مرحبًا بك في SmokeFree AI';

  @override
  String get onboardingIntro =>
      'نحتاج إلى بعض المعلومات لحساب العدّاد والإحصاءات بشكل صحيح. يمكنك تغييرها في أي وقت من الإعدادات.';

  @override
  String get sectionProduct => 'ماذا كنت تستهلك؟';

  @override
  String get sectionProductSettings => 'ماذا تستهلك؟';

  @override
  String get sectionDaily => 'الاستهلاك اليومي';

  @override
  String get sectionPrice => 'سعر العلبة';

  @override
  String get sectionQuitMoment => 'لحظة الإقلاع';

  @override
  String perDayLabel(String unit) {
    return 'كم $unit في اليوم';
  }

  @override
  String perPackLabel(String unit) {
    return 'كم $unit في العلبة';
  }

  @override
  String get priceLabel => 'السعر';

  @override
  String get onboardingStart => 'ابدأ';

  @override
  String get errorSelectProduct => 'الرجاء اختيار ما كنت تستهلكه.';

  @override
  String get errorDailyInvalid => 'يجب أن يكون الاستهلاك اليومي رقمًا صالحًا.';

  @override
  String get errorPerPackInvalid =>
      'يجب أن يكون عدد الوحدات في العلبة رقمًا صالحًا.';

  @override
  String get errorPriceInvalid => 'يجب أن يكون السعر رقمًا صالحًا.';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsSubtitle =>
      'حدّث ملفك الشخصي، أو أدر الإشعارات، أو أعِد ضبط بياناتك.';

  @override
  String get settingsSave => 'حفظ';

  @override
  String get settingsSaved => 'تم حفظ معلوماتك.';

  @override
  String get settingsNotificationsTitle => 'الإشعارات';

  @override
  String get settingsNotificationsBody => 'تذكيرات يومية وإشعارات داعمة';

  @override
  String get settingsDangerTitle => 'منطقة الخطر';

  @override
  String get settingsDangerBody =>
      'سيتم حذف ملفك الشخصي وسجلّك بالكامل نهائيًا، وسيبدأ التطبيق من جديد.';

  @override
  String get settingsResetButton => 'إعادة ضبط بياناتي';

  @override
  String get settingsResetDialogTitle => 'إعادة ضبط بياناتك؟';

  @override
  String get settingsResetDialogBody =>
      'سيتم حذف ملفك الشخصي وسجلّك بالكامل (تسجيلات الحالة اليومية، والرغبات الملحّة) نهائيًا. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get settingsResetCancel => 'إلغاء';

  @override
  String get settingsResetConfirm => 'نعم، احذف';

  @override
  String get settingsLanguageTitle => 'اللغة';

  @override
  String get settingsLanguageSystemDefault => 'لغة النظام';

  @override
  String settingsVersion(String version) {
    return 'SmokeFree AI · الإصدار $version';
  }

  @override
  String get productCigarette => 'سجائر';

  @override
  String get productRollYourOwn => 'تبغ ملفوف يدويًا';

  @override
  String get productVape => 'سيجارة إلكترونية';

  @override
  String get productHookah => 'أرجيلة';

  @override
  String get productCigar => 'سيجار';

  @override
  String get productSnus => 'سنوس';

  @override
  String get unitPiece => 'قطعة';

  @override
  String get unitVape => 'نفسة/مل';

  @override
  String get unitHookah => 'جلسة';

  @override
  String get unitSnus => 'كيس';

  @override
  String get unitGeneric => 'وحدة';

  @override
  String get dateNow => 'الآن';

  @override
  String get dateYesterday => 'أمس';

  @override
  String get dateWeekAgo => 'قبل أسبوع';

  @override
  String get dateMonthAgo => 'قبل شهر';

  @override
  String durationDaysHours(String days, String hours) {
    return '$days يوم $hours س';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '$hours س $minutes د';
  }

  @override
  String durationMinutes(String minutes) {
    return '$minutes د';
  }

  @override
  String get durationZeroMinutes => '0 د';

  @override
  String get timelineHeader => 'الجدول الزمني للتعافي الصحي';

  @override
  String get timelineSubheader => 'جسدك يُصلح نفسه';

  @override
  String timelineNowHere(String title) {
    return '$title · أنت هنا الآن';
  }

  @override
  String timelineSource(String source) {
    return 'المصدر: $source';
  }

  @override
  String get milestoneMin20Title => '20 دقيقة';

  @override
  String get milestoneMin20Body => 'ينخفض معدل ضربات القلب وضغط الدم.';

  @override
  String get milestoneHour8Title => '8 ساعات';

  @override
  String get milestoneHour8Body =>
      'تبدأ مستويات أول أكسيد الكربون والأكسجين بالعودة إلى طبيعتها.';

  @override
  String get milestoneHour12Title => '12 ساعة';

  @override
  String get milestoneHour12Body =>
      'يعود أول أكسيد الكربون في الدم إلى مستواه الطبيعي.';

  @override
  String get milestoneHour24Title => '24 ساعة';

  @override
  String get milestoneHour24Body => 'تُطرح النيكوتين بالكامل من دمك.';

  @override
  String get milestoneHour48Title => '48 ساعة';

  @override
  String get milestoneHour48Body => 'تبدأ حاستا التذوق والشم في التحسن.';

  @override
  String get milestoneHour72Title => '72 ساعة';

  @override
  String get milestoneHour72Body => 'يبدأ مستوى الطاقة في الارتفاع.';

  @override
  String get milestoneWeek2Title => '2–12 أسبوعًا';

  @override
  String get milestoneWeek2Body => 'تتحسن الدورة الدموية وتزداد سعة الرئتين.';

  @override
  String get milestoneMonth1Title => '1–9 أشهر';

  @override
  String get milestoneMonth1Body => 'يقل السعال وضيق التنفس.';

  @override
  String get milestoneMonth9Title => '9 أشهر';

  @override
  String get milestoneMonth9Body => 'تتعافى أهداب الرئة، وينخفض خطر العدوى.';

  @override
  String get milestoneYear1Title => 'سنة واحدة';

  @override
  String get milestoneYear1Body =>
      'ينخفض خطر الإصابة بأمراض القلب التاجية إلى نحو نصف خطر المدخن.';

  @override
  String get milestoneYear5Title => '5 سنوات';

  @override
  String get milestoneYear5Body => 'ينخفض خطر السكتة الدماغية.';

  @override
  String get milestoneYear10Title => '10 سنوات';

  @override
  String get milestoneYear10Body =>
      'ينخفض خطر سرطان الرئة إلى نحو نصف خطر المدخن.';

  @override
  String get milestoneYear15Title => '15 سنة';

  @override
  String get milestoneYear15Body =>
      'يصبح خطر الإصابة بأمراض القلب التاجية مساويًا لخطر غير المدخن.';

  @override
  String get milestoneYear20Title => '20 سنة';

  @override
  String get milestoneYear20Body =>
      'يقترب خطر سرطان الفم والحلق والحنجرة من خطر غير المدخن.';

  @override
  String statRecoveryValue(String percent) {
    return '$percent%';
  }

  @override
  String get settingsNotificationsComingSoon => 'التذكيرات قريبًا';
}
