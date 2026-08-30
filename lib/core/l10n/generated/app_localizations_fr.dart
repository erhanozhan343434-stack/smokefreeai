// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class L10nFr extends L10n {
  L10nFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'SmokeFree AI';

  @override
  String get dashboardTitle => 'Ta progression';

  @override
  String get counterSmokeFree => 'Sans tabac depuis';

  @override
  String get counterMoneySaved => 'Argent économisé';

  @override
  String get counterUnitsAvoided => 'Cigarettes non fumées';

  @override
  String get sosButton => 'J\'ai envie de fumer';

  @override
  String get disclaimerMedical =>
      'Cette application est fournie à titre informatif et de motivation uniquement. Elle ne remplace pas un avis médical, un diagnostic ou un traitement.';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonFinish => 'Terminer';

  @override
  String get commonNext => 'Suivant';

  @override
  String get navSummary => 'Résumé';

  @override
  String get navHealth => 'Santé';

  @override
  String get navSos => 'SOS';

  @override
  String get navSettings => 'Réglages';

  @override
  String get heroSmokeFreeLabel => 'SANS TABAC';

  @override
  String get heroDaysUnit => 'jours';

  @override
  String heroMilestonesProgress(String unlocked, String total) {
    return '$unlocked / $total étapes santé';
  }

  @override
  String get statMoneySavedLabel => 'Argent économisé';

  @override
  String get statMoneySavedSub => 'augmente chaque jour';

  @override
  String get statUnitsAvoidedLabel => 'Évitées';

  @override
  String get statUnitsAvoidedSub => 'cigarettes';

  @override
  String get statLifeRegainedLabel => 'Vie regagnée';

  @override
  String get statLifeRegainedSub => 'estimation · Addiction 2025';

  @override
  String get statRecoveryLabel => 'Récupération';

  @override
  String statRecoverySub(String unlocked, String total) {
    return '$unlocked / $total étapes';
  }

  @override
  String get pendingSourceVerifying => 'Source en cours de vérification';

  @override
  String get pendingSourceHiddenPanel => 'panneau masqué';

  @override
  String get badgesTitle => 'BADGES';

  @override
  String badgesUnlockedCount(String count, String total) {
    return '$count / $total débloqués';
  }

  @override
  String get badgeDay7 => '7 Jours';

  @override
  String get badgeDay30 => '30 Jours';

  @override
  String get badgeDay90 => '90 Jours';

  @override
  String get badgeYear1 => '1 An';

  @override
  String get checkinTitle => 'COMMENT TE SENS-TU AUJOURD\'HUI ?';

  @override
  String checkinBody(String days) {
    return 'Tu es au jour $days — chaque jour que tu traverses aide ton corps à se réparer un peu plus.';
  }

  @override
  String get checkinGood => 'Ça va bien';

  @override
  String get checkinStruggling => 'C\'est difficile';

  @override
  String get checkinSnackGood => 'Content de l\'entendre. Continue comme ça.';

  @override
  String get checkinAnsweredGood =>
      'Tu as dit \"Ça va bien\" aujourd\'hui — enregistré.';

  @override
  String get checkinAnsweredStruggling =>
      'Tu as dit \"C\'est difficile\" aujourd\'hui — le SOS est juste là.';

  @override
  String get milestoneAllUnlocked => 'Tu as débloqué toutes les étapes santé.';

  @override
  String get milestoneNextLabel => 'PROCHAINE ÉTAPE';

  @override
  String milestoneOpensIn(String time, String source) {
    return 'Se débloque dans $time · Source : $source';
  }

  @override
  String get counterfactualTitle => 'SI TU N\'AVAIS PAS ARRÊTÉ';

  @override
  String counterfactualUnits(String units) {
    return '$units cigarettes';
  }

  @override
  String counterfactualMoneyOnly(String money) {
    return 'tu aurais brûlé $money.';
  }

  @override
  String counterfactualMoneyAndLife(String money, String life) {
    return 'tu aurais brûlé $money et perdu $life de vie.';
  }

  @override
  String get trialTitle => 'Débloquer tout';

  @override
  String get trialSubtitle =>
      'SOS illimité, données santé complètes et tous les badges';

  @override
  String get trialCta => 'Essai gratuit\nde 3 jours';

  @override
  String get paywallTitle => 'Premium';

  @override
  String get paywallComingSoonTitle => 'Premium arrive bientôt';

  @override
  String get paywallComingSoonBody =>
      'La configuration des paiements côté boutique n\'est pas encore terminée. Cet écran basculera automatiquement vers les options d\'achat une fois prêt.';

  @override
  String get paywallLoadError =>
      'Impossible de charger les prix. Vérifie ta connexion internet.';

  @override
  String get paywallNoPackages => 'Aucun forfait disponible pour le moment.';

  @override
  String get paywallRestore => 'Restaurer les achats';

  @override
  String get paywallRestoreSuccess => 'Tes achats ont été restaurés.';

  @override
  String get paywallRestoreNone => 'Aucun achat actif trouvé à restaurer.';

  @override
  String get paywallRestoreFailed => 'Échec de la restauration.';

  @override
  String get paywallFeaturesTitle => 'DÉBLOQUER TOUT';

  @override
  String get paywallFeatureSos => 'SOS illimité et chat avec l\'AI Coach';

  @override
  String get paywallFeatureTimeline =>
      'Chronologie complète de récupération santé';

  @override
  String get paywallFeatureBadges => 'Tous les badges et étapes';

  @override
  String get paywallFeatureAdFree => 'Expérience sans publicité';

  @override
  String get paywallThanks => 'Merci ! Tu es maintenant premium.';

  @override
  String get paywallPurchaseFailed => 'L\'achat n\'a pas pu être finalisé.';

  @override
  String get sosHeader => 'CE MOMENT EST DIFFICILE';

  @override
  String get sosSubtitle =>
      'Une envie dure environ 3 minutes en moyenne.\nTraversons-la ensemble.';

  @override
  String get sosBreatheButton => 'RESPIRE';

  @override
  String get sosActionBreathing => 'Exercice de\nrespiration 4-7-8';

  @override
  String get sosActionCoach => 'Parler à\nl\'AI Coach';

  @override
  String get sosActionCraving => 'Noter une\nenvie';

  @override
  String get sosActionDistract => 'Se\nchanger les idées';

  @override
  String sosDontWaste(String days) {
    return 'NE GÂCHE PAS $days JOURS';
  }

  @override
  String sosRelapseWarning(String units) {
    return 'Si tu fumes maintenant, ta série ne sera pas réinitialisée — ce sera marqué comme un écart. Mais tu as déjà accumulé $units cigarettes d\'efforts.';
  }

  @override
  String get cravingTitle => 'NOTER UNE ENVIE';

  @override
  String cravingIntensity(String value) {
    return 'Intensité : $value';
  }

  @override
  String get cravingCueCoffee => 'Café';

  @override
  String get cravingCueStress => 'Stress';

  @override
  String get cravingCueAfterMeal => 'Après un repas';

  @override
  String get cravingCueSocial => 'Social';

  @override
  String get cravingCueOther => 'Autre';

  @override
  String get cravingSave => 'Enregistrer';

  @override
  String get cravingSaved => 'Enregistré. Ça aussi, ça passera.';

  @override
  String get breathingTitle => 'Exercice de respiration 4-7-8';

  @override
  String breathingRound(String cycle) {
    return 'Tour $cycle';
  }

  @override
  String get breathingInhaleLabel => 'INSPIRE';

  @override
  String get breathingInhaleHint => 'Inspire doucement par le nez.';

  @override
  String get breathingHoldLabel => 'RETIENS';

  @override
  String get breathingHoldHint =>
      'Retiens ta respiration, détends tes épaules.';

  @override
  String get breathingExhaleLabel => 'EXPIRE';

  @override
  String get breathingExhaleHint => 'Expire doucement par la bouche.';

  @override
  String get breathingFinish => 'Terminer';

  @override
  String get distractionTitle => 'Se changer les idées';

  @override
  String distractionStep(String index, String total) {
    return '$index / $total';
  }

  @override
  String get distractionInstructions =>
      'Regarde autour de toi et compte-les un par un. Pas de précipitation — prends quelques secondes pour chacun.';

  @override
  String get distractionFinish => 'Terminer';

  @override
  String get distractionNext => 'Suivant';

  @override
  String distractionStep1(String count) {
    return 'Nomme $count choses que tu peux VOIR';
  }

  @override
  String distractionStep2(String count) {
    return 'Nomme $count choses que tu peux TOUCHER';
  }

  @override
  String distractionStep3(String count) {
    return 'Nomme $count choses que tu peux ENTENDRE';
  }

  @override
  String distractionStep4(String count) {
    return 'Nomme $count choses que tu peux SENTIR';
  }

  @override
  String distractionStep5(String count) {
    return 'Nomme $count chose que tu peux GOÛTER';
  }

  @override
  String get aiCoachTitle => 'AI Coach';

  @override
  String get aiCoachComingSoonTitle => 'L\'AI Coach arrive bientôt';

  @override
  String get aiCoachComingSoonBody =>
      'La configuration côté serveur de cette fonctionnalité n\'est pas encore terminée. Cet écran basculera automatiquement vers le chat une fois prêt.';

  @override
  String get aiCoachEmptyState =>
      'Bonjour, je suis ton AI Coach. Dis-moi comment tu te sens — je suis là avec toi.';

  @override
  String aiCoachCallNow(String number) {
    return 'Appelle maintenant : $number';
  }

  @override
  String get aiCoachNotAlone => 'Tu n\'es pas seul(e).';

  @override
  String get aiCoachSendError =>
      'Impossible d\'envoyer le message. Vérifie ta connexion et réessaie ?';

  @override
  String get aiCoachInputHint => 'Écrire...';

  @override
  String get onboardingWelcome => 'Bienvenue sur SmokeFree AI';

  @override
  String get onboardingIntro =>
      'Nous avons besoin de quelques informations pour calculer correctement ton compteur et tes statistiques. Tu pourras les modifier à tout moment dans les réglages.';

  @override
  String get sectionProduct => 'QUE CONSOMMAIS-TU ?';

  @override
  String get sectionProductSettings => 'QUE CONSOMMES-TU ?';

  @override
  String get sectionDaily => 'CONSOMMATION QUOTIDIENNE';

  @override
  String get sectionPrice => 'PRIX DU PAQUET';

  @override
  String get sectionQuitMoment => 'MOMENT DE L\'ARRÊT';

  @override
  String perDayLabel(String unit) {
    return 'Combien de $unit par jour';
  }

  @override
  String perPackLabel(String unit) {
    return 'Combien de $unit par paquet';
  }

  @override
  String get priceLabel => 'Prix';

  @override
  String get onboardingStart => 'Commencer';

  @override
  String get errorSelectProduct => 'Merci de choisir ce que tu consommais.';

  @override
  String get errorDailyInvalid =>
      'La consommation quotidienne doit être un nombre valide.';

  @override
  String get errorPerPackInvalid =>
      'Le nombre d\'unités par paquet doit être un nombre valide.';

  @override
  String get errorPriceInvalid => 'Le prix doit être un nombre valide.';

  @override
  String get settingsTitle => 'Réglages';

  @override
  String get settingsSubtitle =>
      'Mets à jour ton profil, gère les notifications ou réinitialise tes données.';

  @override
  String get settingsSave => 'Enregistrer';

  @override
  String get settingsSaved => 'Tes informations ont été enregistrées.';

  @override
  String get settingsNotificationsTitle => 'NOTIFICATIONS';

  @override
  String get settingsNotificationsBody =>
      'Rappels quotidiens et notifications de soutien';

  @override
  String get settingsDangerTitle => 'ZONE DE DANGER';

  @override
  String get settingsDangerBody =>
      'Ton profil et tout ton historique seront définitivement supprimés et l\'application repartira de zéro.';

  @override
  String get settingsResetButton => 'Réinitialiser mes données';

  @override
  String get settingsResetDialogTitle => 'Réinitialiser tes données ?';

  @override
  String get settingsResetDialogBody =>
      'Ton profil et tout ton historique (check-ins, envies enregistrées) seront définitivement supprimés. Cette action est IRRÉVERSIBLE.';

  @override
  String get settingsResetCancel => 'Annuler';

  @override
  String get settingsResetConfirm => 'Oui, supprimer';

  @override
  String get settingsLanguageTitle => 'LANGUE';

  @override
  String get settingsLanguageSystemDefault => 'Langue du système';

  @override
  String settingsVersion(String version) {
    return 'SmokeFree AI · v$version';
  }

  @override
  String get productCigarette => 'Cigarettes';

  @override
  String get productRollYourOwn => 'Tabac à rouler';

  @override
  String get productVape => 'Cigarette électronique';

  @override
  String get productHookah => 'Narguilé';

  @override
  String get productCigar => 'Cigare';

  @override
  String get productSnus => 'Snus';

  @override
  String get unitPiece => 'unités';

  @override
  String get unitVape => 'bouffées/ml';

  @override
  String get unitHookah => 'séances';

  @override
  String get unitSnus => 'sachets';

  @override
  String get unitGeneric => 'unités';

  @override
  String get dateNow => 'Maintenant';

  @override
  String get dateYesterday => 'Hier';

  @override
  String get dateWeekAgo => 'Il y a 1 semaine';

  @override
  String get dateMonthAgo => 'Il y a 1 mois';

  @override
  String durationDaysHours(String days, String hours) {
    return '$days j $hours h';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '$hours h $minutes min';
  }

  @override
  String durationMinutes(String minutes) {
    return '$minutes min';
  }

  @override
  String get durationZeroMinutes => '0 min';

  @override
  String get timelineHeader => 'CHRONOLOGIE DE RÉCUPÉRATION SANTÉ';

  @override
  String get timelineSubheader => 'Ton corps se répare';

  @override
  String timelineNowHere(String title) {
    return '$title · tu es ici maintenant';
  }

  @override
  String timelineSource(String source) {
    return 'Source : $source';
  }

  @override
  String get milestoneMin20Title => '20 minutes';

  @override
  String get milestoneMin20Body =>
      'La fréquence cardiaque et la tension artérielle baissent.';

  @override
  String get milestoneHour8Title => '8 heures';

  @override
  String get milestoneHour8Body =>
      'Les niveaux de monoxyde de carbone et d\'oxygène commencent à se normaliser.';

  @override
  String get milestoneHour12Title => '12 heures';

  @override
  String get milestoneHour12Body =>
      'Le monoxyde de carbone dans le sang revient à la normale.';

  @override
  String get milestoneHour24Title => '24 heures';

  @override
  String get milestoneHour24Body => 'La nicotine est éliminée de ton sang.';

  @override
  String get milestoneHour48Title => '48 heures';

  @override
  String get milestoneHour48Body =>
      'Le goût et l\'odorat commencent à s\'améliorer.';

  @override
  String get milestoneHour72Title => '72 heures';

  @override
  String get milestoneHour72Body =>
      'Le niveau d\'énergie commence à augmenter.';

  @override
  String get milestoneWeek2Title => '2 à 12 semaines';

  @override
  String get milestoneWeek2Body =>
      'La circulation s\'améliore, la capacité pulmonaire augmente.';

  @override
  String get milestoneMonth1Title => '1 à 9 mois';

  @override
  String get milestoneMonth1Body => 'La toux et l\'essoufflement diminuent.';

  @override
  String get milestoneMonth9Title => '9 mois';

  @override
  String get milestoneMonth9Body =>
      'Les cils pulmonaires se régénèrent, le risque d\'infection diminue.';

  @override
  String get milestoneYear1Title => '1 an';

  @override
  String get milestoneYear1Body =>
      'Le risque de maladie coronarienne chute à environ la moitié de celui d\'un fumeur.';

  @override
  String get milestoneYear5Title => '5 ans';

  @override
  String get milestoneYear5Body => 'Le risque d\'AVC diminue.';

  @override
  String get milestoneYear10Title => '10 ans';

  @override
  String get milestoneYear10Body =>
      'Le risque de cancer du poumon chute à environ la moitié de celui d\'un fumeur.';

  @override
  String get milestoneYear15Title => '15 ans';

  @override
  String get milestoneYear15Body =>
      'Le risque de maladie coronarienne rejoint celui d\'un non-fumeur.';

  @override
  String get milestoneYear20Title => '20 ans';

  @override
  String get milestoneYear20Body =>
      'Le risque de cancer de la bouche, de la gorge et du larynx se rapproche de celui d\'un non-fumeur.';

  @override
  String statRecoveryValue(String percent) {
    return '$percent %';
  }

  @override
  String get settingsNotificationsComingSoon => 'Rappels bientôt disponibles';
}
