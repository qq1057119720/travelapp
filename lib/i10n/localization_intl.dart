import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

class AppLocalizations implements CupertinoLocalizations {
  Locale locale;

  AppLocalizations(this.locale);

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    println("MessageLookupByLibrary----------------" + localeName);
    return initializeMessages(locale.toString()).then((Object _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations(locale);
    });
  }

  /// 基于Map，根据当前语言的 languageCode： en或zh来获取对应的文案
  static Map<String, BaseLanguage> _localValue = {
    'en': EnLanguage(),
    'zh': ChLanguage()
  };

  /// 返回当前的内容维护类
  BaseLanguage get currentLocalized {
    return _localValue[locale.languageCode];
  }

  ///通过 Localizations.of(context,type) 加载当前的 FZLocalizations
  static AppLocalizations of(BuildContext context) {
    return CupertinoLocalizations.of(context);

    /// 实现CupertinoLocalizations抽象类后，取不到对象，得换成CupertinoLocalizations.of(context);
//    return Localizations.of(context, MoreLocalization);
  }

  @override
  String get selectAllButtonLabel {
    return currentLocalized.selectAllButtonLabel;
  }

  @override
  String get pasteButtonLabel {
    return currentLocalized.pasteButtonLabel;
  }

  @override
  String get copyButtonLabel {
    return currentLocalized.copyButtonLabel;
  }

  @override
  String get cutButtonLabel {
    return currentLocalized.cutButtonLabel;
  }

  @override
  String get todayLabel {
    return "今天";
  }

  static const List<String> _shortWeekdays = <String>[
    '周一',
    '周二',
    '周三',
    '周四',
    '周五',
    '周六',
    '周日',
  ];

  static const List<String> _shortMonths = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static const List<String> _months = <String>[
    '01月',
    '02月',
    '03月',
    '04月',
    '05月',
    '06月',
    '07月',
    '08月',
    '09月',
    '10月',
    '11月',
    '12月',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString() + "年";

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString() + "日";

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => hour.toString() + " 小时";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    return '1 分钟';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return '${_shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.ymd;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get alertDialogLabel => '提示信息';

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => '时';

  @override
  String timerPickerMinuteLabel(int minute) => '分';

  @override
  String timerPickerSecondLabel(int second) => '秒';

  String get tabHome {
    return Intl.message(
      '首页',
      name: 'tabHome',
      desc: '首页',
    );
  }

  String get tabDataManage {
    return Intl.message(
      '数据\n管理',
      name: 'tabDataManage',
      desc: '数据管理',
    );
  }

  String get tabZhuShou {
    return Intl.message(
      '小灵\n助手',
      name: 'tabZhuShou',
      desc: '数据管理',
    );
  }

  String get tabShare {
    return Intl.message(
      '分享\n升级',
      name: 'tabShare',
      desc: '分享升级',
    );
  }

  String get tabOther {
    return Intl.message(
      '其它',
      name: 'tabOther',
      desc: '其它',
    );
  }

  String get appName {
    return Intl.message(
      '灵动数占卜',
      name: 'appName',
      desc: '应用标题',
    );
  }

  String get pinfanzhanbu {
    return Intl.message(
      '频繁占卜',
      name: 'pinfanzhanbu',
      desc: '频繁占卜',
    );
  }

  String get zhanbushijian {
    return Intl.message(
      '占卜时间',
      name: 'zhanbushijian',
      desc: '占卜时间',
    );
  }

  String get homebeizhu {
    return Intl.message(
      '备      注',
      name: 'homebeizhu',
      desc: '备      注',
    );
  }

  String get homefankui {
    return Intl.message(
      '反      馈',
      name: 'homefankui',
      desc: '反      馈',
    );
  }

  String get lijifankui {
    return Intl.message(
      '立即反馈',
      name: 'lijifankui',
      desc: '立即反馈',
    );
  }

  String get xiugai {
    return Intl.message(
      '修改',
      name: 'xiugai',
      desc: '修改',
    );
  }

  String get biaoqianfenxi {
    return Intl.message(
      '标签分析',
      name: 'biaoqianfenxi',
      desc: '标签分析',
    );
  }

  String get riqizhanbufenxi {
    return Intl.message(
      '日期占卜数分析',
      name: 'riqizhanbufenxi',
      desc: '标签分析',
    );
  }

//
  String get riqizhunquefenxi {
    return Intl.message(
      '日期准确率分析',
      name: 'riqizhunquefenxi',
      desc: '日期准确率分析',
    );
  }

//
  String get qiguafangshi {
    return Intl.message(
      '起卦方式分析',
      name: 'qiguafangshi',
      desc: '起卦方式分析',
    );
  }

  String get fankuifenxi {
    return Intl.message(
      '反馈分析',
      name: 'fankuifenxi',
      desc: '反馈分析',
    );
  }

//
  String get pinfanzhanbufenxi {
    return Intl.message(
      '频繁占卜分析',
      name: 'pinfanzhanbufenxi',
      desc: '频繁占卜分析',
    );
  }

//

  String get guanyiwomen {
    return Intl.message(
      '布告栏',
      name: 'guanyiwomen',
      desc: '布告栏',
    );
  }

//
  String get guanggaohezuo {
    return Intl.message(
      '广告合作',
      name: 'guanggaohezuo',
      desc: '广告合作',
    );
  }

//
  String get qitaapp {
    return Intl.message(
      '其它APP',
      name: 'qitaapp',
      desc: '其它APP',
    );
  }

//
  String get lianxiwomen {
    return Intl.message(
      '联系我们',
      name: 'lianxiwomen',
      desc: '联系我们',
    );
  }

//
  String get tuichudenglu {
    return Intl.message(
      '退出登录',
      name: 'tuichudenglu',
      desc: '退出登录',
    );
  }

//  您是尊贵的月费会员
  String get yuefeihjuiyuan {
    return Intl.message(
      '您是尊贵的月费会员',
      name: 'yuefeihjuiyuan',
      desc: '您是尊贵的月费会员',
    );
  }

  String get bannianhuiyuan {
    return Intl.message(
      '您是尊贵的半年会员',
      name: 'bannianhuiyuan',
      desc: '您是尊贵的半年会员',
    );
  }

  String get nianfeihuiyuan {
    return Intl.message(
      '您是尊贵的年费会员',
      name: 'nianfeihuiyuan',
      desc: '您是尊贵的年费会员',
    );
  }

  String get yuongjiuhuiyuan {
    return Intl.message(
      '您是尊贵的永久会员',
      name: 'yuongjiuhuiyuan',
      desc: '您是尊贵的永久会员',
    );
  }

  String get zanwunicheng {
    return Intl.message(
      '暂无昵称',
      name: 'zanwunicheng',
      desc: '暂无昵称',
    );
  }

  String get shangcidenglu {
    return Intl.message(
      '上次登录',
      name: 'shangcidenglu',
      desc: '上次登录',
    );
  }

  String get youxiaoqizhi {
    return Intl.message(
      '有效期至',
      name: 'youxiaoqizhi',
      desc: '有效期至',
    );
  }

  String get kaitongvipjiesuo {
    return Intl.message(
      '开通VIP会员\n即可解锁详细评语！',
      name: 'kaitongvipjiesuo',
      desc: '开通VIP会员\n即可解锁详细评语！',
    );
  }

//
  String get xufei {
    return Intl.message(
      '续费',
      name: 'xufei',
      desc: '续费',
    );
  }

  String get chengweihuiyuan {
    return Intl.message(
      '成为会员',
      name: 'chengweihuiyuan',
      desc: '成为会员',
    );
  }

  String get weodefenxiang {
    return Intl.message(
      '我的分享',
      name: 'weodefenxiang',
      desc: '我的分享',
    );
  }

  String get chenggongyaoqing {
    return Intl.message(
      '成功邀请人数',
      name: 'chenggongyaoqing',
      desc: '成功邀请人数',
    );
  }

  String get keduihuanvipshu {
    return Intl.message(
      '可兑换VIP月数',
      name: 'keduihuanvipshu',
      desc: '可兑换VIP月数',
    );
  }

  String get yiduihuanvipshu {
    return Intl.message(
      '已兑换VIP月数',
      name: 'yiduihuanvipshu',
      desc: '已兑换VIP月数',
    );
  }

  String get duihuan {
    return Intl.message(
      '兑换',
      name: 'duihuan',
      desc: '兑换',
    );
  }

  String get fenxiang {
    return Intl.message(
      '分享',
      name: 'fenxiang',
      desc: '分享',
    );
  }

  String get fenxaingcontent {
    return Intl.message(
      '您可以分享灵动数给您的微信、QQ好友，好友通过您的链接注册，即为邀请成功。每成功邀请5位用户，可兑换一个月VIP会员。',
      name: 'fenxaingcontent',
      desc: '您可以分享灵动数给您的微信、QQ好友，好友通过您的链接注册，即为邀请成功。每成功邀请5位用户，可兑换一个月VIP会员。',
    );
  }

  String get yongjiuquchuguanggao {
    return Intl.message(
      '永久去除广告',
      name: 'yongjiuquchuguanggao',
      desc: '永久去除广告',
    );
  }

  String get quguanggao {
    return Intl.message(
      '去广告',
      name: 'quguanggao',
      desc: '去广告',
    );
  }

  String get fefeijilu {
    return Intl.message(
      '付费记录',
      name: 'fefeijilu',
      desc: '付费记录',
    );
  }

  String get zuijiashijian {
    return Intl.message(
      '经小灵综合分析，您最佳起卦时间',
      name: 'zuijiashijian',
      desc: '经小灵综合分析，您最佳起卦时间',
    );
  }

  String get quxiao {
    return Intl.message(
      '取消',
      name: 'quxiao',
      desc: '取消',
    );
  }

  String get shanchu {
    return Intl.message(
      '删除',
      name: 'shanchu',
      desc: '删除',
    );
  }

  String get shaixuan {
    return Intl.message(
      '筛选',
      name: 'shaixuan',
      desc: '筛选',
    );
  }

  String get tiaoshuju {
    return Intl.message(
      '条数据',
      name: 'tiaoshuju',
      desc: '条数据',
    );
  }

  String get tiaojianshaixuan {
    return Intl.message(
      '条件筛选',
      name: 'tiaojianshaixuan',
      desc: '条件筛选',
    );
  }

  String get biaoqianshaixuan {
    return Intl.message(
      '标签筛选',
      name: 'biaoqianshaixuan',
      desc: '标签筛选',
    );
  }

  String get fankuijieguo {
    return Intl.message(
      '反馈结果',
      name: 'fankuijieguo',
      desc: '反馈结果',
    );
  }

  String get qitashuxing {
    return Intl.message(
      '其它属性',
      name: 'qitashuxing',
      desc: '其它属性',
    );
  }

  String get paixu {
    return Intl.message(
      '排序',
      name: 'paixu',
      desc: '排序',
    );
  }

  String get shijian {
    return Intl.message(
      '时间',
      name: 'shijian',
      desc: '时间',
    );
  }

  String get chongzhitiaojian {
    return Intl.message(
      '重置条件',
      name: 'chongzhitiaojian',
      desc: '重置条件',
    );
  }

  String get queding {
    return Intl.message(
      '确定',
      name: 'queding',
      desc: '确定',
    );
  }

  String get auboutuscontent {
    return Intl.message(
      '        公司简介公司简介公司简介公司简介公司简介。\n卜卦的方法有很多，有梅花易数、六爻预测、奇门遁甲、四柱预测、排盘、三世书等方法，常用的道具有铜钱、龟壳、蓍草等。',
      name: 'auboutuscontent',
      desc: '公司简介',
    );
  }

  String get zhanbuzhunquelv {
    return Intl.message(
      '占卜准确率/次数',
      name: 'zhanbuzhunquelv',
      desc: '占卜准确率/次数',
    );
  }

  String get shangweifankui {
    return Intl.message(
      '尚未反馈',
      name: 'shangweifankui',
      desc: '尚未反馈',
    );
  }

  String get zhunque {
    return Intl.message(
      '准确',
      name: 'zhunque',
      desc: '准确',
    );
  }

  String get buzhidao {
    return Intl.message(
      '不知道',
      name: 'buzhidao',
      desc: '不知道',
    );
  }

  String get buzhunque {
    return Intl.message(
      '不准确',
      name: 'buzhunque',
      desc: '不准确',
    );
  }

  String get zixuan {
    return Intl.message(
      '自选',
      name: 'zixuan',
      desc: '自选',
    );
  }

  String get touzi {
    return Intl.message(
      '骰子',
      name: 'touzi',
      desc: '骰子',
    );
  }

  String get suiji {
    return Intl.message(
      '随机',
      name: 'suiji',
      desc: '随机',
    );
  }

  String get fankuizhanbufenxi {
    return Intl.message(
      '反馈占卜分析',
      name: 'fankuizhanbufenxi',
      desc: '反馈占卜分析',
    );
  }

  String get yifankui {
    return Intl.message(
      '已反馈',
      name: 'yifankui',
      desc: '已反馈',
    );
  }

  String get weifankui {
    return Intl.message(
      '未反馈',
      name: 'weifankui',
      desc: '未反馈',
    );
  }

  String get dian {
    return Intl.message(
      '点',
      name: 'dian',
      desc: '点',
    );
  }

  String get shi {
    return Intl.message(
      '时',
      name: 'shi',
      desc: '时',
    );
  }

  String get nian {
    return Intl.message(
      '年',
      name: 'nian',
      desc: '年',
    );
  }

  String get yue {
    return Intl.message(
      '月',
      name: 'yue',
      desc: '月',
    );
  }

  String get ri {
    return Intl.message(
      '日',
      name: 'ri',
      desc: '日',
    );
  }

  String get ci {
    return Intl.message(
      '次',
      name: 'ci',
      desc: '次',
    );
  }

  String get xiaoshi {
    return Intl.message(
      '小时',
      name: 'xiaoshi',
      desc: '小时',
    );
  }

  String get shichen {
    return Intl.message(
      '时辰',
      name: 'shichen',
      desc: '时辰',
    );
  }

  String get zhanbucishu {
    return Intl.message(
      '占卜次数',
      name: 'zhanbucishu',
      desc: '占卜次数',
    );
  }

  String get zhunquelv {
    return Intl.message(
      '准确率',
      name: 'zhunquelv',
      desc: '准确率',
    );
  }

  String get cishu {
    return Intl.message(
      '次数',
      name: 'cishu',
      desc: '次数',
    );
  }

  String get zhanbuzhunque {
    return Intl.message(
      '占卜准确率',
      name: 'zhanbuzhunque',
      desc: '占卜准确率',
    );
  }

  String get putongzhanbu {
    return Intl.message(
      '普通占卜',
      name: 'putongzhanbu',
      desc: '普通占卜',
    );
  }

  String get pinfan {
    return Intl.message(
      '频繁',
      name: 'pinfan',
      desc: '频繁',
    );
  }

  String get putong {
    return Intl.message(
      '普通',
      name: 'putong',
      desc: '普通',
    );
  }

  String get quanbushijian {
    return Intl.message(
      '全部时间',
      name: 'quanbushijian',
      desc: '全部时间',
    );
  }

  String get changanbaocuntupian {
    return Intl.message(
      '长按保存图片',
      name: 'changanbaocuntupian',
      desc: '长按保存图片',
    );
  }

  String get xinlangweibo {
    return Intl.message(
      '新浪微博',
      name: 'xinlangweibo',
      desc: '新浪微博',
    );
  }

  String get lingdongshu {
    return Intl.message(
      '灵动数',
      name: 'lingdongshu',
      desc: '灵动数',
    );
  }

  String get weixingongzhonghao {
    return Intl.message(
      '微信公众号',
      name: 'weixingongzhonghao',
      desc: '微信公众号',
    );
  }

  String get kefu {
    return Intl.message(
      '客服',
      name: 'kefu',
      desc: '客服',
    );
  }

  String get xiaolingmm {
    return Intl.message(
      '小灵MM',
      name: 'xiaolingmm',
      desc: '小灵MM',
    );
  }

  String get kaishizhanbu {
    return Intl.message(
      '开始占卜',
      name: 'kaishizhanbu',
      desc: '开始占卜',
    );
  }

  String get touzhitouzi {
    return Intl.message(
      '投掷骰子',
      name: 'touzhitouzi',
      desc: '投掷骰子',
    );
  }

  String get qingshurusuijishu {
    return Intl.message(
      '请输入随机数',
      name: 'qingshurusuijishu',
      desc: '请输入随机数',
    );
  }

  String get shengchengdianshu {
    return Intl.message(
      '生成点数',
      name: 'shengchengdianshu',
      desc: '生成点数',
    );
  }

  String get qingshurusuijishu18 {
    return Intl.message(
      '请输入随机数字，最多18位',
      name: 'qingshurusuijishu18',
      desc: '请输入随机数字，最多18位',
    );
  }

  String get toutoushuliang {
    return Intl.message(
      '投骰数量',
      name: 'toutoushuliang',
      desc: '投骰数量',
    );
  }

  String get toutouqu {
    return Intl.message(
      '投骰区',
      name: 'toutouqu',
      desc: '投骰区',
    );
  }

  String get bangzhu {
    return Intl.message(
      '帮助',
      name: 'bangzhu',
      desc: '帮助',
    );
  }

  String get suijishengchengshuzi {
    return Intl.message(
      '随机生成数字',
      name: 'suijishengchengshuzi',
      desc: '随机生成数字',
    );
  }

  String get beizhuchenggong {
    return Intl.message(
      '备注成功',
      name: 'beizhuchenggong',
      desc: '备注成功',
    );
  }

  String get mianfeicishuwan {
    return Intl.message(
      '您的免费次数已经用完',
      name: 'mianfeicishuwan',
      desc: '您的免费次数已经用完',
    );
  }

  String get kaitong {
    return Intl.message(
      '开通',
      name: 'kaitong',
      desc: '开通',
    );
  }

  String get jiesuopingyu {
    return Intl.message(
      '即可解锁详细评语！',
      name: 'jiesuopingyu',
      desc: '即可解锁详细评语！',
    );
  }

  String get mianfeitiyan {
    return Intl.message(
      '免费体验',
      name: 'mianfeitiyan',
      desc: '免费体验',
    );
  }

  String get hintzhanbubeizhu {
    return Intl.message(
      '您可以输入本次卜卦的信息或备注',
      name: 'hintzhanbubeizhu',
      desc: '您可以输入本次卜卦的信息或备注',
    );
  }

  String get qingshurubeizhu {
    return Intl.message(
      '请输入备注',
      name: 'qingshurubeizhu',
      desc: '请输入备注',
    );
  }

  String get baocun {
    return Intl.message(
      '保存',
      name: 'baocun',
      desc: '保存',
    );
  }

  String get qingshuruyanzhengma {
    return Intl.message(
      '请输入验证码',
      name: 'qingshuruyanzhengma',
      desc: '请输入验证码',
    );
  }

  String get qingshuruyouxiang {
    return Intl.message(
      '请输入邮箱',
      name: 'qingshuruyouxiang',
      desc: '请输入邮箱',
    );
  }

  String get youxianggeshibuzhengque {
    return Intl.message(
      '邮箱格式不正确',
      name: 'youxianggeshibuzhengque',
      desc: '邮箱格式不正确',
    );
  }

  String get dengluchenggong {
    return Intl.message(
      '登录成功',
      name: 'dengluchenggong',
      desc: '登录成功',
    );
  }

  String get zhuce {
    return Intl.message(
      '注册',
      name: 'zhuce',
      desc: '注册',
    );
  }

  String get qingshurumima {
    return Intl.message(
      '请输入密码',
      name: 'qingshurumima',
      desc: '请输入密码',
    );
  }

  String get denglu {
    return Intl.message(
      '登录',
      name: 'denglu',
      desc: '登录',
    );
  }

  String get shoujihaodenglu {
    return Intl.message(
      '手机号登录',
      name: 'shoujihaodenglu',
      desc: '手机号登录',
    );
  }

  String get kuaijiedenglu {
    return Intl.message(
      '快捷登录',
      name: 'kuaijiedenglu',
      desc: '快捷登录',
    );
  }

  String get qingshurushoujihaoma {
    return Intl.message(
      '请输入手机号码',
      name: 'qingshurushoujihaoma',
      desc: '请输入手机号码',
    );
  }

  String get shoujihaomageshibudui {
    return Intl.message(
      '手机号码格式不正确',
      name: 'shoujihaomageshibudui',
      desc: '手机号码格式不正确',
    );
  }

  String get fasongchenggong {
    return Intl.message(
      '发送成功',
      name: 'fasongchenggong',
      desc: '发送成功',
    );
  }

  String get chongxinhuoqu {
    return Intl.message(
      '重新获取',
      name: 'chongxinhuoqu',
      desc: '重新获取',
    );
  }

  String get huoquyanzhengma {
    return Intl.message(
      '获取验证码',
      name: 'huoquyanzhengma',
      desc: '获取验证码',
    );
  }

  String get youxiangdenglu {
    return Intl.message(
      '邮箱登录',
      name: 'youxiangdenglu',
      desc: '邮箱登录',
    );
  }

  String get zhifuchenggong {
    return Intl.message(
      '支付成功',
      name: 'zhifuchenggong',
      desc: '支付成功',
    );
  }

  String get zhifuquxiao {
    return Intl.message(
      '支付取消',
      name: 'zhifuquxiao',
      desc: '支付取消',
    );
  }

  String get kaitonghuiyuan {
    return Intl.message(
      '开通会员',
      name: 'kaitonghuiyuan',
      desc: '开通会员',
    );
  }

  String get kaitonghuiyuanjieshao {
    return Intl.message(
      '开通VIP会员，解锁详细评语特权，让结果与答案更清晰明确！',
      name: 'kaitonghuiyuanjieshao',
      desc: '开通VIP会员，解锁详细评语特权，让结果与答案更清晰明确！',
    );
  }

  String get xuanzekaitongshichang {
    return Intl.message(
      '请选择开通时长',
      name: 'xuanzekaitongshichang',
      desc: '请选择开通时长',
    );
  }

  String get yuanjia {
    return Intl.message(
      '原价',
      name: 'yuanjia',
      desc: '原价',
    );
  }

  String get tehuijia {
    return Intl.message(
      '特惠价',
      name: 'tehuijia',
      desc: '特惠价',
    );
  }

  String get zidongxufei {
    return Intl.message(
      '自动续费',
      name: 'zidongxufei',
      desc: '自动续费',
    );
  }

  String get daoqizidong {
    return Intl.message(
      '到期自动续费当前所选套餐',
      name: 'daoqizidong',
      desc: '到期自动续费当前所选套餐',
    );
  }

  String get kaiqi {
    return Intl.message(
      '开启',
      name: 'kaiqi',
      desc: '开启',
    );
  }

  String get guanbi {
    return Intl.message(
      '关闭',
      name: 'guanbi',
      desc: '关闭',
    );
  }

  String get lijikaitong {
    return Intl.message(
      '立即开通',
      name: 'lijikaitong',
      desc: '立即开通',
    );
  }

  String get qingshurunicheng {
    return Intl.message(
      '请输入昵称',
      name: 'qingshurunicheng',
      desc: '请输入昵称',
    );
  }

  String get qingshuruquerenmima {
    return Intl.message(
      '请输入确认密码',
      name: 'qingshuruquerenmima',
      desc: '请输入确认密码',
    );
  }

  String get liangcimimabuyizhi {
    return Intl.message(
      '两次密码不一致',
      name: 'liangcimimabuyizhi',
      desc: '两次密码不一致',
    );
  }

  String get qingxuanzexingbie {
    return Intl.message(
      '请选择性别',
      name: 'qingxuanzexingbie',
      desc: '请选择性别',
    );
  }

  String get zhucechenggong {
    return Intl.message(
      '注册成功',
      name: 'zhucechenggong',
      desc: '注册成功',
    );
  }

  String get xuanzechushengnianyue {
    return Intl.message(
      '选择出生年月',
      name: 'xuanzechushengnianyue',
      desc: '选择出生年月',
    );
  }

  String get shoujihaozhuce {
    return Intl.message(
      '手机号注册',
      name: 'shoujihaozhuce',
      desc: '手机号注册',
    );
  }

  String get youxiangzhuce {
    return Intl.message(
      '邮箱注册',
      name: 'youxiangzhuce',
      desc: '邮箱注册',
    );
  }

  String get zhuceshuoming1 {
    return Intl.message(
      '请填 妥在软件想使用的 “名称或昵称” 与 “出生年” 及 “性别” 才能使用本软件，而为了让占卜感应力与准确度提升，请填上正确资料。名称或昵称为灵动感应必需的个人代号，最多六个字',
      name: 'zhuceshuoming1',
      desc: '注册说明1',
    );
  }

  String get zhuceshuoming2 {
    return Intl.message(
      '注意：名称或昵称一旦确定，无法更改！',
      name: 'zhuceshuoming2',
      desc: '注册说明2',
    );
  }

  String get shurumingchengnicheng {
    return Intl.message(
      '请输入名称或昵称',
      name: 'shurumingchengnicheng',
      desc: '请输入名称或昵称',
    );
  }

  String get lijizhuce {
    return Intl.message(
      '立即注册',
      name: 'lijizhuce',
      desc: '立即注册',
    );
  }

  String get qingshuruzhanbutiaojian {
    return Intl.message(
      '请输入占卜条件',
      name: 'qingshuruzhanbutiaojian',
      desc: '请输入占卜条件',
    );
  }

  String get qigua {
    return Intl.message(
      '起卦',
      name: 'qigua',
      desc: '起卦',
    );
  }

  String get jingongvip {
    return Intl.message(
      '仅供VIP起卦',
      name: 'jingongvip',
      desc: '仅供VIP起卦',
    );
  }

  String get cesuanshuoming {
    return Intl.message(
      '所有测算结果与评语仅供常理及科学之外的参考，不宜沉迷软件之答案来作为是非选择判断，若因此出现纠纷，本公司不负担任何责任。注意：若涉及医学、法律等专业相关问题，请直接寻找相关专业人员咨询与求助！',
      name: 'cesuanshuoming',
      desc: '说明',
    );
  }

  String get sousuo {
    return Intl.message(
      '搜索',
      name: 'sousuo',
      desc: '搜索',
    );
  }

  String get qingshuruguanjianzi {
    return Intl.message(
      '请输入关键字',
      name: 'qingshuruguanjianzi',
      desc: '请输入关键字',
    );
  }

  String get neiyou {
    return Intl.message(
      '内有',
      name: 'neiyou',
      desc: '内有',
    );
  }

  String get zhonggua {
    return Intl.message(
      '种卦',
      name: 'zhonggua',
      desc: '种卦',
    );
  }

  String get pinfantixing {
    return Intl.message(
      '频繁提醒',
      name: 'pinfantixing',
      desc: '频繁提醒',
    );
  }

  String get shangciqigua {
    return Intl.message(
      '上次起卦',
      name: 'shangciqigua',
      desc: '上次起卦',
    );
  }

  String get ninduicileixing {
    return Intl.message(
      '您对此类标签过于频繁卜卦',
      name: 'ninduicileixing',
      desc: '您对此类标签过于频繁卜卦',
    );
  }

  String get xinchengzeling {
    return Intl.message(
      '心诚则灵，建议单一卜卦',
      name: 'xinchengzeling',
      desc: '心诚则灵，建议单一卜卦',
    );
  }

  String get tianneiqigua {
    return Intl.message(
      '天内仅起卦',
      name: 'tianneiqigua',
      desc: '天内仅起卦',
    );
  }

  String get rengyaozhanbu {
    return Intl.message(
      '仍要占卜',
      name: 'rengyaozhanbu',
      desc: '仍要占卜',
    );
  }

  String get tixing {
    return Intl.message(
      '提醒',
      name: 'tixing',
      desc: '提醒',
    );
  }

  String get ninyou {
    return Intl.message(
      '您有',
      name: 'ninyou',
      desc: '您有',
    );
  }

  String get gebuguashangwei {
    return Intl.message(
      '个卜卦尚未反馈，您想要现在去反馈吗',
      name: 'gebuguashangwei',
      desc: '个卜卦尚未反馈，您想要现在去反馈吗',
    );
  }

  String get bushixianzai {
    return Intl.message(
      '不是现在',
      name: 'bushixianzai',
      desc: '不是现在',
    );
  }

  String get qufankui {
    return Intl.message(
      '去反馈',
      name: 'qufankui',
      desc: '去反馈',
    );
  }

  String get kefuyouxiang {
    return Intl.message(
      '客服邮箱',
      name: 'kefuyouxiang',
      desc: '客服邮箱',
    );
  }

  String get kefuyouxiangshuoming {
    return Intl.message(
      '敬爱的使用者您好，若有交易上的问题，请电邮: ',
      name: 'kefuyouxiangshuoming',
      desc: '客服邮箱说明',
    );
  }

  String get kefuyouxiangshuoming2 {
    return Intl.message(
      '\n本公司会在三个工作日内回复您的问题，请随时关注您的邮箱状态，祝阁下使用愉快。',
      name: 'kefuyouxiangshuoming2',
      desc: '客服邮箱说明2',
    );
  }

  String get zhifufangshi {
    return Intl.message(
      '请选择支付方式',
      name: 'zhifufangshi',
      desc: '请选择支付方式',
    );
  }

  String get zhifubao {
    return Intl.message(
      '支付宝',
      name: 'zhifubao',
      desc: '支付宝',
    );
  }

  String get weixin {
    return Intl.message(
      '微信',
      name: 'weixin',
      desc: '微信',
    );
  }

  String get qiguafangshizhanbi {
    return Intl.message(
      '起卦方式占比',
      name: 'qiguafangshizhanbi',
      desc: '起卦方式占比',
    );
  }

  String get pinfanzhanbuzhanbi {
    return Intl.message(
      '频繁占卜占比',
      name: 'pinfanzhanbuzhanbi',
      desc: '频繁占卜占比',
    );
  }

  String get wxbangding {
    return Intl.message(
      '该微信尚未绑定账号\n是否登录账号完成绑定？',
      name: 'wxbangding',
      desc: '该微信尚未绑定账号',
    );
  }

  String get yonghuxukexieyi {
    return Intl.message(
      '1、服务条款的确认和接纳\n'
      '本网站及APP的各项内容和服务的所有权归本公司拥有。用户在接受本服务之前，请务必仔细阅读本条款。用户使用服务，或通过完成注册程序，表示用户接受所有服务条款。\n'
      '2、用户同意：\n'
      '(1) 提供及时、详尽及准确的个人资料。\n'
      '(2) 不断更新注册资料、符合及时、详尽、准确的要求。如果用户提供的资料不准确，本网站有结束服务的权利。本网站及APP将不公开用户的姓名、地址、电子邮箱、帐号和电话号码等信息（请阅隐私保护条款）。'
      '用户在本网站和APP的任何行为必须遵循：\n'
      '(1) 传输资料时必须符合中国有关法规。\n'
      '(2) 使用信息服务不作非法用途和不道德行为。\n'
      '(3) 不干扰或混乱网络服务。\n'
      '(4) 遵守所有使用服务的网络协议、规定、程序和惯例。\n'
      '用户的行为准则是以因特网法规，政策、程序和惯例为根据的。\n'
      '3、服务条款的修改\n'
      '本网站及APP有权在必要时修改条款，将会在页面公布。如果不接受所改动的内容，用户可以主动取消自己的会员资格。如果您不取消自己的会员资格，则视为接受服务条款的变动。\n'
      '4、用户的帐号、密码和安全性\n'
      '一旦成功注册成为会员，您将有一个密码和用户名。\n'
      '用户将对用户名和密码的安全负全部责任。另外，每个用户都要对以其用户名进行的所有活动和事件负全责。您可以随时改变您的密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告本公司。'
      '5、拒绝提供担保\n'
      '用户明确同意使用本公司服务，由用户个人承担风险。\n'
      '本网站及APP不担保服务一定满足用户的要求，也不担保服务不会中断，对服务的及时性、安全性、出错发生都不作担保。\n'
      '用户理解并接受：任何通过服务取得的信息资料的可靠性有用性取决于用户自己的判断，用户自己承担所有风险和责任。\n'
      '6、有限责任\n'
      '本网站及APP对任何由于使用服务引发的直接、间接、偶然及继起的损害不负责任。'
      '这些损害可能来自（包括但不限于）：不正当使用服务，或传送的信息不符合规定等。'
      '7、对用户信息的存储和限制\n'
      '本网站及APP不对用户发布信息的删除或储存失败负责，本公司有判定用户的行为是否符合服务条款的要求和精神的保留权利。'
      '如果用户违背了服务条款的规定，有中断对其提供服务的权利。'
      '8、结束服务\n'
      '本网站及APP可随时根据实际情况中断一项或多项服务，不需对任何个人或第三方负责或知会。'
      '同时用户若反对任何服务条款的建议或对后来的条款修改有异议，或对服务不满，用户可以行使如下权利：'
      '(1) 不再使用本公司的服务。\n'
      '(2) 通知本公司停止对该用户的服务。\n'
      '9、信息内容的所有权'
      '本公司的信息内容包括：文字、软件、声音、相片、录象、图表；以及其它信息，所有这些内容受版权、商标、标签和其它财产所有权法律的保护。'
      '用户只能在授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。'
      '10、隐私保护条款\n'
      '本网站及APP将严格保守用户的个人隐私，承诺未经过您的同意不将您的个人信息任意披露。\n'
      '但在以下情形下，我们将无法再提供您前述保证而披露您的相关信息。这些情形包括但不限于：\n'
      '* 当您在本网站的行为违反的服务条款，或可能损害他人权益或导致他人遭受损害，只要我们相信披露您的个人资料是为了辨识、联络或采取法律行动所必要的行动时。\n'
      '* 法律法规所规定的必须披露或公开的个人信息。\n'
      '* 当司法机关或其它有权机关依法执行公务，要求提供特定个人资料时，我们必须给予必要的配合。\n'
      '11、适用法律上述条款将适用中华人民共和国的法律，所有的争端将诉诸于我司所在地的人民法院。如发生服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持约束力。',
      name: 'yonghuxukexieyi',
      desc: '用户许可协议',
    );
  }
  String get yinsizhengce {
    return Intl.message(
      '保护及尊重用户个人隐私是公司的一项基本政策。我司将严格遵守法律法规的相关规定，采取合理、必要的安全措施，保护用户的个人信息。\n'
      '本政策适用于我司提供的全部产品和服务，在使用我司产品或服务前，请您仔细阅读《隐私政策》的全部内容，了解用户信息的收集范围及使用方式，并根据自身的判断决定是否选择我们提供的服务。若用户不同意本政策内容，将可能导致我司的产品无法正常运行或服务无法正常提供。若用户使用我司产品或服务，将视为同意我司按照本政策收集、使用、分享、披露、储存用户的个人信息。\n'
      '用户在阅读本政策内容后有任何疑问的，可通过我司对外公布的联系方式联系我们，我司将在收到用户反馈后及时进行解答。\n'
      '一、我们收集哪些信息\n'
      '为了实现产品功能及为用户提供优质的服务，我司将根据合法必要原则收集及使用用户信息，我司收集的信息内容如下：\n'
      '1、用户在使用我司提供的测算服务时，为了保存您的分析报告结果，我们需要获取您的手机号码或邮箱地址、微信号，如拒绝提供这些信息会使您无法使用相关特定功能。\n'
   '2、用户在使用产品或服务过程中，我司基于服务提供之需要而主动获取的信息，包括但不限于账号信息、浏览及搜索信息、订阅收藏及下载信息、服务日志信息、设备信息、手机软件信息、日历信息、IP地址、通讯日志、位置信息；\n'
    '【日志信息：当用户使用我司商品或服务时，我司可能会自动收集用户对我司服务的详细使用情况作为有关网络日志保存。例如用户搜索查询收藏内容、IP地址、浏览器的类型、电信运营商、使用的语言、访问日期和时间及用户访问的网页浏览记录等】\n'
    '【设备信息：我司可能会根据用户在app软件安装及使用中授予的具体权限，接收并记录用户所使用的设备相关信息（例如：设备型号、操作系统版本、设备设置、唯一设备标识符等软硬件特征信息等）、设备所在位置相关信息（例如：IP地址、GPS位置以及能够提供相关信息的WLAN接入点、蓝牙和基站传感器信息等）】\n'
    '3、平台不会主动共享或转让您的个人信息至第三方，如存在其他共享或转让您的个人信息情形时，我们会征得您的明示同意，此外我们会对对外提供信息的行为进行风险评估。\n'
    '二、我们如何使用用户信息\n'
    '我们将按照法律规定及与用户间的约定，为以下目的使用用户信息：\n'
    '1、帮助用户完成注册及登陆，向用户提供商品或服务及尽可能满足用户的个性化需求；\n'
    '2、为了更好的检测用户的账户是否存在安全风险，预防网络犯罪，保障用户的合法权益不受侵犯；\n'
    '3、因产品开发、升级及管理需要，在合法合理且必要的范围内进行收集及使用说明：\n'
    '（1）为了满足用户的个性化服务需求，我司可能要求用户提供特定的个人敏感信息（包括但不限于姓名），若用户拒绝提供的，将可能导致部分功能无法正常使用。\n'
    '（2）为了向用户提供优质的服务，我司需获取用户开放相关设备权限，包括但不限于通相机、位置定位、手机存储等，若用户关闭相应权限，将可能导致软件部分或全部功能无法正常使用。\n'
    '（3）用户停止使用我司提供的产品或服务的，在符合协议约定及法律法规相关规定的情况下，用户可通过我司对外公布的联系方式申请注销已注册之账号并尽快删除用户的个人信息。\n'
    '三、用户如何管理自己的信息\n'
    '1、用户可以在使用产品或服务的过程中，可通过特定页面或方式查询、修改和删除所提供的注册信息和其他个人信息。\n'
    '2、用户在使用产品或服务过程中，我司将向用户推送、提供用户可能感兴趣的各类通知、广告、公告等内容。若用户不愿意接收相关消息的，可通过手机、软件设置或我司的相关提示以及人工服务，退订或关闭消息推送。\n'
    '3、若用户在信息管理过程中存在任何疑问的，可通过我司对外公布的联系方式与我司联系，我司将积极协助用户对自己的信息进行管理。\n'
    '四、信息的分享、转让及披露\n'
    '1、出于合法、必要、特定的目的，我司将可能因服务提供或履行我司与用户达成的其他协议等需要，向合作伙伴及其他第三方分享用户的信息，以实现我司产品的部分功能。与此同时，我司也将严格要求接触或获取到用户信息的第三方承担保密义务。\n'
    '2、根据我司业务开展的实际情况，我司可能进行合并、收购、资产转让或与其他第三方开展类似交易及合作，而用户的信息也可能作为上述交易的一部分进行转移。但我司将严格要求新的主体继续受本政策约束，或者要求新主体与用户重新约定隐私政策相关内容。\n'
    '3、我司不会对外公开或向其他与服务提供无关的第三方披露用户信息，但下列情况除外：\n'
    '（1）已获得用户的相应授权；\n'
    '（2）遵守法律法规的相关规定；\n'
    '（3）根据司法机关的相关要求，或者按照生效的判决、裁定等法律文书内容或其他法律程序的规定；\n'
    '（4）根据行政机关的要求；\n'
      '（5）为维护社会公共利益及国家安全；\n'
      '（6）用户已主动向社会公众公开个人信息；\n'
      '（7）相关用户信息是从合法公开披露的信息中收集的；\n'
      '（8）为保障用户权益、维护我司合法权益及其他合理且必要的目的。\n'
      '五、用户信息的存储与保护\n'
      '1、我司将采用必要的技术手段对用户的信息进行保护，并建立严格的制度规范限制用户信息的访问权限，尽最大努力防止用户信息遭受未经授权的访问、使用或修改。但基于网络环境的复杂性和技术手段的局限性，我司无法保证用户信息的百分之百安全。\n'
      '2、请您在使用我司服务过程中妥善保管您的账号、密码及其他身份信息。服务提供过程中，我司将通过账号、密码及其他身份信息对用户进行身份识别，用户也应对账号下的行为承担全部责任。因此，我司建议用户不定期对个人账号的密码进行修改，若用户发现自身账号、密码或其他身份信息泄漏导致个人账号可能或已经被他人使用时，请及时与我司联系，我司将及时采取相应措施避免用户损失的进一步扩大。\n'
      '六、关于Cookies的使用\n'
      '1、为保证产品的正常运营，且为用户提供更良好的产品体验并向用户推送感兴趣的内容，我司将可能在用户的计算机或移动设备上储存Cookies小数据文件。\n'
      '2、用户可以通过浏览器或相关途径自主选择或管理Cookies。\n'
      '七、未成年人保护\n'
      '我们非常重视未成年人信息的保护，根据相关法律法规规定，若用户是18周岁以下的未成年人，在使用我司服务前，应事先取得您的家长或法定监护人的同意。任何人发现存在未成年人违反该约定使用我司提供的产品或服务的，可通过我司对外公布的联系方式与我司联系，我司将及时进行处理，以保障未成年人的合法权益。\n'
      '八、其他\n'
      '为了给用户提供更优质的服务，我司可能会根据产品或服务更新、升级的实际情况及法律法规的相关要求修改本政策的条款，并且可能需要收集、使用新的个人信息或变更个人信息使用目的或方式。届时，我司将通过新隐私政策、弹窗、通知、公告等各种进行提示或说明。若用户不同意变更或修改后的内容的，可以选择停止使用我司提供的产品或服务；如用户在协议变更后仍继续使用我司产品或服务的，即视为用户已充分阅读、理解并同意受变更后政策的约束。\n',
      name: 'yinsizhengce',
      desc: '隐私政策',
    );
  }
  String get yinsizhengcetitle {
    return Intl.message(
      '隐私政策',
      name: 'yinsizhengcetitle',
      desc: '隐私政策',
    );
  }

  String get yonghuxukexieyititle {
    return Intl.message(
      '用户许可协议',
      name: 'yonghuxukexieyititle',
      desc: '用户许可协议',
    );
  }
  String get gouxuanjintongyi {
    return Intl.message(
      '勾选即同意',
      name: 'gouxuanjintongyi',
      desc: '勾选即同意',
    );
  }
  String get fuwuxieyiyinsizhengce {
    return Intl.message(
      '用户许可协议和隐私政策',
      name: 'fuwuxieyiyinsizhengce',
      desc: '服务协议和隐私政策',
    );
  }

  String get zanbushiyong {
    return Intl.message(
      '暂不使用',
      name: 'zanbushiyong',
      desc: '暂不使用',
    );
  }

  String get tongyi {
    return Intl.message(
      '同意',
      name: 'tongyi',
      desc: '同意',
    );
  }

  String get xieyizhengceneirong1 {
    return Intl.message(
      '请你务必审慎阅读、充分理解“用户许可协议”和“隐私政策”各条款，包括但不限于:为了向你内容分享等服务,我们需要收集你的设备信息、操作日志等个人信息。你可阅读',
      name: 'xieyizhengceneirong1',
      desc: '协议内容',
    );
  }

  String get xieyizhengceneirong2 {
    return Intl.message(
      '了解详细信息。如你同意，请点击"同意"开始接受我们的服务。',
      name: 'xieyizhengceneirong2',
      desc: '协议内容',
    );
  }
  String get weixinhaoyou {
    return Intl.message(
      '微信好友',
      name: 'weixinhaoyou',
      desc: '微信好友',
    );
  }
  String get pengyouquan {
    return Intl.message(
      '朋友圈',
      name: 'pengyouquan',
      desc: '朋友圈',
    );
  }
  String get yaoqingma {
    return Intl.message(
      '请输入邀请码（可不填）',
      name: 'yaoqingma',
      desc: '请输入邀请码',
    );
  }
//                             "

}

/// 这个抽象类和它的实现类可以拉出去新建类
/// 中文和英语 语言内容维护
abstract class BaseLanguage {
  String name;
  String selectAllButtonLabel;
  String pasteButtonLabel;
  String copyButtonLabel;
  String cutButtonLabel;
}

class EnLanguage implements BaseLanguage {
  @override
  String name = "This is English";
  @override
  String selectAllButtonLabel = "全选";
  @override
  String pasteButtonLabel = "粘贴";
  @override
  String copyButtonLabel = "复制";
  @override
  String cutButtonLabel = "剪切";
}

class ChLanguage implements BaseLanguage {
  @override
  String name = "这是中文";
  @override
  String selectAllButtonLabel = "全选";
  @override
  String pasteButtonLabel = "粘贴";
  @override
  String copyButtonLabel = "复制";
  @override
  String cutButtonLabel = "剪切";
}
