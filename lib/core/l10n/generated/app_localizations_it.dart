// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class L10nIt extends L10n {
  L10nIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'SmokeFree AI';

  @override
  String get dashboardTitle => 'I tuoi progressi';

  @override
  String get counterSmokeFree => 'Senza fumo da';

  @override
  String get counterMoneySaved => 'Soldi risparmiati';

  @override
  String get counterUnitsAvoided => 'Sigarette non fumate';

  @override
  String get sosButton => 'Voglio fumare';

  @override
  String get disclaimerMedical =>
      'Questa app è solo a scopo informativo e motivazionale. Non sostituisce un parere medico, una diagnosi o un trattamento.';

  @override
  String get commonSave => 'Salva';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonFinish => 'Fine';

  @override
  String get commonNext => 'Avanti';

  @override
  String get navSummary => 'Riepilogo';

  @override
  String get navHealth => 'Salute';

  @override
  String get navSos => 'SOS';

  @override
  String get navSettings => 'Impostazioni';

  @override
  String get heroSmokeFreeLabel => 'SENZA FUMO';

  @override
  String get heroDaysUnit => 'giorni';

  @override
  String heroMilestonesProgress(String unlocked, String total) {
    return '$unlocked / $total traguardi di salute';
  }

  @override
  String get statMoneySavedLabel => 'Soldi risparmiati';

  @override
  String get statMoneySavedSub => 'cresce ogni giorno';

  @override
  String get statUnitsAvoidedLabel => 'Evitate';

  @override
  String get statUnitsAvoidedSub => 'sigarette';

  @override
  String get statLifeRegainedLabel => 'Vita riguadagnata';

  @override
  String get statLifeRegainedSub => 'stima · Addiction 2025';

  @override
  String get statRecoveryLabel => 'Recupero';

  @override
  String statRecoverySub(String unlocked, String total) {
    return '$unlocked / $total traguardi';
  }

  @override
  String get pendingSourceVerifying => 'Fonte in fase di verifica';

  @override
  String get pendingSourceHiddenPanel => 'pannello nascosto';

  @override
  String get badgesTitle => 'DISTINTIVI';

  @override
  String badgesUnlockedCount(String count, String total) {
    return '$count / $total sbloccati';
  }

  @override
  String get badgeDay7 => '7 Giorni';

  @override
  String get badgeDay30 => '30 Giorni';

  @override
  String get badgeDay90 => '90 Giorni';

  @override
  String get badgeYear1 => '1 Anno';

  @override
  String get checkinTitle => 'COME STAI OGGI?';

  @override
  String checkinBody(String days) {
    return 'Sei al giorno $days — ogni giorno che superi aiuta il tuo corpo a guarire un po\' di più.';
  }

  @override
  String get checkinGood => 'Sto bene';

  @override
  String get checkinStruggling => 'È dura';

  @override
  String get checkinSnackGood => 'Bello sentirlo. Continua così.';

  @override
  String get checkinAnsweredGood => 'Oggi hai detto \"Sto bene\" — salvato.';

  @override
  String get checkinAnsweredStruggling =>
      'Oggi hai detto \"È dura\" — l\'SOS è proprio qui.';

  @override
  String get milestoneAllUnlocked =>
      'Hai sbloccato tutti i traguardi di salute.';

  @override
  String get milestoneNextLabel => 'PROSSIMO TRAGUARDO';

  @override
  String milestoneOpensIn(String time, String source) {
    return 'Si sblocca tra $time · Fonte: $source';
  }

  @override
  String get counterfactualTitle => 'SE NON AVESSI SMESSO';

  @override
  String counterfactualUnits(String units) {
    return '$units sigarette';
  }

  @override
  String counterfactualMoneyOnly(String money) {
    return 'avresti bruciato $money.';
  }

  @override
  String counterfactualMoneyAndLife(String money, String life) {
    return 'avresti bruciato $money e perso $life di vita.';
  }

  @override
  String get trialTitle => 'Sblocca tutto';

  @override
  String get trialSubtitle =>
      'SOS illimitato, dati sulla salute completi e tutti i distintivi';

  @override
  String get trialCta => 'Prova gratis\nper 3 giorni';

  @override
  String get paywallTitle => 'Premium';

  @override
  String get paywallComingSoonTitle => 'Premium arriva presto';

  @override
  String get paywallComingSoonBody =>
      'La configurazione dei pagamenti lato store non è ancora completata. Questa schermata passerà automaticamente alle opzioni di acquisto non appena sarà pronta.';

  @override
  String get paywallLoadError =>
      'Impossibile caricare i prezzi. Controlla la connessione internet.';

  @override
  String get paywallNoPackages =>
      'Al momento non ci sono pacchetti disponibili.';

  @override
  String get paywallRestore => 'Ripristina acquisti';

  @override
  String get paywallRestoreSuccess =>
      'I tuoi acquisti sono stati ripristinati.';

  @override
  String get paywallRestoreNone =>
      'Nessun acquisto attivo trovato da ripristinare.';

  @override
  String get paywallRestoreFailed => 'Ripristino non riuscito.';

  @override
  String get paywallFeaturesTitle => 'SBLOCCA TUTTO';

  @override
  String get paywallFeatureSos => 'SOS illimitato e chat con l\'AI Coach';

  @override
  String get paywallFeatureTimeline =>
      'Cronologia completa del recupero della salute';

  @override
  String get paywallFeatureBadges => 'Tutti i distintivi e i traguardi';

  @override
  String get paywallFeatureAdFree => 'Esperienza senza pubblicità';

  @override
  String get paywallThanks => 'Grazie! Ora sei premium.';

  @override
  String get paywallPurchaseFailed => 'Impossibile completare l\'acquisto.';

  @override
  String get sosHeader => 'QUESTO MOMENTO È DIFFICILE';

  @override
  String get sosSubtitle =>
      'Una voglia dura in media circa 3 minuti.\nAffrontiamola insieme.';

  @override
  String get sosBreatheButton => 'RESPIRA';

  @override
  String get sosActionBreathing => 'Esercizio di\nrespirazione 4-7-8';

  @override
  String get sosActionCoach => 'Parla con\nl\'AI Coach';

  @override
  String get sosActionCraving => 'Registra\nuna voglia';

  @override
  String get sosActionDistract => 'Distrai\nla mente';

  @override
  String sosDontWaste(String days) {
    return 'NON BUTTARE VIA $days GIORNI';
  }

  @override
  String sosRelapseWarning(String units) {
    return 'Se fumi ora, la tua serie non si azzera — verrà segnata come uno scivolone. Ma hai già guadagnato $units sigarette di impegno.';
  }

  @override
  String get cravingTitle => 'REGISTRA UNA VOGLIA';

  @override
  String cravingIntensity(String value) {
    return 'Intensità: $value';
  }

  @override
  String get cravingCueCoffee => 'Caffè';

  @override
  String get cravingCueStress => 'Stress';

  @override
  String get cravingCueAfterMeal => 'Dopo un pasto';

  @override
  String get cravingCueSocial => 'Sociale';

  @override
  String get cravingCueOther => 'Altro';

  @override
  String get cravingSave => 'Salva';

  @override
  String get cravingSaved => 'Salvato. Anche questo passerà.';

  @override
  String get breathingTitle => 'Esercizio di respirazione 4-7-8';

  @override
  String breathingRound(String cycle) {
    return 'Round $cycle';
  }

  @override
  String get breathingInhaleLabel => 'INSPIRA';

  @override
  String get breathingInhaleHint => 'Inspira lentamente dal naso.';

  @override
  String get breathingHoldLabel => 'TRATTIENI';

  @override
  String get breathingHoldHint => 'Trattieni il respiro, rilassa le spalle.';

  @override
  String get breathingExhaleLabel => 'ESPIRA';

  @override
  String get breathingExhaleHint => 'Espira lentamente dalla bocca.';

  @override
  String get breathingFinish => 'Fine';

  @override
  String get distractionTitle => 'Distrai la mente';

  @override
  String distractionStep(String index, String total) {
    return '$index / $total';
  }

  @override
  String get distractionInstructions =>
      'Guardati intorno e contali uno per uno. Nessuna fretta — prenditi qualche secondo per ciascuno.';

  @override
  String get distractionFinish => 'Fine';

  @override
  String get distractionNext => 'Avanti';

  @override
  String distractionStep1(String count) {
    return 'Nomina $count cose che puoi VEDERE';
  }

  @override
  String distractionStep2(String count) {
    return 'Nomina $count cose che puoi TOCCARE';
  }

  @override
  String distractionStep3(String count) {
    return 'Nomina $count cose che puoi SENTIRE';
  }

  @override
  String distractionStep4(String count) {
    return 'Nomina $count cose che puoi ANNUSARE';
  }

  @override
  String distractionStep5(String count) {
    return 'Nomina $count cosa che puoi ASSAGGIARE';
  }

  @override
  String get aiCoachTitle => 'AI Coach';

  @override
  String get aiCoachComingSoonTitle => 'L\'AI Coach arriva presto';

  @override
  String get aiCoachComingSoonBody =>
      'La configurazione lato server per questa funzione non è ancora completata. Questa schermata passerà automaticamente alla chat non appena sarà pronta.';

  @override
  String get aiCoachEmptyState =>
      'Ciao, sono il tuo AI Coach. Dimmi come ti senti — sono qui con te.';

  @override
  String aiCoachCallNow(String number) {
    return 'Chiama ora: $number';
  }

  @override
  String get aiCoachNotAlone => 'Non sei solo/a.';

  @override
  String get aiCoachSendError =>
      'Impossibile inviare il messaggio. Controlla la connessione e riprova?';

  @override
  String get aiCoachInputHint => 'Scrivi...';

  @override
  String get onboardingWelcome => 'Benvenuto/a su SmokeFree AI';

  @override
  String get onboardingIntro =>
      'Ci servono alcune informazioni per calcolare correttamente il contatore e le statistiche. Potrai modificarle in qualsiasi momento dalle Impostazioni.';

  @override
  String get sectionProduct => 'COSA CONSUMAVI?';

  @override
  String get sectionProductSettings => 'COSA CONSUMI?';

  @override
  String get sectionDaily => 'CONSUMO GIORNALIERO';

  @override
  String get sectionPrice => 'PREZZO DEL PACCHETTO';

  @override
  String get sectionQuitMoment => 'MOMENTO DELLO STOP';

  @override
  String perDayLabel(String unit) {
    return 'Quanti $unit al giorno';
  }

  @override
  String perPackLabel(String unit) {
    return 'Quanti $unit per pacchetto';
  }

  @override
  String get priceLabel => 'Prezzo';

  @override
  String get onboardingStart => 'Inizia';

  @override
  String get errorSelectProduct => 'Seleziona cosa consumavi.';

  @override
  String get errorDailyInvalid =>
      'Il consumo giornaliero deve essere un numero valido.';

  @override
  String get errorPerPackInvalid =>
      'Le unità per pacchetto devono essere un numero valido.';

  @override
  String get errorPriceInvalid => 'Il prezzo deve essere un numero valido.';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsSubtitle =>
      'Aggiorna il tuo profilo, gestisci le notifiche o reimposta i tuoi dati.';

  @override
  String get settingsSave => 'Salva';

  @override
  String get settingsSaved => 'Le tue informazioni sono state salvate.';

  @override
  String get settingsNotificationsTitle => 'NOTIFICHE';

  @override
  String get settingsNotificationsBody =>
      'Promemoria giornalieri e notifiche di supporto';

  @override
  String get settingsDangerTitle => 'ZONA PERICOLOSA';

  @override
  String get settingsDangerBody =>
      'Il tuo profilo e l\'intera cronologia verranno eliminati definitivamente e l\'app ripartirà da zero.';

  @override
  String get settingsResetButton => 'Reimposta i miei dati';

  @override
  String get settingsResetDialogTitle => 'Reimpostare i tuoi dati?';

  @override
  String get settingsResetDialogBody =>
      'Il tuo profilo e l\'intera cronologia (check-in, voglie registrate) verranno eliminati definitivamente. Questa azione NON può essere annullata.';

  @override
  String get settingsResetCancel => 'Annulla';

  @override
  String get settingsResetConfirm => 'Sì, elimina';

  @override
  String get settingsLanguageTitle => 'LINGUA';

  @override
  String get settingsLanguageSystemDefault => 'Lingua di sistema';

  @override
  String settingsVersion(String version) {
    return 'SmokeFree AI · v$version';
  }

  @override
  String get productCigarette => 'Sigarette';

  @override
  String get productRollYourOwn => 'Tabacco da arrotolare';

  @override
  String get productVape => 'Sigaretta elettronica';

  @override
  String get productHookah => 'Narghilè';

  @override
  String get productCigar => 'Sigaro';

  @override
  String get productSnus => 'Snus';

  @override
  String get unitPiece => 'pezzi';

  @override
  String get unitVape => 'tiri/ml';

  @override
  String get unitHookah => 'sessioni';

  @override
  String get unitSnus => 'bustine';

  @override
  String get unitGeneric => 'unità';

  @override
  String get dateNow => 'Adesso';

  @override
  String get dateYesterday => 'Ieri';

  @override
  String get dateWeekAgo => '1 settimana fa';

  @override
  String get dateMonthAgo => '1 mese fa';

  @override
  String durationDaysHours(String days, String hours) {
    return '${days}g ${hours}h';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '${hours}h ${minutes}min';
  }

  @override
  String durationMinutes(String minutes) {
    return '${minutes}min';
  }

  @override
  String get durationZeroMinutes => '0min';

  @override
  String get timelineHeader => 'CRONOLOGIA DEL RECUPERO DELLA SALUTE';

  @override
  String get timelineSubheader => 'Il tuo corpo si sta riparando';

  @override
  String timelineNowHere(String title) {
    return '$title · sei qui adesso';
  }

  @override
  String timelineSource(String source) {
    return 'Fonte: $source';
  }

  @override
  String get milestoneMin20Title => '20 minuti';

  @override
  String get milestoneMin20Body =>
      'Frequenza cardiaca e pressione sanguigna diminuiscono.';

  @override
  String get milestoneHour8Title => '8 ore';

  @override
  String get milestoneHour8Body =>
      'I livelli di monossido di carbonio e ossigeno iniziano a normalizzarsi.';

  @override
  String get milestoneHour12Title => '12 ore';

  @override
  String get milestoneHour12Body =>
      'Il monossido di carbonio nel sangue torna alla normalità.';

  @override
  String get milestoneHour24Title => '24 ore';

  @override
  String get milestoneHour24Body => 'La nicotina viene eliminata dal sangue.';

  @override
  String get milestoneHour48Title => '48 ore';

  @override
  String get milestoneHour48Body => 'Gusto e olfatto iniziano a migliorare.';

  @override
  String get milestoneHour72Title => '72 ore';

  @override
  String get milestoneHour72Body =>
      'I livelli di energia iniziano ad aumentare.';

  @override
  String get milestoneWeek2Title => '2–12 settimane';

  @override
  String get milestoneWeek2Body =>
      'La circolazione migliora, la capacità polmonare aumenta.';

  @override
  String get milestoneMonth1Title => '1–9 mesi';

  @override
  String get milestoneMonth1Body => 'Tosse e affanno diminuiscono.';

  @override
  String get milestoneMonth9Title => '9 mesi';

  @override
  String get milestoneMonth9Body =>
      'Le ciglia polmonari si riprendono, il rischio di infezioni diminuisce.';

  @override
  String get milestoneYear1Title => '1 anno';

  @override
  String get milestoneYear1Body =>
      'Il rischio di malattia coronarica scende a circa la metà di quello di un fumatore.';

  @override
  String get milestoneYear5Title => '5 anni';

  @override
  String get milestoneYear5Body => 'Il rischio di ictus diminuisce.';

  @override
  String get milestoneYear10Title => '10 anni';

  @override
  String get milestoneYear10Body =>
      'Il rischio di cancro ai polmoni scende a circa la metà di quello di un fumatore.';

  @override
  String get milestoneYear15Title => '15 anni';

  @override
  String get milestoneYear15Body =>
      'Il rischio di malattia coronarica eguaglia quello di un non fumatore.';

  @override
  String get milestoneYear20Title => '20 anni';

  @override
  String get milestoneYear20Body =>
      'Il rischio di cancro alla bocca, alla gola e alla laringe si avvicina a quello di un non fumatore.';

  @override
  String statRecoveryValue(String percent) {
    return '$percent%';
  }

  @override
  String get settingsNotificationsComingSoon => 'Promemoria in arrivo';
}
