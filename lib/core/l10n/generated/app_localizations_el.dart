// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class L10nEl extends L10n {
  L10nEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'SmokeFree AI';

  @override
  String get dashboardTitle => 'Η πρόοδός σου';

  @override
  String get counterSmokeFree => 'Χωρίς κάπνισμα εδώ και';

  @override
  String get counterMoneySaved => 'Χρήματα που εξοικονομήθηκαν';

  @override
  String get counterUnitsAvoided => 'Τσιγάρα που δεν καπνίστηκαν';

  @override
  String get sosButton => 'Θέλω να καπνίσω';

  @override
  String get disclaimerMedical =>
      'Αυτή η εφαρμογή προορίζεται μόνο για ενημέρωση και παρακίνηση. Δεν αποτελεί ιατρική συμβουλή, διάγνωση ή θεραπεία.';

  @override
  String get commonSave => 'Αποθήκευση';

  @override
  String get commonCancel => 'Ακύρωση';

  @override
  String get commonFinish => 'Τέλος';

  @override
  String get commonNext => 'Επόμενο';

  @override
  String get navSummary => 'Σύνοψη';

  @override
  String get navHealth => 'Υγεία';

  @override
  String get navSos => 'SOS';

  @override
  String get navSettings => 'Ρυθμίσεις';

  @override
  String get heroSmokeFreeLabel => 'ΧΩΡΙΣ ΚΑΠΝΙΣΜΑ';

  @override
  String get heroDaysUnit => 'ημέρες';

  @override
  String heroMilestonesProgress(String unlocked, String total) {
    return '$unlocked / $total ορόσημα υγείας';
  }

  @override
  String get statMoneySavedLabel => 'Χρήματα που εξοικονομήθηκαν';

  @override
  String get statMoneySavedSub => 'αυξάνεται καθημερινά';

  @override
  String get statUnitsAvoidedLabel => 'Αποφεύχθηκαν';

  @override
  String get statUnitsAvoidedSub => 'τσιγάρα';

  @override
  String get statLifeRegainedLabel => 'Χρόνος ζωής που κερδήθηκε';

  @override
  String get statLifeRegainedSub => 'εκτίμηση · Addiction 2025';

  @override
  String get statRecoveryLabel => 'Ανάρρωση';

  @override
  String statRecoverySub(String unlocked, String total) {
    return '$unlocked / $total ορόσημα';
  }

  @override
  String get pendingSourceVerifying => 'Η πηγή επαληθεύεται';

  @override
  String get pendingSourceHiddenPanel => 'κρυφός πίνακας';

  @override
  String get badgesTitle => 'ΔΙΑΚΡΙΣΕΙΣ';

  @override
  String badgesUnlockedCount(String count, String total) {
    return '$count / $total ξεκλειδωμένες';
  }

  @override
  String get badgeDay7 => '7 Ημέρες';

  @override
  String get badgeDay30 => '30 Ημέρες';

  @override
  String get badgeDay90 => '90 Ημέρες';

  @override
  String get badgeYear1 => '1 Χρόνος';

  @override
  String get checkinTitle => 'ΠΩΣ ΝΙΩΘΕΙΣ ΣΗΜΕΡΑ;';

  @override
  String checkinBody(String days) {
    return 'Βρίσκεσαι στην ημέρα $days — κάθε ημέρα που περνάς βοηθά το σώμα σου να επουλωθεί λίγο περισσότερο.';
  }

  @override
  String get checkinGood => 'Είμαι καλά';

  @override
  String get checkinStruggling => 'Δυσκολεύομαι';

  @override
  String get checkinSnackGood => 'Χαίρομαι που το ακούω. Συνέχισε έτσι.';

  @override
  String get checkinAnsweredGood =>
      'Σήμερα απάντησες «Είμαι καλά» — αποθηκεύτηκε.';

  @override
  String get checkinAnsweredStruggling =>
      'Σήμερα απάντησες «Δυσκολεύομαι» — το SOS είναι εδώ δίπλα.';

  @override
  String get milestoneAllUnlocked => 'Ξεκλείδωσες όλα τα ορόσημα υγείας.';

  @override
  String get milestoneNextLabel => 'ΕΠΟΜΕΝΟ ΟΡΟΣΗΜΟ';

  @override
  String milestoneOpensIn(String time, String source) {
    return 'Ξεκλειδώνει σε $time · Πηγή: $source';
  }

  @override
  String get counterfactualTitle => 'ΑΝ ΔΕΝ ΕΙΧΕΣ ΚΟΨΕΙ ΤΟ ΚΑΠΝΙΣΜΑ';

  @override
  String counterfactualUnits(String units) {
    return '$units τσιγάρα';
  }

  @override
  String counterfactualMoneyOnly(String money) {
    return 'θα είχες κάψει $money.';
  }

  @override
  String counterfactualMoneyAndLife(String money, String life) {
    return 'θα είχες κάψει $money και χάσει $life ζωής.';
  }

  @override
  String get trialTitle => 'Ξεκλείδωσε τα πάντα';

  @override
  String get trialSubtitle =>
      'Απεριόριστο SOS, πλήρη δεδομένα υγείας και όλες οι διακρίσεις';

  @override
  String get trialCta => 'Δοκίμασε δωρεάν\nγια 3 ημέρες';

  @override
  String get paywallTitle => 'Premium';

  @override
  String get paywallComingSoonTitle => 'Το Premium έρχεται σύντομα';

  @override
  String get paywallComingSoonBody =>
      'Η ρύθμιση πληρωμών από την πλευρά του καταστήματος δεν έχει ολοκληρωθεί ακόμη. Αυτή η οθόνη θα μεταβεί αυτόματα στις επιλογές αγοράς μόλις είναι έτοιμη.';

  @override
  String get paywallLoadError =>
      'Δεν ήταν δυνατή η φόρτωση των τιμών. Έλεγξε τη σύνδεσή σου στο διαδίκτυο.';

  @override
  String get paywallNoPackages =>
      'Δεν υπάρχουν διαθέσιμα πακέτα αυτή τη στιγμή.';

  @override
  String get paywallRestore => 'Επαναφορά αγορών';

  @override
  String get paywallRestoreSuccess => 'Οι αγορές σου επαναφέρθηκαν.';

  @override
  String get paywallRestoreNone => 'Δεν βρέθηκε ενεργή αγορά για επαναφορά.';

  @override
  String get paywallRestoreFailed => 'Η επαναφορά απέτυχε.';

  @override
  String get paywallFeaturesTitle => 'ΞΕΚΛΕΙΔΩΣΕ ΤΑ ΠΑΝΤΑ';

  @override
  String get paywallFeatureSos =>
      'Απεριόριστο SOS και συνομιλία με τον AI Coach';

  @override
  String get paywallFeatureTimeline => 'Πλήρες χρονοδιάγραμμα ανάρρωσης υγείας';

  @override
  String get paywallFeatureBadges => 'Όλες οι διακρίσεις και τα ορόσημα';

  @override
  String get paywallFeatureAdFree => 'Εμπειρία χωρίς διαφημίσεις';

  @override
  String get paywallThanks => 'Ευχαριστούμε! Τώρα έχεις premium.';

  @override
  String get paywallPurchaseFailed => 'Η αγορά δεν ολοκληρώθηκε.';

  @override
  String get sosHeader => 'ΑΥΤΗ Η ΣΤΙΓΜΗ ΕΙΝΑΙ ΔΥΣΚΟΛΗ';

  @override
  String get sosSubtitle =>
      'Μια λαχτάρα διαρκεί κατά μέσο όρο περίπου 3 λεπτά.\nΑς την περάσουμε μαζί.';

  @override
  String get sosBreatheButton => 'ΑΝΕΠΝΕΥΣΕ';

  @override
  String get sosActionBreathing => 'Άσκηση αναπνοής\n4-7-8';

  @override
  String get sosActionCoach => 'Μίλα στον\nAI Coach';

  @override
  String get sosActionCraving => 'Καταγραφή\nλαχτάρας';

  @override
  String get sosActionDistract => 'Απόσπασε\nτην προσοχή σου';

  @override
  String sosDontWaste(String days) {
    return 'ΜΗΝ ΠΕΤΑΞΕΙΣ $days ΗΜΕΡΕΣ';
  }

  @override
  String sosRelapseWarning(String units) {
    return 'Αν καπνίσεις τώρα, το σερί σου δεν θα μηδενιστεί — θα σημειωθεί ως παρέκκλιση. Όμως έχεις ήδη κερδίσει την προσπάθεια $units τσιγάρων.';
  }

  @override
  String get cravingTitle => 'ΚΑΤΑΓΡΑΦΗ ΛΑΧΤΑΡΑΣ';

  @override
  String cravingIntensity(String value) {
    return 'Ένταση: $value';
  }

  @override
  String get cravingCueCoffee => 'Καφές';

  @override
  String get cravingCueStress => 'Άγχος';

  @override
  String get cravingCueAfterMeal => 'Μετά το φαγητό';

  @override
  String get cravingCueSocial => 'Κοινωνική εκδήλωση';

  @override
  String get cravingCueOther => 'Άλλο';

  @override
  String get cravingSave => 'Αποθήκευση';

  @override
  String get cravingSaved => 'Αποθηκεύτηκε. Κι αυτό θα περάσει.';

  @override
  String get breathingTitle => 'Άσκηση αναπνοής 4-7-8';

  @override
  String breathingRound(String cycle) {
    return 'Γύρος $cycle';
  }

  @override
  String get breathingInhaleLabel => 'ΕΙΣΠΝΟΗ';

  @override
  String get breathingInhaleHint => 'Πάρε αργά αναπνοή από τη μύτη.';

  @override
  String get breathingHoldLabel => 'ΚΡΑΤΑ';

  @override
  String get breathingHoldHint =>
      'Κράτα την αναπνοή σου, χαλάρωσε τους ώμους σου.';

  @override
  String get breathingExhaleLabel => 'ΕΚΠΝΟΗ';

  @override
  String get breathingExhaleHint => 'Άφησε αργά τον αέρα από το στόμα.';

  @override
  String get breathingFinish => 'Τέλος';

  @override
  String get distractionTitle => 'Απόσπασε την προσοχή σου';

  @override
  String distractionStep(String index, String total) {
    return '$index / $total';
  }

  @override
  String get distractionInstructions =>
      'Κοίτα γύρω σου και μέτρησέ τα ένα-ένα. Χωρίς βιασύνη — αφιέρωσε λίγα δευτερόλεπτα σε καθένα.';

  @override
  String get distractionFinish => 'Τέλος';

  @override
  String get distractionNext => 'Επόμενο';

  @override
  String distractionStep1(String count) {
    return 'Πες $count πράγματα που ΒΛΕΠΕΙΣ';
  }

  @override
  String distractionStep2(String count) {
    return 'Πες $count πράγματα που μπορείς να ΑΓΓΙΞΕΙΣ';
  }

  @override
  String distractionStep3(String count) {
    return 'Πες $count ήχους που ΑΚΟΥΣ';
  }

  @override
  String distractionStep4(String count) {
    return 'Πες $count μυρωδιές που ΜΥΡΙΖΕΙΣ';
  }

  @override
  String distractionStep5(String count) {
    return 'Πες $count γεύση που μπορείς να ΝΙΩΣΕΙΣ';
  }

  @override
  String get aiCoachTitle => 'AI Coach';

  @override
  String get aiCoachComingSoonTitle => 'Ο AI Coach έρχεται σύντομα';

  @override
  String get aiCoachComingSoonBody =>
      'Η ρύθμιση από την πλευρά του διακομιστή για αυτή τη λειτουργία δεν έχει ολοκληρωθεί ακόμη. Αυτή η οθόνη θα μεταβεί αυτόματα στη συνομιλία μόλις είναι έτοιμη.';

  @override
  String get aiCoachEmptyState =>
      'Γεια σου, είμαι ο AI Coach σου. Πες μου πώς νιώθεις — είμαι εδώ μαζί σου.';

  @override
  String aiCoachCallNow(String number) {
    return 'Κάλεσε τώρα: $number';
  }

  @override
  String get aiCoachNotAlone => 'Δεν είσαι μόνος/η.';

  @override
  String get aiCoachSendError =>
      'Δεν ήταν δυνατή η αποστολή του μηνύματος. Έλεγξε τη σύνδεσή σου και δοκίμασε ξανά;';

  @override
  String get aiCoachInputHint => 'Γράψε...';

  @override
  String get onboardingWelcome => 'Καλώς ήρθες στο SmokeFree AI';

  @override
  String get onboardingIntro =>
      'Χρειαζόμαστε μερικές πληροφορίες για να υπολογίσουμε σωστά τον μετρητή και τα στατιστικά σου. Μπορείς να τις αλλάξεις οποιαδήποτε στιγμή από τις Ρυθμίσεις.';

  @override
  String get sectionProduct => 'ΤΙ ΚΑΠΝΙΖΕΣ;';

  @override
  String get sectionProductSettings => 'ΤΙ ΚΑΠΝΙΖΕΙΣ;';

  @override
  String get sectionDaily => 'ΗΜΕΡΗΣΙΑ ΚΑΤΑΝΑΛΩΣΗ';

  @override
  String get sectionPrice => 'ΤΙΜΗ ΠΑΚΕΤΟΥ';

  @override
  String get sectionQuitMoment => 'ΣΤΙΓΜΗ ΔΙΑΚΟΠΗΣ';

  @override
  String perDayLabel(String unit) {
    return 'Πόσα $unit την ημέρα';
  }

  @override
  String perPackLabel(String unit) {
    return 'Πόσα $unit ανά πακέτο';
  }

  @override
  String get priceLabel => 'Τιμή';

  @override
  String get onboardingStart => 'Έναρξη';

  @override
  String get errorSelectProduct => 'Παρακαλώ επίλεξε τι κάπνιζες.';

  @override
  String get errorDailyInvalid =>
      'Η ημερήσια κατανάλωση πρέπει να είναι έγκυρος αριθμός.';

  @override
  String get errorPerPackInvalid =>
      'Ο αριθμός ανά πακέτο πρέπει να είναι έγκυρος αριθμός.';

  @override
  String get errorPriceInvalid => 'Η τιμή πρέπει να είναι έγκυρος αριθμός.';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get settingsSubtitle =>
      'Ενημέρωσε το προφίλ σου, διαχειρίσου τις ειδοποιήσεις ή επαναφέρεις τα δεδομένα σου.';

  @override
  String get settingsSave => 'Αποθήκευση';

  @override
  String get settingsSaved => 'Τα στοιχεία σου αποθηκεύτηκαν.';

  @override
  String get settingsNotificationsTitle => 'ΕΙΔΟΠΟΙΗΣΕΙΣ';

  @override
  String get settingsNotificationsBody =>
      'Καθημερινές υπενθυμίσεις και υποστηρικτικές ειδοποιήσεις';

  @override
  String get settingsDangerTitle => 'ΕΠΙΚΙΝΔΥΝΗ ΖΩΝΗ';

  @override
  String get settingsDangerBody =>
      'Το προφίλ σου και όλο το ιστορικό σου θα διαγραφούν οριστικά και η εφαρμογή θα ξεκινήσει από την αρχή.';

  @override
  String get settingsResetButton => 'Επαναφορά των δεδομένων μου';

  @override
  String get settingsResetDialogTitle => 'Επαναφορά των δεδομένων σου;';

  @override
  String get settingsResetDialogBody =>
      'Το προφίλ σου και όλο το ιστορικό σου (check-in, καταγραφές λαχτάρας) θα διαγραφούν οριστικά. Αυτή η ενέργεια ΔΕΝ αναιρείται.';

  @override
  String get settingsResetCancel => 'Ακύρωση';

  @override
  String get settingsResetConfirm => 'Ναι, διαγραφή';

  @override
  String get settingsLanguageTitle => 'ΓΛΩΣΣΑ';

  @override
  String get settingsLanguageSystemDefault => 'Γλώσσα συστήματος';

  @override
  String settingsVersion(String version) {
    return 'SmokeFree AI · v$version';
  }

  @override
  String get productCigarette => 'Τσιγάρα';

  @override
  String get productRollYourOwn => 'Στριφτό';

  @override
  String get productVape => 'Ηλεκτρονικό τσιγάρο';

  @override
  String get productHookah => 'Ναργιλές';

  @override
  String get productCigar => 'Πούρο';

  @override
  String get productSnus => 'Snus';

  @override
  String get unitPiece => 'τεμάχια';

  @override
  String get unitVape => 'ρουφήγματα/ml';

  @override
  String get unitHookah => 'συνεδρίες';

  @override
  String get unitSnus => 'σακουλάκια';

  @override
  String get unitGeneric => 'μονάδες';

  @override
  String get dateNow => 'Τώρα';

  @override
  String get dateYesterday => 'Χθες';

  @override
  String get dateWeekAgo => 'Πριν 1 εβδομάδα';

  @override
  String get dateMonthAgo => 'Πριν 1 μήνα';

  @override
  String durationDaysHours(String days, String hours) {
    return '$days ημ $hours ώ';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '$hours ώ $minutes λ';
  }

  @override
  String durationMinutes(String minutes) {
    return '$minutes λ';
  }

  @override
  String get durationZeroMinutes => '0 λ';

  @override
  String get timelineHeader => 'ΧΡΟΝΟΔΙΑΓΡΑΜΜΑ ΑΝΑΡΡΩΣΗΣ ΥΓΕΙΑΣ';

  @override
  String get timelineSubheader => 'Το σώμα σου επουλώνεται';

  @override
  String timelineNowHere(String title) {
    return '$title · είσαι εδώ τώρα';
  }

  @override
  String timelineSource(String source) {
    return 'Πηγή: $source';
  }

  @override
  String get milestoneMin20Title => '20 λεπτά';

  @override
  String get milestoneMin20Body =>
      'Ο καρδιακός ρυθμός και η αρτηριακή πίεση μειώνονται.';

  @override
  String get milestoneHour8Title => '8 ώρες';

  @override
  String get milestoneHour8Body =>
      'Τα επίπεδα μονοξειδίου του άνθρακα και οξυγόνου αρχίζουν να επανέρχονται στο φυσιολογικό.';

  @override
  String get milestoneHour12Title => '12 ώρες';

  @override
  String get milestoneHour12Body =>
      'Το μονοξείδιο του άνθρακα στο αίμα επανέρχεται στο φυσιολογικό.';

  @override
  String get milestoneHour24Title => '24 ώρες';

  @override
  String get milestoneHour24Body =>
      'Η νικοτίνη απομακρύνεται πλήρως από το αίμα σου.';

  @override
  String get milestoneHour48Title => '48 ώρες';

  @override
  String get milestoneHour48Body =>
      'Η γεύση και η όσφρηση αρχίζουν να βελτιώνονται.';

  @override
  String get milestoneHour72Title => '72 ώρες';

  @override
  String get milestoneHour72Body =>
      'Τα επίπεδα ενέργειας αρχίζουν να αυξάνονται.';

  @override
  String get milestoneWeek2Title => '2–12 εβδομάδες';

  @override
  String get milestoneWeek2Body =>
      'Η κυκλοφορία βελτιώνεται, η πνευμονική χωρητικότητα αυξάνεται.';

  @override
  String get milestoneMonth1Title => '1–9 μήνες';

  @override
  String get milestoneMonth1Body => 'Ο βήχας και η δύσπνοια μειώνονται.';

  @override
  String get milestoneMonth9Title => '9 μήνες';

  @override
  String get milestoneMonth9Body =>
      'Τα κροσσωτά κύτταρα των πνευμόνων αναρρώνουν, ο κίνδυνος λοίμωξης μειώνεται.';

  @override
  String get milestoneYear1Title => '1 χρόνος';

  @override
  String get milestoneYear1Body =>
      'Ο κίνδυνος στεφανιαίας νόσου μειώνεται περίπου στο μισό σε σχέση με έναν καπνιστή.';

  @override
  String get milestoneYear5Title => '5 χρόνια';

  @override
  String get milestoneYear5Body => 'Ο κίνδυνος εγκεφαλικού μειώνεται.';

  @override
  String get milestoneYear10Title => '10 χρόνια';

  @override
  String get milestoneYear10Body =>
      'Ο κίνδυνος καρκίνου του πνεύμονα μειώνεται περίπου στο μισό σε σχέση με έναν καπνιστή.';

  @override
  String get milestoneYear15Title => '15 χρόνια';

  @override
  String get milestoneYear15Body =>
      'Ο κίνδυνος στεφανιαίας νόσου εξισώνεται με αυτόν ενός μη καπνιστή.';

  @override
  String get milestoneYear20Title => '20 χρόνια';

  @override
  String get milestoneYear20Body =>
      'Ο κίνδυνος καρκίνου στόματος, λαιμού και λάρυγγα πλησιάζει αυτόν ενός μη καπνιστή.';

  @override
  String statRecoveryValue(String percent) {
    return '$percent%';
  }

  @override
  String get settingsNotificationsComingSoon =>
      'Οι υπενθυμίσεις έρχονται σύντομα';
}
