// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class L10nDe extends L10n {
  L10nDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'SmokeFree AI';

  @override
  String get dashboardTitle => 'Dein Fortschritt';

  @override
  String get counterSmokeFree => 'Rauchfrei seit';

  @override
  String get counterMoneySaved => 'Gespartes Geld';

  @override
  String get counterUnitsAvoided => 'Nicht gerauchte Zigaretten';

  @override
  String get sosButton => 'Ich will rauchen';

  @override
  String get disclaimerMedical =>
      'Diese App dient nur der Information und Motivation. Sie ersetzt keine medizinische Beratung, Diagnose oder Behandlung.';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonFinish => 'Fertig';

  @override
  String get commonNext => 'Weiter';

  @override
  String get navSummary => 'Übersicht';

  @override
  String get navHealth => 'Gesundheit';

  @override
  String get navSos => 'SOS';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get heroSmokeFreeLabel => 'RAUCHFREI';

  @override
  String get heroDaysUnit => 'Tage';

  @override
  String heroMilestonesProgress(String unlocked, String total) {
    return '$unlocked / $total Gesundheits-Meilensteine';
  }

  @override
  String get statMoneySavedLabel => 'Gespartes Geld';

  @override
  String get statMoneySavedSub => 'wächst täglich';

  @override
  String get statUnitsAvoidedLabel => 'Vermieden';

  @override
  String get statUnitsAvoidedSub => 'Zigaretten';

  @override
  String get statLifeRegainedLabel => 'Zurückgewonnene Lebenszeit';

  @override
  String get statLifeRegainedSub => 'geschätzt · Addiction 2025';

  @override
  String get statRecoveryLabel => 'Erholung';

  @override
  String statRecoverySub(String unlocked, String total) {
    return '$unlocked / $total Meilensteine';
  }

  @override
  String get pendingSourceVerifying => 'Quelle wird geprüft';

  @override
  String get pendingSourceHiddenPanel => 'Bereich ausgeblendet';

  @override
  String get badgesTitle => 'ABZEICHEN';

  @override
  String badgesUnlockedCount(String count, String total) {
    return '$count / $total freigeschaltet';
  }

  @override
  String get badgeDay7 => '7 Tage';

  @override
  String get badgeDay30 => '30 Tage';

  @override
  String get badgeDay90 => '90 Tage';

  @override
  String get badgeYear1 => '1 Jahr';

  @override
  String get checkinTitle => 'WIE GEHT ES DIR HEUTE?';

  @override
  String checkinBody(String days) {
    return 'Du bist an Tag $days — jeder Tag, den du durchstehst, hilft deinem Körper, sich weiter zu erholen.';
  }

  @override
  String get checkinGood => 'Mir geht\'s gut';

  @override
  String get checkinStruggling => 'Es ist schwer';

  @override
  String get checkinSnackGood => 'Schön zu hören. Mach weiter so.';

  @override
  String get checkinAnsweredGood =>
      'Du hast heute \"Mir geht\'s gut\" angegeben — gespeichert.';

  @override
  String get checkinAnsweredStruggling =>
      'Du hast heute \"Es ist schwer\" angegeben — SOS ist gleich hier.';

  @override
  String get milestoneAllUnlocked =>
      'Du hast alle Gesundheits-Meilensteine freigeschaltet.';

  @override
  String get milestoneNextLabel => 'NÄCHSTER MEILENSTEIN';

  @override
  String milestoneOpensIn(String time, String source) {
    return 'Schaltet sich in $time frei · Quelle: $source';
  }

  @override
  String get counterfactualTitle => 'OHNE AUFHÖREN';

  @override
  String counterfactualUnits(String units) {
    return '$units Zigaretten';
  }

  @override
  String counterfactualMoneyOnly(String money) {
    return 'hättest du $money verbrannt.';
  }

  @override
  String counterfactualMoneyAndLife(String money, String life) {
    return 'hättest du $money verbrannt und $life Lebenszeit verloren.';
  }

  @override
  String get trialTitle => 'Alle Funktionen freischalten';

  @override
  String get trialSubtitle =>
      'Unbegrenztes SOS, vollständige Gesundheitsdaten und alle Abzeichen';

  @override
  String get trialCta => '3 Tage\nkostenlos testen';

  @override
  String get paywallTitle => 'Premium';

  @override
  String get paywallComingSoonTitle => 'Premium kommt bald';

  @override
  String get paywallComingSoonBody =>
      'Die Einrichtung für Zahlungen ist noch nicht abgeschlossen. Dieser Bildschirm wechselt automatisch zu den Kaufoptionen, sobald alles bereit ist.';

  @override
  String get paywallLoadError =>
      'Preise konnten nicht geladen werden. Bitte Internetverbindung prüfen.';

  @override
  String get paywallNoPackages => 'Derzeit sind keine Pakete verfügbar.';

  @override
  String get paywallRestore => 'Käufe wiederherstellen';

  @override
  String get paywallRestoreSuccess => 'Deine Käufe wurden wiederhergestellt.';

  @override
  String get paywallRestoreNone =>
      'Kein aktiver Kauf zum Wiederherstellen gefunden.';

  @override
  String get paywallRestoreFailed => 'Wiederherstellung fehlgeschlagen.';

  @override
  String get paywallFeaturesTitle => 'ALLE FUNKTIONEN FREISCHALTEN';

  @override
  String get paywallFeatureSos => 'Unbegrenztes SOS und AI-Coach-Chat';

  @override
  String get paywallFeatureTimeline => 'Vollständige Gesundheits-Zeitleiste';

  @override
  String get paywallFeatureBadges => 'Alle Abzeichen und Meilensteine';

  @override
  String get paywallFeatureAdFree => 'Werbefreie Nutzung';

  @override
  String get paywallThanks => 'Danke! Du bist jetzt Premium.';

  @override
  String get paywallPurchaseFailed => 'Kauf konnte nicht abgeschlossen werden.';

  @override
  String get sosHeader => 'DIESER MOMENT IST SCHWER';

  @override
  String get sosSubtitle =>
      'Ein Verlangen dauert im Schnitt etwa 3 Minuten.\nLass uns das gemeinsam durchstehen.';

  @override
  String get sosBreatheButton => 'ATMEN';

  @override
  String get sosActionBreathing => '4-7-8-Atem-\nübung';

  @override
  String get sosActionCoach => 'Mit AI Coach\nsprechen';

  @override
  String get sosActionCraving => 'Verlangen\nnotieren';

  @override
  String get sosActionDistract => 'Ablenkung\nsuchen';

  @override
  String sosDontWaste(String days) {
    return 'WIRF NICHT $days TAGE WEG';
  }

  @override
  String sosRelapseWarning(String units) {
    return 'Wenn du jetzt rauchst, wird deine Serie nicht zurückgesetzt — es wird als Ausrutscher markiert. Aber du hast dir $units Zigaretten an Mühe verdient.';
  }

  @override
  String get cravingTitle => 'VERLANGEN NOTIEREN';

  @override
  String cravingIntensity(String value) {
    return 'Stärke: $value';
  }

  @override
  String get cravingCueCoffee => 'Kaffee';

  @override
  String get cravingCueStress => 'Stress';

  @override
  String get cravingCueAfterMeal => 'Nach dem Essen';

  @override
  String get cravingCueSocial => 'Sozial';

  @override
  String get cravingCueOther => 'Sonstiges';

  @override
  String get cravingSave => 'Speichern';

  @override
  String get cravingSaved => 'Gespeichert. Auch das geht vorbei.';

  @override
  String get breathingTitle => '4-7-8-Atemübung';

  @override
  String breathingRound(String cycle) {
    return 'Runde $cycle';
  }

  @override
  String get breathingInhaleLabel => 'EINATMEN';

  @override
  String get breathingInhaleHint => 'Langsam durch die Nase einatmen.';

  @override
  String get breathingHoldLabel => 'HALTEN';

  @override
  String get breathingHoldHint => 'Atem anhalten, Schultern entspannen lassen.';

  @override
  String get breathingExhaleLabel => 'AUSATMEN';

  @override
  String get breathingExhaleHint => 'Langsam durch den Mund ausatmen.';

  @override
  String get breathingFinish => 'Fertig';

  @override
  String get distractionTitle => 'Ablenkung suchen';

  @override
  String distractionStep(String index, String total) {
    return '$index / $total';
  }

  @override
  String get distractionInstructions =>
      'Schau dich um und zähle sie der Reihe nach auf. Keine Eile — nimm dir für jedes ein paar Sekunden.';

  @override
  String get distractionFinish => 'Fertig';

  @override
  String get distractionNext => 'Weiter';

  @override
  String distractionStep1(String count) {
    return 'Nenne $count Dinge, die du SEHEN kannst';
  }

  @override
  String distractionStep2(String count) {
    return 'Nenne $count Dinge, die du BERÜHREN kannst';
  }

  @override
  String distractionStep3(String count) {
    return 'Nenne $count Dinge, die du HÖREN kannst';
  }

  @override
  String distractionStep4(String count) {
    return 'Nenne $count Dinge, die du RIECHEN kannst';
  }

  @override
  String distractionStep5(String count) {
    return 'Nenne $count Ding, das du SCHMECKEN kannst';
  }

  @override
  String get aiCoachTitle => 'AI Coach';

  @override
  String get aiCoachComingSoonTitle => 'AI Coach kommt bald';

  @override
  String get aiCoachComingSoonBody =>
      'Die serverseitige Einrichtung für diese Funktion ist noch nicht abgeschlossen. Dieser Bildschirm wechselt automatisch zum Chat, sobald alles bereit ist.';

  @override
  String get aiCoachEmptyState =>
      'Hallo, ich bin dein AI Coach. Erzähl mir, wie du dich fühlst — ich bin für dich da.';

  @override
  String aiCoachCallNow(String number) {
    return 'Jetzt anrufen: $number';
  }

  @override
  String get aiCoachNotAlone => 'Du bist nicht allein.';

  @override
  String get aiCoachSendError =>
      'Nachricht konnte nicht gesendet werden. Verbindung prüfen und erneut versuchen?';

  @override
  String get aiCoachInputHint => 'Schreiben...';

  @override
  String get onboardingWelcome => 'Willkommen bei SmokeFree AI';

  @override
  String get onboardingIntro =>
      'Wir brauchen ein paar Angaben, damit Zähler und Statistiken korrekt berechnet werden. Du kannst sie jederzeit in den Einstellungen ändern.';

  @override
  String get sectionProduct => 'WAS HAST DU GERAUCHT?';

  @override
  String get sectionProductSettings => 'WAS RAUCHST DU?';

  @override
  String get sectionDaily => 'TÄGLICHER KONSUM';

  @override
  String get sectionPrice => 'PACKUNGSPREIS';

  @override
  String get sectionQuitMoment => 'AUFHÖR-ZEITPUNKT';

  @override
  String perDayLabel(String unit) {
    return 'Wie viele $unit pro Tag';
  }

  @override
  String perPackLabel(String unit) {
    return 'Wie viele $unit pro Packung';
  }

  @override
  String get priceLabel => 'Preis';

  @override
  String get onboardingStart => 'Starten';

  @override
  String get errorSelectProduct => 'Bitte wähle aus, was du geraucht hast.';

  @override
  String get errorDailyInvalid =>
      'Der tägliche Konsum muss eine gültige Zahl sein.';

  @override
  String get errorPerPackInvalid =>
      'Die Anzahl pro Packung muss eine gültige Zahl sein.';

  @override
  String get errorPriceInvalid => 'Der Preis muss eine gültige Zahl sein.';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsSubtitle =>
      'Aktualisiere dein Profil, verwalte Benachrichtigungen oder setze deine Daten zurück.';

  @override
  String get settingsSave => 'Speichern';

  @override
  String get settingsSaved => 'Deine Angaben wurden gespeichert.';

  @override
  String get settingsNotificationsTitle => 'BENACHRICHTIGUNGEN';

  @override
  String get settingsNotificationsBody =>
      'Tägliche Erinnerungen und unterstützende Benachrichtigungen';

  @override
  String get settingsDangerTitle => 'GEFAHRENBEREICH';

  @override
  String get settingsDangerBody =>
      'Dein Profil und dein gesamter Verlauf werden dauerhaft gelöscht und die App beginnt von vorn.';

  @override
  String get settingsResetButton => 'Meine Daten zurücksetzen';

  @override
  String get settingsResetDialogTitle => 'Daten zurücksetzen?';

  @override
  String get settingsResetDialogBody =>
      'Dein Profil und dein gesamter Verlauf (Check-ins, Verlangens-Einträge) werden dauerhaft gelöscht. Dies kann NICHT rückgängig gemacht werden.';

  @override
  String get settingsResetCancel => 'Abbrechen';

  @override
  String get settingsResetConfirm => 'Ja, löschen';

  @override
  String get settingsLanguageTitle => 'SPRACHE';

  @override
  String get settingsLanguageSystemDefault => 'Systemsprache';

  @override
  String settingsVersion(String version) {
    return 'SmokeFree AI · v$version';
  }

  @override
  String get productCigarette => 'Zigaretten';

  @override
  String get productRollYourOwn => 'Selbstgedreht';

  @override
  String get productVape => 'E-Zigarette';

  @override
  String get productHookah => 'Wasserpfeife';

  @override
  String get productCigar => 'Zigarre';

  @override
  String get productSnus => 'Snus';

  @override
  String get unitPiece => 'Stück';

  @override
  String get unitVape => 'Züge/ml';

  @override
  String get unitHookah => 'Sitzungen';

  @override
  String get unitSnus => 'Beutel';

  @override
  String get unitGeneric => 'Einheiten';

  @override
  String get dateNow => 'Jetzt';

  @override
  String get dateYesterday => 'Gestern';

  @override
  String get dateWeekAgo => 'Vor 1 Woche';

  @override
  String get dateMonthAgo => 'Vor 1 Monat';

  @override
  String durationDaysHours(String days, String hours) {
    return '$days T $hours Std';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '$hours Std $minutes Min';
  }

  @override
  String durationMinutes(String minutes) {
    return '$minutes Min';
  }

  @override
  String get durationZeroMinutes => '0 Min';

  @override
  String get timelineHeader => 'GESUNDHEITS-ZEITLEISTE';

  @override
  String get timelineSubheader => 'Dein Körper repariert sich selbst';

  @override
  String timelineNowHere(String title) {
    return '$title · du bist jetzt hier';
  }

  @override
  String timelineSource(String source) {
    return 'Quelle: $source';
  }

  @override
  String get milestoneMin20Title => '20 Minuten';

  @override
  String get milestoneMin20Body => 'Herzfrequenz und Blutdruck sinken.';

  @override
  String get milestoneHour8Title => '8 Stunden';

  @override
  String get milestoneHour8Body =>
      'Kohlenmonoxid- und Sauerstoffwerte beginnen, sich zu normalisieren.';

  @override
  String get milestoneHour12Title => '12 Stunden';

  @override
  String get milestoneHour12Body =>
      'Das Kohlenmonoxid im Blut normalisiert sich.';

  @override
  String get milestoneHour24Title => '24 Stunden';

  @override
  String get milestoneHour24Body => 'Nikotin ist aus deinem Blut verschwunden.';

  @override
  String get milestoneHour48Title => '48 Stunden';

  @override
  String get milestoneHour48Body =>
      'Geschmacks- und Geruchssinn verbessern sich.';

  @override
  String get milestoneHour72Title => '72 Stunden';

  @override
  String get milestoneHour72Body => 'Das Energielevel beginnt zu steigen.';

  @override
  String get milestoneWeek2Title => '2–12 Wochen';

  @override
  String get milestoneWeek2Body =>
      'Die Durchblutung verbessert sich, die Lungenfunktion nimmt zu.';

  @override
  String get milestoneMonth1Title => '1–9 Monate';

  @override
  String get milestoneMonth1Body => 'Husten und Kurzatmigkeit nehmen ab.';

  @override
  String get milestoneMonth9Title => '9 Monate';

  @override
  String get milestoneMonth9Body =>
      'Die Flimmerhärchen der Lunge erholen sich, das Infektionsrisiko sinkt.';

  @override
  String get milestoneYear1Title => '1 Jahr';

  @override
  String get milestoneYear1Body =>
      'Das Risiko für koronare Herzkrankheit sinkt auf etwa die Hälfte des Risikos eines Rauchers.';

  @override
  String get milestoneYear5Title => '5 Jahre';

  @override
  String get milestoneYear5Body => 'Das Schlaganfallrisiko sinkt.';

  @override
  String get milestoneYear10Title => '10 Jahre';

  @override
  String get milestoneYear10Body =>
      'Das Lungenkrebsrisiko sinkt auf etwa die Hälfte des Risikos eines Rauchers.';

  @override
  String get milestoneYear15Title => '15 Jahre';

  @override
  String get milestoneYear15Body =>
      'Das Risiko für koronare Herzkrankheit entspricht dem eines Nichtrauchers.';

  @override
  String get milestoneYear20Title => '20 Jahre';

  @override
  String get milestoneYear20Body =>
      'Das Risiko für Mund-, Rachen- und Kehlkopfkrebs nähert sich dem eines Nichtrauchers an.';

  @override
  String statRecoveryValue(String percent) {
    return '$percent %';
  }

  @override
  String get settingsNotificationsComingSoon => 'Erinnerungen bald verfügbar';
}
