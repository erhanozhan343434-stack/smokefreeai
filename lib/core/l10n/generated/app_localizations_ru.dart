// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class L10nRu extends L10n {
  L10nRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'SmokeFree AI';

  @override
  String get dashboardTitle => 'Твой прогресс';

  @override
  String get counterSmokeFree => 'Без курения уже';

  @override
  String get counterMoneySaved => 'Сэкономлено денег';

  @override
  String get counterUnitsAvoided => 'Невыкуренные сигареты';

  @override
  String get sosButton => 'Хочу курить';

  @override
  String get disclaimerMedical =>
      'Это приложение предназначено только для информирования и мотивации. Оно не заменяет медицинскую консультацию, диагностику или лечение.';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonFinish => 'Готово';

  @override
  String get commonNext => 'Далее';

  @override
  String get navSummary => 'Обзор';

  @override
  String get navHealth => 'Здоровье';

  @override
  String get navSos => 'SOS';

  @override
  String get navSettings => 'Настройки';

  @override
  String get heroSmokeFreeLabel => 'БЕЗ КУРЕНИЯ';

  @override
  String get heroDaysUnit => 'дней';

  @override
  String heroMilestonesProgress(String unlocked, String total) {
    return '$unlocked / $total этапов здоровья';
  }

  @override
  String get statMoneySavedLabel => 'Сэкономлено';

  @override
  String get statMoneySavedSub => 'растёт каждый день';

  @override
  String get statUnitsAvoidedLabel => 'Не выкурено';

  @override
  String get statUnitsAvoidedSub => 'сигарет';

  @override
  String get statLifeRegainedLabel => 'Возвращено жизни';

  @override
  String get statLifeRegainedSub => 'оценка · Addiction 2025';

  @override
  String get statRecoveryLabel => 'Восстановление';

  @override
  String statRecoverySub(String unlocked, String total) {
    return '$unlocked / $total этапов';
  }

  @override
  String get pendingSourceVerifying => 'Источник проверяется';

  @override
  String get pendingSourceHiddenPanel => 'панель скрыта';

  @override
  String get badgesTitle => 'ЗНАЧКИ';

  @override
  String badgesUnlockedCount(String count, String total) {
    return '$count / $total открыто';
  }

  @override
  String get badgeDay7 => '7 дней';

  @override
  String get badgeDay30 => '30 дней';

  @override
  String get badgeDay90 => '90 дней';

  @override
  String get badgeYear1 => '1 год';

  @override
  String get checkinTitle => 'КАК ТЫ СЕГОДНЯ?';

  @override
  String checkinBody(String days) {
    return 'Сегодня $days-й день — каждый прожитый день помогает твоему телу восстанавливаться ещё немного.';
  }

  @override
  String get checkinGood => 'Всё хорошо';

  @override
  String get checkinStruggling => 'Тяжело';

  @override
  String get checkinSnackGood => 'Приятно слышать. Продолжай в том же духе.';

  @override
  String get checkinAnsweredGood =>
      'Сегодня ты отметил(а) «Всё хорошо» — сохранено.';

  @override
  String get checkinAnsweredStruggling =>
      'Сегодня ты отметил(а) «Тяжело» — SOS рядом.';

  @override
  String get milestoneAllUnlocked => 'Ты открыл(а) все этапы здоровья.';

  @override
  String get milestoneNextLabel => 'СЛЕДУЮЩИЙ ЭТАП';

  @override
  String milestoneOpensIn(String time, String source) {
    return 'Откроется через $time · Источник: $source';
  }

  @override
  String get counterfactualTitle => 'ЕСЛИ БЫ ТЫ НЕ БРОСИЛ(А)';

  @override
  String counterfactualUnits(String units) {
    return '$units сигарет';
  }

  @override
  String counterfactualMoneyOnly(String money) {
    return 'ты бы сжёг(ла) $money.';
  }

  @override
  String counterfactualMoneyAndLife(String money, String life) {
    return 'ты бы сжёг(ла) $money и потерял(а) $life жизни.';
  }

  @override
  String get trialTitle => 'Открыть всё';

  @override
  String get trialSubtitle =>
      'Безлимитный SOS, полные данные о здоровье и все значки';

  @override
  String get trialCta => '3 дня\nбесплатно';

  @override
  String get paywallTitle => 'Премиум';

  @override
  String get paywallComingSoonTitle => 'Премиум скоро появится';

  @override
  String get paywallComingSoonBody =>
      'Настройка платежей на стороне магазина ещё не завершена. Этот экран автоматически переключится на варианты покупки, как только всё будет готово.';

  @override
  String get paywallLoadError =>
      'Не удалось загрузить цены. Проверь подключение к интернету.';

  @override
  String get paywallNoPackages => 'Сейчас нет доступных пакетов.';

  @override
  String get paywallRestore => 'Восстановить покупки';

  @override
  String get paywallRestoreSuccess => 'Твои покупки восстановлены.';

  @override
  String get paywallRestoreNone =>
      'Активных покупок для восстановления не найдено.';

  @override
  String get paywallRestoreFailed => 'Не удалось восстановить покупки.';

  @override
  String get paywallFeaturesTitle => 'ОТКРЫТЬ ВСЁ';

  @override
  String get paywallFeatureSos => 'Безлимитный SOS и чат с AI-коучем';

  @override
  String get paywallFeatureTimeline =>
      'Полная временная шкала восстановления здоровья';

  @override
  String get paywallFeatureBadges => 'Все значки и этапы';

  @override
  String get paywallFeatureAdFree => 'Без рекламы';

  @override
  String get paywallThanks => 'Спасибо! Теперь у тебя премиум.';

  @override
  String get paywallPurchaseFailed => 'Не удалось завершить покупку.';

  @override
  String get sosHeader => 'СЕЙЧАС ТРУДНЫЙ МОМЕНТ';

  @override
  String get sosSubtitle =>
      'Тяга длится в среднем около 3 минут.\nДавай переживём её вместе.';

  @override
  String get sosBreatheButton => 'ДЫШИ';

  @override
  String get sosActionBreathing => 'Дыхательное\nупражнение 4-7-8';

  @override
  String get sosActionCoach => 'Поговорить\nс AI-коучем';

  @override
  String get sosActionCraving => 'Записать\nтягу';

  @override
  String get sosActionDistract => 'Отвлечь\nвнимание';

  @override
  String sosDontWaste(String days) {
    return 'НЕ ВЫБРАСЫВАЙ $days ДНЕЙ';
  }

  @override
  String sosRelapseWarning(String units) {
    return 'Если закуришь сейчас, серия не обнулится — это отметится как срыв. Но ты уже заслужил(а) усилие в $units сигарет.';
  }

  @override
  String get cravingTitle => 'ЗАПИСАТЬ ТЯГУ';

  @override
  String cravingIntensity(String value) {
    return 'Сила: $value';
  }

  @override
  String get cravingCueCoffee => 'Кофе';

  @override
  String get cravingCueStress => 'Стресс';

  @override
  String get cravingCueAfterMeal => 'После еды';

  @override
  String get cravingCueSocial => 'В компании';

  @override
  String get cravingCueOther => 'Другое';

  @override
  String get cravingSave => 'Сохранить';

  @override
  String get cravingSaved => 'Сохранено. Это тоже пройдёт.';

  @override
  String get breathingTitle => 'Дыхательное упражнение 4-7-8';

  @override
  String breathingRound(String cycle) {
    return 'Круг $cycle';
  }

  @override
  String get breathingInhaleLabel => 'ВДОХ';

  @override
  String get breathingInhaleHint => 'Медленно вдохни через нос.';

  @override
  String get breathingHoldLabel => 'ЗАДЕРЖИ';

  @override
  String get breathingHoldHint => 'Задержи дыхание, расслабь плечи.';

  @override
  String get breathingExhaleLabel => 'ВЫДОХ';

  @override
  String get breathingExhaleHint => 'Медленно выдохни через рот.';

  @override
  String get breathingFinish => 'Готово';

  @override
  String get distractionTitle => 'Отвлечь внимание';

  @override
  String distractionStep(String index, String total) {
    return '$index / $total';
  }

  @override
  String get distractionInstructions =>
      'Осмотрись вокруг и назови их по порядку. Не спеши — уделяй каждому по несколько секунд.';

  @override
  String get distractionFinish => 'Готово';

  @override
  String get distractionNext => 'Далее';

  @override
  String distractionStep1(String count) {
    return 'Назови $count предметов, которые ты ВИДИШЬ';
  }

  @override
  String distractionStep2(String count) {
    return 'Назови $count предметов, которых ты можешь КОСНУТЬСЯ';
  }

  @override
  String distractionStep3(String count) {
    return 'Назови $count звуков, которые ты СЛЫШИШЬ';
  }

  @override
  String distractionStep4(String count) {
    return 'Назови $count запахов, которые ты ЧУВСТВУЕШЬ';
  }

  @override
  String distractionStep5(String count) {
    return 'Назови $count вкус, который ты ощущаешь';
  }

  @override
  String get aiCoachTitle => 'AI-коуч';

  @override
  String get aiCoachComingSoonTitle => 'AI-коуч скоро появится';

  @override
  String get aiCoachComingSoonBody =>
      'Настройка сервера для этой функции ещё не завершена. Этот экран автоматически переключится на чат, как только всё будет готово.';

  @override
  String get aiCoachEmptyState =>
      'Привет, я твой AI-коуч. Расскажи, что ты чувствуешь — я рядом с тобой.';

  @override
  String aiCoachCallNow(String number) {
    return 'Позвони прямо сейчас: $number';
  }

  @override
  String get aiCoachNotAlone => 'Ты не один(на).';

  @override
  String get aiCoachSendError =>
      'Не удалось отправить сообщение. Проверить соединение и попробовать снова?';

  @override
  String get aiCoachInputHint => 'Напиши...';

  @override
  String get onboardingWelcome => 'Добро пожаловать в SmokeFree AI';

  @override
  String get onboardingIntro =>
      'Нам нужно немного информации, чтобы правильно рассчитать счётчик и статистику. Ты сможешь изменить это в любой момент в Настройках.';

  @override
  String get sectionProduct => 'ЧТО ТЫ УПОТРЕБЛЯЛ(А)?';

  @override
  String get sectionProductSettings => 'ЧТО ТЫ УПОТРЕБЛЯЕШЬ?';

  @override
  String get sectionDaily => 'ЕЖЕДНЕВНОЕ ПОТРЕБЛЕНИЕ';

  @override
  String get sectionPrice => 'ЦЕНА ПАЧКИ';

  @override
  String get sectionQuitMoment => 'МОМЕНТ ОТКАЗА';

  @override
  String perDayLabel(String unit) {
    return 'Сколько $unit в день';
  }

  @override
  String perPackLabel(String unit) {
    return 'Сколько $unit в пачке';
  }

  @override
  String get priceLabel => 'Цена';

  @override
  String get onboardingStart => 'Начать';

  @override
  String get errorSelectProduct => 'Пожалуйста, выбери, что ты употреблял(а).';

  @override
  String get errorDailyInvalid =>
      'Ежедневное потребление должно быть корректным числом.';

  @override
  String get errorPerPackInvalid =>
      'Количество в пачке должно быть корректным числом.';

  @override
  String get errorPriceInvalid => 'Цена должна быть корректным числом.';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsSubtitle =>
      'Обнови профиль, управляй уведомлениями или сбрось свои данные.';

  @override
  String get settingsSave => 'Сохранить';

  @override
  String get settingsSaved => 'Твоя информация сохранена.';

  @override
  String get settingsNotificationsTitle => 'УВЕДОМЛЕНИЯ';

  @override
  String get settingsNotificationsBody =>
      'Ежедневные напоминания и поддерживающие уведомления';

  @override
  String get settingsDangerTitle => 'ОПАСНАЯ ЗОНА';

  @override
  String get settingsDangerBody =>
      'Твой профиль и вся история будут удалены навсегда, и приложение начнётся заново.';

  @override
  String get settingsResetButton => 'Сбросить мои данные';

  @override
  String get settingsResetDialogTitle => 'Сбросить данные?';

  @override
  String get settingsResetDialogBody =>
      'Твой профиль и вся история (чек-ины, записи о тяге) будут удалены навсегда. Это действие НЕЛЬЗЯ отменить.';

  @override
  String get settingsResetCancel => 'Отмена';

  @override
  String get settingsResetConfirm => 'Да, удалить';

  @override
  String get settingsLanguageTitle => 'ЯЗЫК';

  @override
  String get settingsLanguageSystemDefault => 'Язык системы';

  @override
  String settingsVersion(String version) {
    return 'SmokeFree AI · v$version';
  }

  @override
  String get productCigarette => 'Сигареты';

  @override
  String get productRollYourOwn => 'Самокрутки';

  @override
  String get productVape => 'Электронная сигарета';

  @override
  String get productHookah => 'Кальян';

  @override
  String get productCigar => 'Сигара';

  @override
  String get productSnus => 'Снюс';

  @override
  String get unitPiece => 'шт.';

  @override
  String get unitVape => 'затяжек/мл';

  @override
  String get unitHookah => 'сеансов';

  @override
  String get unitSnus => 'порций';

  @override
  String get unitGeneric => 'единиц';

  @override
  String get dateNow => 'Сейчас';

  @override
  String get dateYesterday => 'Вчера';

  @override
  String get dateWeekAgo => '1 неделю назад';

  @override
  String get dateMonthAgo => '1 месяц назад';

  @override
  String durationDaysHours(String days, String hours) {
    return '$days дн $hours ч';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '$hours ч $minutes мин';
  }

  @override
  String durationMinutes(String minutes) {
    return '$minutes мин';
  }

  @override
  String get durationZeroMinutes => '0 мин';

  @override
  String get timelineHeader => 'ШКАЛА ВОССТАНОВЛЕНИЯ ЗДОРОВЬЯ';

  @override
  String get timelineSubheader => 'Твоё тело восстанавливается';

  @override
  String timelineNowHere(String title) {
    return '$title · ты сейчас здесь';
  }

  @override
  String timelineSource(String source) {
    return 'Источник: $source';
  }

  @override
  String get milestoneMin20Title => '20 минут';

  @override
  String get milestoneMin20Body => 'Пульс и артериальное давление снижаются.';

  @override
  String get milestoneHour8Title => '8 часов';

  @override
  String get milestoneHour8Body =>
      'Уровни угарного газа и кислорода начинают приходить в норму.';

  @override
  String get milestoneHour12Title => '12 часов';

  @override
  String get milestoneHour12Body =>
      'Уровень угарного газа в крови нормализуется.';

  @override
  String get milestoneHour24Title => '24 часа';

  @override
  String get milestoneHour24Body => 'Никотин полностью выводится из крови.';

  @override
  String get milestoneHour48Title => '48 часов';

  @override
  String get milestoneHour48Body => 'Вкус и обоняние начинают улучшаться.';

  @override
  String get milestoneHour72Title => '72 часа';

  @override
  String get milestoneHour72Body => 'Уровень энергии начинает расти.';

  @override
  String get milestoneWeek2Title => '2–12 недель';

  @override
  String get milestoneWeek2Body =>
      'Кровообращение улучшается, объём лёгких увеличивается.';

  @override
  String get milestoneMonth1Title => '1–9 месяцев';

  @override
  String get milestoneMonth1Body => 'Кашель и одышка уменьшаются.';

  @override
  String get milestoneMonth9Title => '9 месяцев';

  @override
  String get milestoneMonth9Body =>
      'Реснички лёгких восстанавливаются, риск инфекций снижается.';

  @override
  String get milestoneYear1Title => '1 год';

  @override
  String get milestoneYear1Body =>
      'Риск ишемической болезни сердца снижается примерно до половины риска курильщика.';

  @override
  String get milestoneYear5Title => '5 лет';

  @override
  String get milestoneYear5Body => 'Риск инсульта снижается.';

  @override
  String get milestoneYear10Title => '10 лет';

  @override
  String get milestoneYear10Body =>
      'Риск рака лёгких снижается примерно до половины риска курильщика.';

  @override
  String get milestoneYear15Title => '15 лет';

  @override
  String get milestoneYear15Body =>
      'Риск ишемической болезни сердца сравнивается с риском некурящего человека.';

  @override
  String get milestoneYear20Title => '20 лет';

  @override
  String get milestoneYear20Body =>
      'Риск рака рта, горла и гортани приближается к риску некурящего человека.';

  @override
  String statRecoveryValue(String percent) {
    return '$percent%';
  }

  @override
  String get settingsNotificationsComingSoon => 'Напоминания скоро появятся';
}
