// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class L10nZh extends L10n {
  L10nZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'SmokeFree AI';

  @override
  String get dashboardTitle => '你的进度';

  @override
  String get counterSmokeFree => '戒烟时长';

  @override
  String get counterMoneySaved => '省下的钱';

  @override
  String get counterUnitsAvoided => '未吸的香烟';

  @override
  String get sosButton => '我想抽烟';

  @override
  String get disclaimerMedical => '本应用仅用于提供信息和激励，不能替代医疗建议、诊断或治疗。';

  @override
  String get commonSave => '保存';

  @override
  String get commonCancel => '取消';

  @override
  String get commonFinish => '完成';

  @override
  String get commonNext => '下一步';

  @override
  String get navSummary => '概览';

  @override
  String get navHealth => '健康';

  @override
  String get navSos => '求助';

  @override
  String get navSettings => '设置';

  @override
  String get heroSmokeFreeLabel => '戒烟中';

  @override
  String get heroDaysUnit => '天';

  @override
  String heroMilestonesProgress(String unlocked, String total) {
    return '$unlocked / $total 个健康里程碑';
  }

  @override
  String get statMoneySavedLabel => '省下的钱';

  @override
  String get statMoneySavedSub => '每天都在增加';

  @override
  String get statUnitsAvoidedLabel => '已避免';

  @override
  String get statUnitsAvoidedSub => '支香烟';

  @override
  String get statLifeRegainedLabel => '找回的寿命';

  @override
  String get statLifeRegainedSub => '估算 · Addiction 2025';

  @override
  String get statRecoveryLabel => '恢复进度';

  @override
  String statRecoverySub(String unlocked, String total) {
    return '$unlocked / $total 个里程碑';
  }

  @override
  String get pendingSourceVerifying => '数据来源核实中';

  @override
  String get pendingSourceHiddenPanel => '面板已隐藏';

  @override
  String get badgesTitle => '徽章';

  @override
  String badgesUnlockedCount(String count, String total) {
    return '已解锁 $count / $total';
  }

  @override
  String get badgeDay7 => '7 天';

  @override
  String get badgeDay30 => '30 天';

  @override
  String get badgeDay90 => '90 天';

  @override
  String get badgeYear1 => '1 年';

  @override
  String get checkinTitle => '你今天感觉怎么样？';

  @override
  String checkinBody(String days) {
    return '今天是第 $days 天——你熬过的每一天，都在帮助身体多恢复一点。';
  }

  @override
  String get checkinGood => '我很好';

  @override
  String get checkinStruggling => '有点难熬';

  @override
  String get checkinSnackGood => '很高兴听到这个。继续加油。';

  @override
  String get checkinAnsweredGood => '你今天选了“我很好”——已记录。';

  @override
  String get checkinAnsweredStruggling => '你今天选了“有点难熬”——SOS 就在旁边。';

  @override
  String get milestoneAllUnlocked => '你已解锁全部健康里程碑。';

  @override
  String get milestoneNextLabel => '下一个里程碑';

  @override
  String milestoneOpensIn(String time, String source) {
    return '将在 $time 后解锁 · 来源：$source';
  }

  @override
  String get counterfactualTitle => '如果你没有戒烟';

  @override
  String counterfactualUnits(String units) {
    return '$units 支香烟';
  }

  @override
  String counterfactualMoneyOnly(String money) {
    return '你将会烧掉 $money。';
  }

  @override
  String counterfactualMoneyAndLife(String money, String life) {
    return '你将会烧掉 $money，并损失 $life 的寿命。';
  }

  @override
  String get trialTitle => '解锁全部功能';

  @override
  String get trialSubtitle => '无限次求助、完整健康数据和全部徽章';

  @override
  String get trialCta => '免费试用\n3 天';

  @override
  String get paywallTitle => '高级版';

  @override
  String get paywallComingSoonTitle => '高级版即将上线';

  @override
  String get paywallComingSoonBody => '商店端的支付配置尚未完成。准备就绪后，此页面会自动切换为购买选项。';

  @override
  String get paywallLoadError => '无法加载价格，请检查网络连接。';

  @override
  String get paywallNoPackages => '目前没有可购买的套餐。';

  @override
  String get paywallRestore => '恢复购买';

  @override
  String get paywallRestoreSuccess => '你的购买已恢复。';

  @override
  String get paywallRestoreNone => '未找到可恢复的有效购买记录。';

  @override
  String get paywallRestoreFailed => '恢复失败。';

  @override
  String get paywallFeaturesTitle => '解锁全部功能';

  @override
  String get paywallFeatureSos => '无限次求助与 AI 教练对话';

  @override
  String get paywallFeatureTimeline => '完整的健康恢复时间线';

  @override
  String get paywallFeatureBadges => '全部徽章与里程碑';

  @override
  String get paywallFeatureAdFree => '无广告体验';

  @override
  String get paywallThanks => '谢谢！你现在是高级版用户了。';

  @override
  String get paywallPurchaseFailed => '购买未能完成。';

  @override
  String get sosHeader => '此刻很难熬';

  @override
  String get sosSubtitle => '烟瘾通常持续约 3 分钟。\n我们一起挺过去。';

  @override
  String get sosBreatheButton => '深呼吸';

  @override
  String get sosActionBreathing => '4-7-8\n呼吸练习';

  @override
  String get sosActionCoach => '和 AI 教练\n聊聊';

  @override
  String get sosActionCraving => '记录\n烟瘾';

  @override
  String get sosActionDistract => '转移\n注意力';

  @override
  String sosDontWaste(String days) {
    return '别浪费这 $days 天';
  }

  @override
  String sosRelapseWarning(String units) {
    return '现在抽烟不会清零你的连续天数——只会被标记为一次失误。但你已经付出了相当于 $units 支烟的努力。';
  }

  @override
  String get cravingTitle => '记录烟瘾';

  @override
  String cravingIntensity(String value) {
    return '强度：$value';
  }

  @override
  String get cravingCueCoffee => '咖啡';

  @override
  String get cravingCueStress => '压力';

  @override
  String get cravingCueAfterMeal => '饭后';

  @override
  String get cravingCueSocial => '社交场合';

  @override
  String get cravingCueOther => '其他';

  @override
  String get cravingSave => '保存';

  @override
  String get cravingSaved => '已保存。这种感觉也会过去的。';

  @override
  String get breathingTitle => '4-7-8 呼吸练习';

  @override
  String breathingRound(String cycle) {
    return '第 $cycle 轮';
  }

  @override
  String get breathingInhaleLabel => '吸气';

  @override
  String get breathingInhaleHint => '用鼻子缓慢吸气。';

  @override
  String get breathingHoldLabel => '屏息';

  @override
  String get breathingHoldHint => '屏住呼吸，放松肩膀。';

  @override
  String get breathingExhaleLabel => '呼气';

  @override
  String get breathingExhaleHint => '用嘴巴缓慢呼气。';

  @override
  String get breathingFinish => '完成';

  @override
  String get distractionTitle => '转移注意力';

  @override
  String distractionStep(String index, String total) {
    return '$index / $total';
  }

  @override
  String get distractionInstructions => '环顾四周，依次数出来。不用着急，每一项花几秒钟就好。';

  @override
  String get distractionFinish => '完成';

  @override
  String get distractionNext => '下一步';

  @override
  String distractionStep1(String count) {
    return '说出 $count 样你能看见的东西';
  }

  @override
  String distractionStep2(String count) {
    return '说出 $count 样你能触摸到的东西';
  }

  @override
  String distractionStep3(String count) {
    return '说出 $count 种你能听到的声音';
  }

  @override
  String distractionStep4(String count) {
    return '说出 $count 种你能闻到的气味';
  }

  @override
  String distractionStep5(String count) {
    return '说出 $count 种你能尝到的味道';
  }

  @override
  String get aiCoachTitle => 'AI 教练';

  @override
  String get aiCoachComingSoonTitle => 'AI 教练即将上线';

  @override
  String get aiCoachComingSoonBody => '此功能的服务器端配置尚未完成。准备就绪后，此页面会自动切换为聊天界面。';

  @override
  String get aiCoachEmptyState => '你好，我是你的 AI 教练。告诉我你的感受吧，我在这里陪着你。';

  @override
  String aiCoachCallNow(String number) {
    return '立即拨打：$number';
  }

  @override
  String get aiCoachNotAlone => '你并不孤单。';

  @override
  String get aiCoachSendError => '消息发送失败。要检查一下网络连接再试一次吗？';

  @override
  String get aiCoachInputHint => '输入内容...';

  @override
  String get onboardingWelcome => '欢迎使用 SmokeFree AI';

  @override
  String get onboardingIntro => '我们需要一些信息，才能准确计算你的计数器和统计数据。你随时可以在设置中修改这些信息。';

  @override
  String get sectionProduct => '你之前吸的是什么？';

  @override
  String get sectionProductSettings => '你现在吸的是什么？';

  @override
  String get sectionDaily => '每日消耗量';

  @override
  String get sectionPrice => '每包价格';

  @override
  String get sectionQuitMoment => '戒烟时刻';

  @override
  String perDayLabel(String unit) {
    return '每天吸多少$unit';
  }

  @override
  String perPackLabel(String unit) {
    return '每包多少$unit';
  }

  @override
  String get priceLabel => '价格';

  @override
  String get onboardingStart => '开始';

  @override
  String get errorSelectProduct => '请选择你之前吸的产品类型。';

  @override
  String get errorDailyInvalid => '每日消耗量必须是有效数字。';

  @override
  String get errorPerPackInvalid => '每包数量必须是有效数字。';

  @override
  String get errorPriceInvalid => '价格必须是有效数字。';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsSubtitle => '更新你的资料、管理通知，或重置你的数据。';

  @override
  String get settingsSave => '保存';

  @override
  String get settingsSaved => '你的信息已保存。';

  @override
  String get settingsNotificationsTitle => '通知';

  @override
  String get settingsNotificationsBody => '每日提醒和支持类通知';

  @override
  String get settingsDangerTitle => '危险区域';

  @override
  String get settingsDangerBody => '你的个人资料和全部历史记录将被永久删除，应用将重新开始。';

  @override
  String get settingsResetButton => '重置我的数据';

  @override
  String get settingsResetDialogTitle => '要重置你的数据吗？';

  @override
  String get settingsResetDialogBody => '你的个人资料和全部历史记录（打卡、烟瘾记录）将被永久删除。此操作无法撤销。';

  @override
  String get settingsResetCancel => '取消';

  @override
  String get settingsResetConfirm => '是的，删除';

  @override
  String get settingsLanguageTitle => '语言';

  @override
  String get settingsLanguageSystemDefault => '系统语言';

  @override
  String settingsVersion(String version) {
    return 'SmokeFree AI · v$version';
  }

  @override
  String get productCigarette => '香烟';

  @override
  String get productRollYourOwn => '手卷烟';

  @override
  String get productVape => '电子烟';

  @override
  String get productHookah => '水烟';

  @override
  String get productCigar => '雪茄';

  @override
  String get productSnus => '口含烟';

  @override
  String get unitPiece => '支';

  @override
  String get unitVape => '口/毫升';

  @override
  String get unitHookah => '次';

  @override
  String get unitSnus => '袋';

  @override
  String get unitGeneric => '单位';

  @override
  String get dateNow => '现在';

  @override
  String get dateYesterday => '昨天';

  @override
  String get dateWeekAgo => '1 周前';

  @override
  String get dateMonthAgo => '1 个月前';

  @override
  String durationDaysHours(String days, String hours) {
    return '$days 天 $hours 小时';
  }

  @override
  String durationHoursMinutes(String hours, String minutes) {
    return '$hours 小时 $minutes 分钟';
  }

  @override
  String durationMinutes(String minutes) {
    return '$minutes 分钟';
  }

  @override
  String get durationZeroMinutes => '0 分钟';

  @override
  String get timelineHeader => '健康恢复时间线';

  @override
  String get timelineSubheader => '你的身体正在自我修复';

  @override
  String timelineNowHere(String title) {
    return '$title · 你现在在这里';
  }

  @override
  String timelineSource(String source) {
    return '来源：$source';
  }

  @override
  String get milestoneMin20Title => '20 分钟';

  @override
  String get milestoneMin20Body => '心率和血压下降。';

  @override
  String get milestoneHour8Title => '8 小时';

  @override
  String get milestoneHour8Body => '一氧化碳和血氧水平开始恢复正常。';

  @override
  String get milestoneHour12Title => '12 小时';

  @override
  String get milestoneHour12Body => '血液中的一氧化碳恢复正常。';

  @override
  String get milestoneHour24Title => '24 小时';

  @override
  String get milestoneHour24Body => '血液中的尼古丁被完全清除。';

  @override
  String get milestoneHour48Title => '48 小时';

  @override
  String get milestoneHour48Body => '味觉和嗅觉开始改善。';

  @override
  String get milestoneHour72Title => '72 小时';

  @override
  String get milestoneHour72Body => '精力水平开始上升。';

  @override
  String get milestoneWeek2Title => '2–12 周';

  @override
  String get milestoneWeek2Body => '血液循环改善，肺活量增加。';

  @override
  String get milestoneMonth1Title => '1–9 个月';

  @override
  String get milestoneMonth1Body => '咳嗽和气短症状减轻。';

  @override
  String get milestoneMonth9Title => '9 个月';

  @override
  String get milestoneMonth9Body => '肺部纤毛恢复，感染风险降低。';

  @override
  String get milestoneYear1Title => '1 年';

  @override
  String get milestoneYear1Body => '冠心病风险降至吸烟者的约一半。';

  @override
  String get milestoneYear5Title => '5 年';

  @override
  String get milestoneYear5Body => '中风风险降低。';

  @override
  String get milestoneYear10Title => '10 年';

  @override
  String get milestoneYear10Body => '肺癌风险降至吸烟者的约一半。';

  @override
  String get milestoneYear15Title => '15 年';

  @override
  String get milestoneYear15Body => '冠心病风险与不吸烟者相当。';

  @override
  String get milestoneYear20Title => '20 年';

  @override
  String get milestoneYear20Body => '口腔、咽喉和喉部癌症的风险接近不吸烟者水平。';

  @override
  String statRecoveryValue(String percent) {
    return '$percent%';
  }

  @override
  String get settingsNotificationsComingSoon => '提醒功能即将上线';
}
