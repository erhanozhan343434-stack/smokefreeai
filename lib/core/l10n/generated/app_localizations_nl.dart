// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class L10nNl extends L10n {
  L10nNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'SmokeFree AI';

  @override
  String get dashboardTitle => 'Jouw voortgang';

  @override
  String get counterSmokeFree => 'Rookvrij sinds';

  @override
  String get counterMoneySaved => 'Bespaard geld';

  @override
  String get counterUnitsAvoided => 'Niet gerookte sigaretten';

  @override
  String get sosButton => 'Ik wil roken';

  @override
  String get disclaimerMedical =>
      'Deze app is alleen bedoeld ter informatie en motivatie. Het is geen medisch advies, diagnose of behandeling.';

  @override
  String get commonSave => 'Opslaan';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonFinish => 'Klaar';

  @override
  String get commonNext => 'Volgende';

  @override
  String get navSummary => 'Overzicht';

  @override
  String get navHealth => 'Gezondheid';

  @override
  String get navSos => 'SOS';

  @override
  String get navSettings => 'Instellingen';

  @override
  String get heroSmokeFreeLabel => 'ROOKVRIJ';

  @override
  String get heroDaysUnit => 'dagen';

  @override
  String heroMilestonesProgress(String unlocked, String total) {
    return '$unlocked / $total gezondheidsmijlpalen';
  }

  @override
  String get statMoneySavedLabel => 'Bespaard geld';

  @override
  String get statMoneySavedSub => 'groeit elke dag';

  @override
  String get statUnitsAvoidedLabel => 'Vermeden';

  @override
  String get statUnitsAvoidedSub => 'sigaretten';

  @override
  String get statLifeRegainedLabel => 'Teruggewonnen levenstijd';

  @override
  String get statLifeRegainedSub => 'schatting · Addiction 2025';

  @override
  String get statRecoveryLabel => 'Herstel';

  @override
  String statRecoverySub(String unlocked, String total) {
    return '$unlocked / $total mijlpalen';
  }

  @override
  String get pendingSourceVerifying => 'Bron wordt geverifieerd';

  @override
  String get pendingSourceHiddenPanel => 'paneel verborgen';

  @override
  String get badgesTitle => 'BADGES';

  @override
  String badgesUnlockedCount(String count, String total) {
    return '$count / $total vrijgespeeld';
  }

  @override
  String get badgeDay7 => '7 Dagen';

  @override
  String get badgeDay30 => '30 Dagen';

  @override
  String get badgeDay90 => '90 Dagen';

  @override
  String get badgeYear1 => '1 Jaar';

  @override
  String get checkinTitle => 'HOE GAAT HET VANDAAG?';

  @override
  String checkinBody(String days) {
    return 'Je bent op dag $days — elke dag die je volhoudt helpt je lichaam om verder te herstellen.';
  }

  @override
  String get checkinGood => 'Het gaat goed';

  @override
  String get checkinStruggling => 'Het is zwaar';

  @override
  String get checkinSnackGood => 'Fijn om te horen. Ga zo door.';

  @override
  String get checkinAnsweredGood =>
      'Je gaf vandaag \"Het gaat goed\" aan — opgeslagen.';

  @override
  String get checkinAnsweredStruggling =>
      'Je gaf vandaag \"Het is zwaar\" aan — SOS staat klaar.';

  @override
  String get milestoneAllUnlocked =>
      'Je hebt alle gezondheidsmijlpalen vrijgespeeld.';

  @override
  String get milestoneNextLabel => 'VOLGENDE MIJLPAAL';

  @override
  String milestoneOpensIn(String time, String source) {
    return 'Opent over $time · Bron: $source';
  }

  @override
  String get counterfactualTitle => 'ALS JE NIET WAS GESTOPT';

  @override
  String counterfactualUnits(String units) {
    return '$units sigaretten';
  }

  @override
  String counterfactualMoneyOnly(String money) {
    return 'had je $money verbrand.';
  }

  @override
  String counterfactualMoneyAndLife(String money, String life) {
    return 'had je $money verbrand en $life levenstijd verloren.';
  }

  @override
  String get trialTitle => 'Alles vrijspelen';

  @override
  String get trialSubtitle =>
      'Onbeperkt SOS, volledige gezondheidsgegevens en alle badges';

  @override
  String get trialCta => '3 dagen\ngratis proberen';

  @override
  String get paywallTitle => 'Premium';

  @override
  String get paywallComingSoonTitle => 'Premium komt binnenkort';

  @override
  String get paywallComingSoonBody =>
      'De installatie voor betalingen is nog niet voltooid. Dit scherm schakelt automatisch over naar aankoopopties zodra alles klaar is.';

  @override
  String get paywallLoadError =>
      'Prijzen konden niet worden geladen. Controleer je internetverbinding.';

  @override
  String get paywallNoPackages =>
      'Er zijn momenteel geen pakketten beschikbaar.';

  @override
  String get paywallRestore => 'Aankopen herstellen';

  @override
  String get paywallRestoreSuccess => 'Je aankopen zijn hersteld.';

  @override
  String get paywallRestoreNone =>
      'Geen actieve aankoop gevonden om te herstellen.';

  @override
  String get paywallRestoreFailed => 'Herstellen is mislukt.';

  @override
  String get paywallFeaturesTitle => 'ALLES VRIJSPELEN';

  @override
  String get paywallFeatureSos => 'Onbeperkt SOS en AI Coach-chat';

  @override
  String get paywallFeatureTimeline =>
      'Volledige tijdlijn voor gezondheidsherstel';

  @override
  String get paywallFeatureBadges => 'Alle badges en mijlpalen';

  @override
  String get paywallFeatureAdFree => 'Advertentievrije ervaring';

  @override
  String get paywallThanks => 'Bedankt! Je hebt nu premium.';

  @override
  String get paywallPurchaseFailed => 'Aankoop kon niet worden voltooid.';

  @override
  String get sosHeader => 'DIT MOMENT IS ZWAAR';

  @override
  String get sosSubtitle =>
      'Een hunkering duurt gemiddeld ongeveer 3 minuten.\nLaten we het samen doorstaan.';

  @override
  String get sosBreatheButton => 'ADEM';

  @override
  String get sosActionBreathing => '4-7-8-adem-\nhalingsoefening';

  @override
  String get sosActionCoach => 'Praat met\nAI Coach';

  @override
  String get sosActionCraving => 'Trek\nnoteren';

  @override
  String get sosActionDistract => 'Jezelf\nafleiden';

  @override
  String sosDontWaste(String days) {
    return 'GOOI $days DAGEN NIET WEG';
  }

  @override
  String sosRelapseWarning(String units) {
    return 'Als je nu rookt, wordt je reeks niet gereset — het wordt gemarkeerd als uitglijder. Maar je hebt al $units sigaretten aan inspanning verdiend.';
  }

  @override
  String get cravingTitle => 'TREK NOTEREN';

  @override
  String cravingIntensity(String value) {
    return 'Intensiteit: $value';
  }

  @override
  String get cravingCueCoffee => 'Koffie';

  @override
  String get cravingCueStress => 'Stress';

  @override
  String get cravingCueAfterMeal => 'Na een maaltijd';

  @override
  String get cravingCueSocial => 'Sociaal';

  @override
  String get cravingCueOther => 'Anders';

  @override
  String get cravingSave => 'Opslaan';

  @override
  String get cravingSaved => 'Opgeslagen. Ook dit gaat voorbij.';

  @override
  String get breathingTitle => '4-7-8-Ademhalingsoefening';

  @override
  String breathingRound(String cycle) {
    return 'Ronde $cycle';
  }

  @override
  String get breathingInhaleLabel => 'ADEM IN';

  @override
  String get breathingInhaleHint => 'Adem langzaam in door je neus.';

  @override
  String get breathingHoldLabel => 'HOUD VAST';

  @override
  String get breathingHoldHint =>
      'Houd je adem vast, laat je schouders ontspannen.';

  @override
  String get breathingExhaleLabel => 'ADEM UIT';

  @override
  String get breathingExhaleHint => 'Adem langzaam uit door je mond.';

  @override
  String get breathingFinish => 'Klaar';

  @override
  String get distractionTitle => 'Jezelf afleiden';

  @override
  String distractionStep(String index, String total) {
    return '$index / $total';
  }

  @override
  String get distractionInstructions =>
      'Kijk om je heen en tel ze op. Geen haast — neem voor elk een paar seconden de tijd.';

  @override
  String get distractionFinish => 'Klaar';

  @override
  String get distractionNext => 'Volgende';

  @override
  String distractionStep1(String count) {
    return 'Noem $count dingen die je kunt ZIEN';
  }

  @override
  String distractionStep2(String count) {
    return 'Noem $count dingen die je kunt AANRAKEN';
  }

  @override
  String distractionStep3(String count) {
    return 'Noem $count dingen die je kunt HOREN';
  }

  @override
  String distractionStep4(String count) {
    return 'Noem $count dingen die je kunt RUIKEN';
  }

  @override
  String distractionStep5(String count) {
    return 'Noem $count ding dat je kunt PROEVEN';
  }

  @override
  String get aiCoachTitle => 'AI Coach';

  @override
  String get aiCoachComingSoonTitle => 'AI Coach komt binnenkort';

  @override
  String get aiCoachComingSoonBody =>
      'De server-installatie voor deze functie is nog niet voltooid. Dit scherm schakelt automatisch over naar chat zodra alles klaar is.';

  @override
  String get aiCoachEmptyState =>
      'Hoi, ik ben je AI Coach. Vertel me hoe je je voelt — ik ben er voor je.';

  @override
  String aiCoachCallNow(String number) {
    return 'Bel nu: $number';
  }

  @override
  String get aiCoachNotAlone => 'Je bent niet alleen.';

  @override
  String get aiCoachSendError =>
      'Bericht kon niet worden verzonden. Controleer je verbinding en probeer opnieuw?';

  @override
  String get aiCoachInputHint => 'Typen...';

  @override
  String get onboardingWelcome => 'Welkom bij SmokeFree AI';

  @override
  String get onboardingIntro =>
      'We hebben een paar gegevens nodig om je teller en statistieken correct te berekenen. Je kunt dit altijd wijzigen in Instellingen.';

  @override
  String get sectionProduct => 'WAT GEBRUIKTE JE?';

  @override
  String get sectionProductSettings => 'WAT GEBRUIK JE?';

  @override
  String get sectionDaily => 'DAGELIJKS GEBRUIK';

  @override
  String get sectionPrice => 'PAKJESPRIJS';

  @override
  String get sectionQuitMoment => 'STOPMOMENT';

  @override
  String perDayLabel(String unit) {
    return 'Hoeveel $unit per dag';
  }

  @override
  String perPackLabel(String unit) {
    return 'Hoeveel $unit per pakje';
  }

  @override
  String get priceLabel => 'Prijs';

  @override
  String get onboardingStart => 'Beginnen';

  @override
  String get errorSelectProduct => 'Kies wat je gebruikte.';

  @override
  String get errorDailyInvalid =>
      'Dagelijks gebruik moet een geldig getal zijn.';

  @override
  String get errorPerPackInvalid =>
      'Aantal per pakje moet een geldig getal zijn.';

  @override
  String get errorPriceInvalid => 'Prijs moet een geldig getal zijn.';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get settingsSubtitle =>
      'Werk je profiel bij, beheer meldingen of reset je gegevens.';

  @override
  String get settingsSave => 'Opslaan';

  @override
  String get settingsSaved => 'Je gegevens zijn opgeslagen.';

  @override
  String get settingsNotificationsTitle => 'MELDINGEN';

  @override
  String get settingsNotificationsBody =>
      'Dagelijkse herinneringen en ondersteunende meldingen';

  @override
  String get settingsDangerTitle => 'GEVARENZONE';

  @override
  String get settingsDangerBody =>
      'Je profiel en volledige geschiedenis worden permanent verwijderd en de app begint opnieuw.';

  @override
  String get settingsResetButton => 'Mijn gegevens resetten';

  @override
  String get settingsResetDialogTitle => 'Gegevens resetten?';

  @override
  String get settingsResetDialogBody =>
      'Je profiel en volledige geschiedenis (check-ins, trek-registraties) worden permanent verwijderd. Dit kan NIET ongedaan worden gemaakt.';

  @override
  String get settingsResetCancel => 'Annuleren';

  @override
  String get settingsResetConfirm => 'Ja, verwijderen';

  @override
  String get settingsLanguageTitle => 'TAAL';

  @override
  String get settingsLanguageSystemDefault => 'Systeemtaal';

  @override
  String settingsVersion(String version) {
    return 'SmokeFree AI · v$version';
  }

  @override
  String get productCigarette => 'Sigaretten';

  @override
  String get productRollYourOwn => 'Shag';

  @override
  String get productVape => 'E-sigaret';

  @override
  String get productHookah => 'Waterpijp';

  @override
  String get productCigar => 'Sigaar';

  @override
  String get productSnus => 'Snus';

  @override
  String get unitPiece => 'stuks';

  @override
  String get unitVape => 'trekjes/ml';

  @override
  String get unitHookah => 'sessies';

  @override
  String get unitSnus => 'zakjes';

  @override
  String get unitGeneric => 'eenheden';

  @override
  String get dateNow => 'Nu';

  @override
  String get dateYesterday => 'Gisteren';

  @override
  String get dateWeekAgo => '1 week geleden';

  @override
  String get dateMonthAgo => '1 maand geleden';

  @override
  String durationDaysHours(String days, String hours) {
    return '${days}d ${hours}u';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '${hours}u ${minutes}m';
  }

  @override
  String durationMinutes(String minutes) {
    return '${minutes}m';
  }

  @override
  String get durationZeroMinutes => '0m';

  @override
  String get timelineHeader => 'TIJDLIJN GEZONDHEIDSHERSTEL';

  @override
  String get timelineSubheader => 'Je lichaam herstelt zichzelf';

  @override
  String timelineNowHere(String title) {
    return '$title · je bent hier nu';
  }

  @override
  String timelineSource(String source) {
    return 'Bron: $source';
  }

  @override
  String get milestoneMin20Title => '20 minuten';

  @override
  String get milestoneMin20Body => 'Hartslag en bloeddruk dalen.';

  @override
  String get milestoneHour8Title => '8 uur';

  @override
  String get milestoneHour8Body =>
      'Koolmonoxide- en zuurstofniveaus beginnen te normaliseren.';

  @override
  String get milestoneHour12Title => '12 uur';

  @override
  String get milestoneHour12Body => 'Koolmonoxide in het bloed normaliseert.';

  @override
  String get milestoneHour24Title => '24 uur';

  @override
  String get milestoneHour24Body => 'Nicotine is uit je bloed verdwenen.';

  @override
  String get milestoneHour48Title => '48 uur';

  @override
  String get milestoneHour48Body => 'Smaak en reuk verbeteren.';

  @override
  String get milestoneHour72Title => '72 uur';

  @override
  String get milestoneHour72Body => 'Energieniveau begint te stijgen.';

  @override
  String get milestoneWeek2Title => '2–12 weken';

  @override
  String get milestoneWeek2Body =>
      'Bloedsomloop verbetert, longcapaciteit neemt toe.';

  @override
  String get milestoneMonth1Title => '1–9 maanden';

  @override
  String get milestoneMonth1Body => 'Hoesten en kortademigheid nemen af.';

  @override
  String get milestoneMonth9Title => '9 maanden';

  @override
  String get milestoneMonth9Body =>
      'Trilhaartjes in de longen herstellen, infectierisico daalt.';

  @override
  String get milestoneYear1Title => '1 jaar';

  @override
  String get milestoneYear1Body =>
      'Risico op coronaire hartziekte daalt tot ongeveer de helft van dat van een roker.';

  @override
  String get milestoneYear5Title => '5 jaar';

  @override
  String get milestoneYear5Body => 'Risico op beroerte daalt.';

  @override
  String get milestoneYear10Title => '10 jaar';

  @override
  String get milestoneYear10Body =>
      'Risico op longkanker daalt tot ongeveer de helft van dat van een roker.';

  @override
  String get milestoneYear15Title => '15 jaar';

  @override
  String get milestoneYear15Body =>
      'Risico op coronaire hartziekte is gelijk aan dat van een niet-roker.';

  @override
  String get milestoneYear20Title => '20 jaar';

  @override
  String get milestoneYear20Body =>
      'Risico op mond-, keel- en strottenhoofdkanker benadert dat van een niet-roker.';

  @override
  String statRecoveryValue(String percent) {
    return '$percent%';
  }

  @override
  String get settingsNotificationsComingSoon =>
      'Herinneringen binnenkort beschikbaar';
}
