// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'SmokeFree AI';

  @override
  String get dashboardTitle => 'Your progress';

  @override
  String get counterSmokeFree => 'Smoke-free for';

  @override
  String get counterMoneySaved => 'Money saved';

  @override
  String get counterUnitsAvoided => 'Cigarettes not smoked';

  @override
  String get sosButton => 'I want to smoke';

  @override
  String get disclaimerMedical =>
      'This app is for information and motivation only. It is not medical advice, diagnosis or treatment.';

  @override
  String get commonSave => 'Save';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonFinish => 'Finish';

  @override
  String get commonNext => 'Next';

  @override
  String get navSummary => 'Summary';

  @override
  String get navHealth => 'Health';

  @override
  String get navSos => 'SOS';

  @override
  String get navSettings => 'Settings';

  @override
  String get heroSmokeFreeLabel => 'SMOKE-FREE';

  @override
  String get heroDaysUnit => 'days';

  @override
  String heroMilestonesProgress(String unlocked, String total) {
    return '$unlocked / $total health milestones';
  }

  @override
  String get statMoneySavedLabel => 'Money saved';

  @override
  String get statMoneySavedSub => 'growing every day';

  @override
  String get statUnitsAvoidedLabel => 'Avoided';

  @override
  String get statUnitsAvoidedSub => 'cigarettes';

  @override
  String get statLifeRegainedLabel => 'Life regained';

  @override
  String get statLifeRegainedSub => 'estimate · Addiction 2025';

  @override
  String get statRecoveryLabel => 'Recovery';

  @override
  String statRecoverySub(String unlocked, String total) {
    return '$unlocked / $total milestones';
  }

  @override
  String get pendingSourceVerifying => 'Source being verified';

  @override
  String get pendingSourceHiddenPanel => 'panel hidden';

  @override
  String get badgesTitle => 'BADGES';

  @override
  String badgesUnlockedCount(String count, String total) {
    return '$count / $total unlocked';
  }

  @override
  String get badgeDay7 => '7 Days';

  @override
  String get badgeDay30 => '30 Days';

  @override
  String get badgeDay90 => '90 Days';

  @override
  String get badgeYear1 => '1 Year';

  @override
  String get checkinTitle => 'HOW ARE YOU TODAY?';

  @override
  String checkinBody(String days) {
    return 'You\'re on day $days — every day you get through helps your body heal a little more.';
  }

  @override
  String get checkinGood => 'I\'m good';

  @override
  String get checkinStruggling => 'Struggling';

  @override
  String get checkinSnackGood => 'Good to hear. Keep going.';

  @override
  String get checkinAnsweredGood => 'You said \"I\'m good\" today — saved.';

  @override
  String get checkinAnsweredStruggling =>
      'You said \"Struggling\" today — SOS is right here.';

  @override
  String get milestoneAllUnlocked => 'You\'ve unlocked every health milestone.';

  @override
  String get milestoneNextLabel => 'NEXT MILESTONE';

  @override
  String milestoneOpensIn(String time, String source) {
    return 'Unlocks in $time · Source: $source';
  }

  @override
  String get counterfactualTitle => 'IF YOU HADN\'T QUIT';

  @override
  String counterfactualUnits(String units) {
    return '$units cigarettes';
  }

  @override
  String counterfactualMoneyOnly(String money) {
    return 'you would have burned $money.';
  }

  @override
  String counterfactualMoneyAndLife(String money, String life) {
    return 'you would have burned $money and lost $life of life.';
  }

  @override
  String get trialTitle => 'Unlock everything';

  @override
  String get trialSubtitle => 'Unlimited SOS, full health data and all badges';

  @override
  String get trialCta => 'Try free\nfor 3 days';

  @override
  String get paywallTitle => 'Premium';

  @override
  String get paywallComingSoonTitle => 'Premium is coming soon';

  @override
  String get paywallComingSoonBody =>
      'Store-side setup for payments isn\'t finished yet. This screen will switch to purchase options automatically once it\'s ready.';

  @override
  String get paywallLoadError =>
      'Couldn\'t load prices. Check your internet connection.';

  @override
  String get paywallNoPackages => 'No packages available right now.';

  @override
  String get paywallRestore => 'Restore purchases';

  @override
  String get paywallRestoreSuccess => 'Your purchases have been restored.';

  @override
  String get paywallRestoreNone => 'No active purchase found to restore.';

  @override
  String get paywallRestoreFailed => 'Restore failed.';

  @override
  String get paywallFeaturesTitle => 'UNLOCK EVERYTHING';

  @override
  String get paywallFeatureSos => 'Unlimited SOS and AI Coach chat';

  @override
  String get paywallFeatureTimeline => 'Full health recovery timeline';

  @override
  String get paywallFeatureBadges => 'All badges and milestones';

  @override
  String get paywallFeatureAdFree => 'Ad-free experience';

  @override
  String get paywallThanks => 'Thank you! You\'re premium now.';

  @override
  String get paywallPurchaseFailed => 'Purchase couldn\'t be completed.';

  @override
  String get sosHeader => 'THIS MOMENT IS HARD';

  @override
  String get sosSubtitle =>
      'A craving lasts about 3 minutes on average.\nLet\'s get through it together.';

  @override
  String get sosBreatheButton => 'BREATHE';

  @override
  String get sosActionBreathing => '4-7-8 breathing\nexercise';

  @override
  String get sosActionCoach => 'Talk to\nAI Coach';

  @override
  String get sosActionCraving => 'Log a\ncraving';

  @override
  String get sosActionDistract => 'Distract\nyourself';

  @override
  String sosDontWaste(String days) {
    return 'DON\'T THROW AWAY $days DAYS';
  }

  @override
  String sosRelapseWarning(String units) {
    return 'Smoking now won\'t reset your streak — it\'ll be marked as a slip. But you\'ve earned $units cigarettes\' worth of effort.';
  }

  @override
  String get cravingTitle => 'LOG A CRAVING';

  @override
  String cravingIntensity(String value) {
    return 'Intensity: $value';
  }

  @override
  String get cravingCueCoffee => 'Coffee';

  @override
  String get cravingCueStress => 'Stress';

  @override
  String get cravingCueAfterMeal => 'After a meal';

  @override
  String get cravingCueSocial => 'Social';

  @override
  String get cravingCueOther => 'Other';

  @override
  String get cravingSave => 'Save';

  @override
  String get cravingSaved => 'Saved. This will pass too.';

  @override
  String get breathingTitle => '4-7-8 Breathing Exercise';

  @override
  String breathingRound(String cycle) {
    return 'Round $cycle';
  }

  @override
  String get breathingInhaleLabel => 'BREATHE IN';

  @override
  String get breathingInhaleHint => 'Slowly breathe in through your nose.';

  @override
  String get breathingHoldLabel => 'HOLD';

  @override
  String get breathingHoldHint => 'Hold your breath, let your shoulders relax.';

  @override
  String get breathingExhaleLabel => 'BREATHE OUT';

  @override
  String get breathingExhaleHint => 'Slowly breathe out through your mouth.';

  @override
  String get breathingFinish => 'Finish';

  @override
  String get distractionTitle => 'Distract Yourself';

  @override
  String distractionStep(String index, String total) {
    return '$index / $total';
  }

  @override
  String get distractionInstructions =>
      'Look around and count them off. No rush — take a few seconds for each one.';

  @override
  String get distractionFinish => 'Finish';

  @override
  String get distractionNext => 'Next';

  @override
  String distractionStep1(String count) {
    return 'Name $count things you can SEE';
  }

  @override
  String distractionStep2(String count) {
    return 'Name $count things you can TOUCH';
  }

  @override
  String distractionStep3(String count) {
    return 'Name $count things you can HEAR';
  }

  @override
  String distractionStep4(String count) {
    return 'Name $count things you can SMELL';
  }

  @override
  String distractionStep5(String count) {
    return 'Name $count thing you can TASTE';
  }

  @override
  String get aiCoachTitle => 'AI Coach';

  @override
  String get aiCoachComingSoonTitle => 'AI Coach is coming soon';

  @override
  String get aiCoachComingSoonBody =>
      'Server-side setup for this feature isn\'t finished yet. This screen will switch to chat automatically once it\'s ready.';

  @override
  String get aiCoachEmptyState =>
      'Hi, I\'m your AI Coach. Tell me how you\'re feeling — I\'m here with you.';

  @override
  String aiCoachCallNow(String number) {
    return 'Call now: $number';
  }

  @override
  String get aiCoachNotAlone => 'You\'re not alone.';

  @override
  String get aiCoachSendError =>
      'Couldn\'t send the message. Check your connection and try again?';

  @override
  String get aiCoachInputHint => 'Type...';

  @override
  String get onboardingWelcome => 'Welcome to SmokeFree AI';

  @override
  String get onboardingIntro =>
      'We need a few details to calculate your counter and stats correctly. You can change these anytime in Settings.';

  @override
  String get sectionProduct => 'WHAT DID YOU USE?';

  @override
  String get sectionProductSettings => 'WHAT DO YOU USE?';

  @override
  String get sectionDaily => 'DAILY USE';

  @override
  String get sectionPrice => 'PACK PRICE';

  @override
  String get sectionQuitMoment => 'QUIT MOMENT';

  @override
  String perDayLabel(String unit) {
    return 'How many $unit per day';
  }

  @override
  String perPackLabel(String unit) {
    return 'How many $unit per pack';
  }

  @override
  String get priceLabel => 'Price';

  @override
  String get onboardingStart => 'Start';

  @override
  String get errorSelectProduct => 'Please choose what you used.';

  @override
  String get errorDailyInvalid => 'Daily use must be a valid number.';

  @override
  String get errorPerPackInvalid => 'Units per pack must be a valid number.';

  @override
  String get errorPriceInvalid => 'Price must be a valid number.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSubtitle =>
      'Update your profile, manage notifications, or reset your data.';

  @override
  String get settingsSave => 'Save';

  @override
  String get settingsSaved => 'Your info has been saved.';

  @override
  String get settingsNotificationsTitle => 'NOTIFICATIONS';

  @override
  String get settingsNotificationsBody =>
      'Daily reminders and support notifications';

  @override
  String get settingsDangerTitle => 'DANGER ZONE';

  @override
  String get settingsDangerBody =>
      'Your profile and entire history will be permanently deleted and the app will start over.';

  @override
  String get settingsResetButton => 'Reset My Data';

  @override
  String get settingsResetDialogTitle => 'Reset your data?';

  @override
  String get settingsResetDialogBody =>
      'Your profile and entire history (check-ins, craving logs) will be permanently deleted. This CANNOT be undone.';

  @override
  String get settingsResetCancel => 'Cancel';

  @override
  String get settingsResetConfirm => 'Yes, delete';

  @override
  String get settingsLanguageTitle => 'LANGUAGE';

  @override
  String get settingsLanguageSystemDefault => 'System language';

  @override
  String settingsVersion(String version) {
    return 'SmokeFree AI · v$version';
  }

  @override
  String get productCigarette => 'Cigarettes';

  @override
  String get productRollYourOwn => 'Roll-your-own';

  @override
  String get productVape => 'Vape';

  @override
  String get productHookah => 'Hookah';

  @override
  String get productCigar => 'Cigar';

  @override
  String get productSnus => 'Snus';

  @override
  String get unitPiece => 'pieces';

  @override
  String get unitVape => 'puffs/ml';

  @override
  String get unitHookah => 'sessions';

  @override
  String get unitSnus => 'pouches';

  @override
  String get unitGeneric => 'units';

  @override
  String get dateNow => 'Now';

  @override
  String get dateYesterday => 'Yesterday';

  @override
  String get dateWeekAgo => '1 week ago';

  @override
  String get dateMonthAgo => '1 month ago';

  @override
  String durationDaysHours(String days, String hours) {
    return '${days}d ${hours}h';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String durationMinutes(String minutes) {
    return '${minutes}m';
  }

  @override
  String get durationZeroMinutes => '0m';

  @override
  String get timelineHeader => 'HEALTH RECOVERY TIMELINE';

  @override
  String get timelineSubheader => 'Your body is repairing itself';

  @override
  String timelineNowHere(String title) {
    return '$title · you\'re here now';
  }

  @override
  String timelineSource(String source) {
    return 'Source: $source';
  }

  @override
  String get milestoneMin20Title => '20 minutes';

  @override
  String get milestoneMin20Body => 'Heart rate and blood pressure drop.';

  @override
  String get milestoneHour8Title => '8 hours';

  @override
  String get milestoneHour8Body =>
      'Carbon monoxide and oxygen levels start returning to normal.';

  @override
  String get milestoneHour12Title => '12 hours';

  @override
  String get milestoneHour12Body => 'Blood carbon monoxide returns to normal.';

  @override
  String get milestoneHour24Title => '24 hours';

  @override
  String get milestoneHour24Body => 'Nicotine is cleared from your blood.';

  @override
  String get milestoneHour48Title => '48 hours';

  @override
  String get milestoneHour48Body => 'Taste and smell start to improve.';

  @override
  String get milestoneHour72Title => '72 hours';

  @override
  String get milestoneHour72Body => 'Energy levels start to rise.';

  @override
  String get milestoneWeek2Title => '2–12 weeks';

  @override
  String get milestoneWeek2Body =>
      'Circulation improves, lung function increases.';

  @override
  String get milestoneMonth1Title => '1–9 months';

  @override
  String get milestoneMonth1Body =>
      'Coughing and shortness of breath decrease.';

  @override
  String get milestoneMonth9Title => '9 months';

  @override
  String get milestoneMonth9Body =>
      'Lung cilia recover, lowering infection risk.';

  @override
  String get milestoneYear1Title => '1 year';

  @override
  String get milestoneYear1Body =>
      'Coronary heart disease risk drops to about half that of a smoker.';

  @override
  String get milestoneYear5Title => '5 years';

  @override
  String get milestoneYear5Body => 'Stroke risk decreases.';

  @override
  String get milestoneYear10Title => '10 years';

  @override
  String get milestoneYear10Body =>
      'Lung cancer risk drops to about half that of a smoker.';

  @override
  String get milestoneYear15Title => '15 years';

  @override
  String get milestoneYear15Body =>
      'Coronary heart disease risk matches that of a non-smoker.';

  @override
  String get milestoneYear20Title => '20 years';

  @override
  String get milestoneYear20Body =>
      'Risk of mouth, throat and larynx cancer approaches that of a non-smoker.';

  @override
  String statRecoveryValue(String percent) {
    return '$percent%';
  }

  @override
  String get settingsNotificationsComingSoon => 'Reminders coming soon';
}
