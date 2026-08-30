// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class L10nEs extends L10n {
  L10nEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'SmokeFree AI';

  @override
  String get dashboardTitle => 'Tu progreso';

  @override
  String get counterSmokeFree => 'Sin fumar desde hace';

  @override
  String get counterMoneySaved => 'Dinero ahorrado';

  @override
  String get counterUnitsAvoided => 'Cigarrillos no fumados';

  @override
  String get sosButton => 'Quiero fumar';

  @override
  String get disclaimerMedical =>
      'Esta aplicación es solo para información y motivación. No sustituye el consejo médico, el diagnóstico ni el tratamiento.';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonFinish => 'Terminar';

  @override
  String get commonNext => 'Siguiente';

  @override
  String get navSummary => 'Resumen';

  @override
  String get navHealth => 'Salud';

  @override
  String get navSos => 'SOS';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get heroSmokeFreeLabel => 'SIN FUMAR';

  @override
  String get heroDaysUnit => 'días';

  @override
  String heroMilestonesProgress(String unlocked, String total) {
    return '$unlocked / $total hitos de salud';
  }

  @override
  String get statMoneySavedLabel => 'Dinero ahorrado';

  @override
  String get statMoneySavedSub => 'crece cada día';

  @override
  String get statUnitsAvoidedLabel => 'Evitados';

  @override
  String get statUnitsAvoidedSub => 'cigarrillos';

  @override
  String get statLifeRegainedLabel => 'Vida recuperada';

  @override
  String get statLifeRegainedSub => 'estimación · Addiction 2025';

  @override
  String get statRecoveryLabel => 'Recuperación';

  @override
  String statRecoverySub(String unlocked, String total) {
    return '$unlocked / $total hitos';
  }

  @override
  String get pendingSourceVerifying => 'Verificando la fuente';

  @override
  String get pendingSourceHiddenPanel => 'panel oculto';

  @override
  String get badgesTitle => 'INSIGNIAS';

  @override
  String badgesUnlockedCount(String count, String total) {
    return '$count / $total desbloqueadas';
  }

  @override
  String get badgeDay7 => '7 Días';

  @override
  String get badgeDay30 => '30 Días';

  @override
  String get badgeDay90 => '90 Días';

  @override
  String get badgeYear1 => '1 Año';

  @override
  String get checkinTitle => '¿CÓMO ESTÁS HOY?';

  @override
  String checkinBody(String days) {
    return 'Vas por el día $days — cada día que superas ayuda a tu cuerpo a sanar un poco más.';
  }

  @override
  String get checkinGood => 'Estoy bien';

  @override
  String get checkinStruggling => 'Me cuesta';

  @override
  String get checkinSnackGood => 'Qué bueno escuchar eso. Sigue así.';

  @override
  String get checkinAnsweredGood => 'Hoy dijiste \"Estoy bien\" — guardado.';

  @override
  String get checkinAnsweredStruggling =>
      'Hoy dijiste \"Me cuesta\" — el SOS está aquí mismo.';

  @override
  String get milestoneAllUnlocked =>
      'Has desbloqueado todos los hitos de salud.';

  @override
  String get milestoneNextLabel => 'PRÓXIMO HITO';

  @override
  String milestoneOpensIn(String time, String source) {
    return 'Se desbloquea en $time · Fuente: $source';
  }

  @override
  String get counterfactualTitle => 'SI NO HUBIERAS DEJADO DE FUMAR';

  @override
  String counterfactualUnits(String units) {
    return '$units cigarrillos';
  }

  @override
  String counterfactualMoneyOnly(String money) {
    return 'habrías quemado $money.';
  }

  @override
  String counterfactualMoneyAndLife(String money, String life) {
    return 'habrías quemado $money y perdido $life de vida.';
  }

  @override
  String get trialTitle => 'Desbloquea todo';

  @override
  String get trialSubtitle =>
      'SOS ilimitado, datos de salud completos y todas las insignias';

  @override
  String get trialCta => 'Prueba gratis\npor 3 días';

  @override
  String get paywallTitle => 'Premium';

  @override
  String get paywallComingSoonTitle => 'Premium llega pronto';

  @override
  String get paywallComingSoonBody =>
      'La configuración de pagos del lado de la tienda aún no está terminada. Esta pantalla cambiará automáticamente a las opciones de compra en cuanto esté lista.';

  @override
  String get paywallLoadError =>
      'No se pudieron cargar los precios. Revisa tu conexión a internet.';

  @override
  String get paywallNoPackages =>
      'No hay paquetes disponibles en este momento.';

  @override
  String get paywallRestore => 'Restaurar compras';

  @override
  String get paywallRestoreSuccess => 'Tus compras se han restaurado.';

  @override
  String get paywallRestoreNone =>
      'No se encontró ninguna compra activa para restaurar.';

  @override
  String get paywallRestoreFailed => 'No se pudo restaurar.';

  @override
  String get paywallFeaturesTitle => 'DESBLOQUEA TODO';

  @override
  String get paywallFeatureSos => 'SOS ilimitado y chat con AI Coach';

  @override
  String get paywallFeatureTimeline =>
      'Cronología completa de recuperación de salud';

  @override
  String get paywallFeatureBadges => 'Todas las insignias e hitos';

  @override
  String get paywallFeatureAdFree => 'Experiencia sin anuncios';

  @override
  String get paywallThanks => '¡Gracias! Ahora eres premium.';

  @override
  String get paywallPurchaseFailed => 'No se pudo completar la compra.';

  @override
  String get sosHeader => 'ESTE MOMENTO ES DIFÍCIL';

  @override
  String get sosSubtitle =>
      'Un antojo dura en promedio unos 3 minutos.\nSuperémoslo juntos.';

  @override
  String get sosBreatheButton => 'RESPIRA';

  @override
  String get sosActionBreathing => 'Ejercicio de\nrespiración 4-7-8';

  @override
  String get sosActionCoach => 'Hablar con\nel AI Coach';

  @override
  String get sosActionCraving => 'Registrar\nun antojo';

  @override
  String get sosActionDistract => 'Distraer\nla mente';

  @override
  String sosDontWaste(String days) {
    return 'NO TIRES $days DÍAS';
  }

  @override
  String sosRelapseWarning(String units) {
    return 'Si fumas ahora, tu racha no se reiniciará — se marcará como un desliz. Pero ya te has ganado el esfuerzo de $units cigarrillos.';
  }

  @override
  String get cravingTitle => 'REGISTRAR UN ANTOJO';

  @override
  String cravingIntensity(String value) {
    return 'Intensidad: $value';
  }

  @override
  String get cravingCueCoffee => 'Café';

  @override
  String get cravingCueStress => 'Estrés';

  @override
  String get cravingCueAfterMeal => 'Después de comer';

  @override
  String get cravingCueSocial => 'Social';

  @override
  String get cravingCueOther => 'Otro';

  @override
  String get cravingSave => 'Guardar';

  @override
  String get cravingSaved => 'Guardado. Esto también pasará.';

  @override
  String get breathingTitle => 'Ejercicio de respiración 4-7-8';

  @override
  String breathingRound(String cycle) {
    return 'Ronda $cycle';
  }

  @override
  String get breathingInhaleLabel => 'INHALA';

  @override
  String get breathingInhaleHint => 'Inhala lentamente por la nariz.';

  @override
  String get breathingHoldLabel => 'MANTÉN';

  @override
  String get breathingHoldHint =>
      'Mantén el aire, deja que tus hombros se relajen.';

  @override
  String get breathingExhaleLabel => 'EXHALA';

  @override
  String get breathingExhaleHint => 'Exhala lentamente por la boca.';

  @override
  String get breathingFinish => 'Terminar';

  @override
  String get distractionTitle => 'Distraer la mente';

  @override
  String distractionStep(String index, String total) {
    return '$index / $total';
  }

  @override
  String get distractionInstructions =>
      'Mira a tu alrededor y cuéntalos uno por uno. Sin prisa — tómate unos segundos para cada uno.';

  @override
  String get distractionFinish => 'Terminar';

  @override
  String get distractionNext => 'Siguiente';

  @override
  String distractionStep1(String count) {
    return 'Nombra $count cosas que puedas VER';
  }

  @override
  String distractionStep2(String count) {
    return 'Nombra $count cosas que puedas TOCAR';
  }

  @override
  String distractionStep3(String count) {
    return 'Nombra $count cosas que puedas OÍR';
  }

  @override
  String distractionStep4(String count) {
    return 'Nombra $count cosas que puedas OLER';
  }

  @override
  String distractionStep5(String count) {
    return 'Nombra $count cosa que puedas SABOREAR';
  }

  @override
  String get aiCoachTitle => 'AI Coach';

  @override
  String get aiCoachComingSoonTitle => 'El AI Coach llega pronto';

  @override
  String get aiCoachComingSoonBody =>
      'La configuración del servidor para esta función aún no está terminada. Esta pantalla cambiará automáticamente al chat en cuanto esté lista.';

  @override
  String get aiCoachEmptyState =>
      'Hola, soy tu AI Coach. Cuéntame cómo te sientes — estoy aquí contigo.';

  @override
  String aiCoachCallNow(String number) {
    return 'Llama ahora: $number';
  }

  @override
  String get aiCoachNotAlone => 'No estás solo/a.';

  @override
  String get aiCoachSendError =>
      'No se pudo enviar el mensaje. ¿Revisas tu conexión e intentas de nuevo?';

  @override
  String get aiCoachInputHint => 'Escribir...';

  @override
  String get onboardingWelcome => 'Bienvenido/a a SmokeFree AI';

  @override
  String get onboardingIntro =>
      'Necesitamos algunos datos para calcular correctamente tu contador y tus estadísticas. Puedes cambiarlos en cualquier momento desde Ajustes.';

  @override
  String get sectionProduct => '¿QUÉ CONSUMÍAS?';

  @override
  String get sectionProductSettings => '¿QUÉ CONSUMES?';

  @override
  String get sectionDaily => 'CONSUMO DIARIO';

  @override
  String get sectionPrice => 'PRECIO DEL PAQUETE';

  @override
  String get sectionQuitMoment => 'MOMENTO DE DEJARLO';

  @override
  String perDayLabel(String unit) {
    return 'Cuántos $unit al día';
  }

  @override
  String perPackLabel(String unit) {
    return 'Cuántos $unit por paquete';
  }

  @override
  String get priceLabel => 'Precio';

  @override
  String get onboardingStart => 'Empezar';

  @override
  String get errorSelectProduct => 'Por favor, elige qué consumías.';

  @override
  String get errorDailyInvalid =>
      'El consumo diario debe ser un número válido.';

  @override
  String get errorPerPackInvalid =>
      'Las unidades por paquete deben ser un número válido.';

  @override
  String get errorPriceInvalid => 'El precio debe ser un número válido.';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsSubtitle =>
      'Actualiza tu perfil, gestiona las notificaciones o restablece tus datos.';

  @override
  String get settingsSave => 'Guardar';

  @override
  String get settingsSaved => 'Tu información se ha guardado.';

  @override
  String get settingsNotificationsTitle => 'NOTIFICACIONES';

  @override
  String get settingsNotificationsBody =>
      'Recordatorios diarios y notificaciones de apoyo';

  @override
  String get settingsDangerTitle => 'ZONA DE PELIGRO';

  @override
  String get settingsDangerBody =>
      'Tu perfil y todo tu historial se eliminarán permanentemente y la aplicación empezará de nuevo.';

  @override
  String get settingsResetButton => 'Restablecer mis datos';

  @override
  String get settingsResetDialogTitle => '¿Restablecer tus datos?';

  @override
  String get settingsResetDialogBody =>
      'Tu perfil y todo tu historial (check-ins, antojos registrados) se eliminarán permanentemente. Esta acción NO se puede deshacer.';

  @override
  String get settingsResetCancel => 'Cancelar';

  @override
  String get settingsResetConfirm => 'Sí, eliminar';

  @override
  String get settingsLanguageTitle => 'IDIOMA';

  @override
  String get settingsLanguageSystemDefault => 'Idioma del sistema';

  @override
  String settingsVersion(String version) {
    return 'SmokeFree AI · v$version';
  }

  @override
  String get productCigarette => 'Cigarrillos';

  @override
  String get productRollYourOwn => 'Tabaco de liar';

  @override
  String get productVape => 'Vapeador';

  @override
  String get productHookah => 'Narguile';

  @override
  String get productCigar => 'Puro';

  @override
  String get productSnus => 'Snus';

  @override
  String get unitPiece => 'unidades';

  @override
  String get unitVape => 'caladas/ml';

  @override
  String get unitHookah => 'sesiones';

  @override
  String get unitSnus => 'bolsitas';

  @override
  String get unitGeneric => 'unidades';

  @override
  String get dateNow => 'Ahora';

  @override
  String get dateYesterday => 'Ayer';

  @override
  String get dateWeekAgo => 'Hace 1 semana';

  @override
  String get dateMonthAgo => 'Hace 1 mes';

  @override
  String durationDaysHours(String days, String hours) {
    return '$days d $hours h';
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
  String get timelineHeader => 'CRONOLOGÍA DE RECUPERACIÓN DE SALUD';

  @override
  String get timelineSubheader => 'Tu cuerpo se está reparando';

  @override
  String timelineNowHere(String title) {
    return '$title · estás aquí ahora';
  }

  @override
  String timelineSource(String source) {
    return 'Fuente: $source';
  }

  @override
  String get milestoneMin20Title => '20 minutos';

  @override
  String get milestoneMin20Body =>
      'La frecuencia cardíaca y la presión arterial bajan.';

  @override
  String get milestoneHour8Title => '8 horas';

  @override
  String get milestoneHour8Body =>
      'Los niveles de monóxido de carbono y oxígeno empiezan a normalizarse.';

  @override
  String get milestoneHour12Title => '12 horas';

  @override
  String get milestoneHour12Body =>
      'El monóxido de carbono en sangre vuelve a la normalidad.';

  @override
  String get milestoneHour24Title => '24 horas';

  @override
  String get milestoneHour24Body => 'La nicotina se elimina de tu sangre.';

  @override
  String get milestoneHour48Title => '48 horas';

  @override
  String get milestoneHour48Body => 'El gusto y el olfato empiezan a mejorar.';

  @override
  String get milestoneHour72Title => '72 horas';

  @override
  String get milestoneHour72Body =>
      'Los niveles de energía empiezan a aumentar.';

  @override
  String get milestoneWeek2Title => '2–12 semanas';

  @override
  String get milestoneWeek2Body =>
      'La circulación mejora, la capacidad pulmonar aumenta.';

  @override
  String get milestoneMonth1Title => '1–9 meses';

  @override
  String get milestoneMonth1Body => 'La tos y la falta de aire disminuyen.';

  @override
  String get milestoneMonth9Title => '9 meses';

  @override
  String get milestoneMonth9Body =>
      'Los cilios pulmonares se recuperan, disminuye el riesgo de infección.';

  @override
  String get milestoneYear1Title => '1 año';

  @override
  String get milestoneYear1Body =>
      'El riesgo de enfermedad coronaria baja a más o menos la mitad que el de un fumador.';

  @override
  String get milestoneYear5Title => '5 años';

  @override
  String get milestoneYear5Body => 'El riesgo de derrame cerebral disminuye.';

  @override
  String get milestoneYear10Title => '10 años';

  @override
  String get milestoneYear10Body =>
      'El riesgo de cáncer de pulmón baja a más o menos la mitad que el de un fumador.';

  @override
  String get milestoneYear15Title => '15 años';

  @override
  String get milestoneYear15Body =>
      'El riesgo de enfermedad coronaria iguala al de una persona no fumadora.';

  @override
  String get milestoneYear20Title => '20 años';

  @override
  String get milestoneYear20Body =>
      'El riesgo de cáncer de boca, garganta y laringe se acerca al de una persona no fumadora.';

  @override
  String statRecoveryValue(String percent) {
    return '$percent%';
  }

  @override
  String get settingsNotificationsComingSoon => 'Recordatorios próximamente';
}
