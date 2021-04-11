import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

////全局资源样式配置
class UnifiedThemeStyles {
  ///可选择的主题色列表
  static const List<Color> themeColors = <Color>[
    _VIOLET,
    MIDDLE_VIOLET,
    GREEN,
    READ,
    ORANGE,
    VIOLET_THIN,
    YELLOW,
    BLACK,
    BLUE,
  ];

  ///主题色
  static Color themeColor = _VIOLET;
  static Locale themeLocale=Locale('zh', 'CN');
  ///title默认背景色
  static Color scaffoldAppBarColor = _VIOLET;
  static Color scaffoldAppBarWidgetColor = WHITE;

  ///scaffold默认背景色
  static Color scaffoldBackgroundColor = WHITE;

  ///背景灰
  static Color backGrayColor = BAC_GRAY;

  ///字体灰
  static Color fondGrayColor = FONT_GRAY;

  ///黑体
  static Color fondBlackColor = BLACK;

  ///浅黑
  static Color fondLinkBlackColor = colorFromValue(0xFF333333);

  ///图片占位颜色
  static Color defultImgPlaceholder = PLACEHOLDER_GRAY;

  ///图片加载失败颜色
  static Color defultImgError = PLACEHOLDER_GRAY;

  ///常用颜色
  static const Color _VIOLET = const Color(0xFF4A90E2);
  static const Color MIDDLE_VIOLET = const Color(0xFF431CA7);
  static const Color LIGHT_VIOLET = const Color(0xE5CEED);
  static const Color GREEN = const Color(0xFF11BB0D);
  static const Color READ = const Color(0xFFDE0A0A);
  static const Color ORANGE = const Color(0xFFF9820E);
  static const Color VIOLET_THIN = const Color(0xFFE2D0EC);
  static const Color YELLOW = const Color(0xFFFFEB8C);
  static const Color BLACK = const Color(0xFF000000);
  static const Color BLUE = const Color(0xFF256CEC);
  static const Color BLUE_THIN = const Color(0xFF1B96EB);
  static const Color WHITE = const Color(0xFFFFFFFF);

  static const Color LINE_COLOR = const Color(0xFFEEEEEE);
  static const Color AUTH_GREEN = const Color(0xFF08AB1A);
  static const Color AUTH_ERROR = const Color(0xFFF95450);

  ///透明
  static const Color TRANSPARENT = const Color(0x00000000);
  ///半透明
  static const Color HALF_TRANSPARENT=const Color(0x90000000);
  static const Color BAC_GRAY = const Color(0xFFEBEBEB);
  static const Color FONT_GRAY = const Color(0xFF999999);
  static const Color PLACEHOLDER_GRAY = const Color(0x99999999);
  static const Color PAY_QR_CODE_BACK = const Color(0x4D1B96EB);
  static const Color SCAN_QR_CODE_BACK = const Color(0x4D999999);
  static const Color BASE_FONT_COLOR = const Color(0xFF333333);
  static const Color BASE_YELLOW_COLOR = Color(0xFFFFCC00);
  static const Color SCAN_QR_CODE_BACK12 = Colors.transparent;
  static const Color KEYBOARD_BACK = const Color(0xFFc0c0c0);

  ///特大号
  static double especiallyBigFontSize = ScreenUtil().setSp(46.0);

  ///大号
  static double bigFontSize = ScreenUtil().setSp(40.0);

  ///标题字号
  static double titleFontSize = ScreenUtil().setSp(36.0);

  ///普通字号
  static double normalFontSize = ScreenUtil().setSp(28.0);

  ///小字号
  static double smallFontSize = ScreenUtil().setSp(24.0);

  ///小号x
  static double smallxFontSize = ScreenUtil().setSp(20.0);

  ///小号xx
  static double smallxxFontSize = ScreenUtil().setSp(16.0);

  ///提示红点字体大小
  static double dotFontSize = ScreenUtil().setSp(15.0);

  ///AppbarTitle大小
  static const double APP_BAR_TITLE_SIZE = 20;

  ///自定义
  static Color colorFromValue(int value) {
    return Color(value);
  }

  static double fontFromPx(double px) {
    return ScreenUtil().setSp(px);
  }

  static double widthFromPx(double px) {
    return ScreenUtil().setWidth(px);
  }

  static double heightFromPx(double px) {
    return ScreenUtil().setHeight(px);
  }

  ///设置状态栏文字颜色，ture 代表状态栏文字颜色是白色，false 表示黑色
  static void setStatusBarWhiteForeground(bool useWhiteForeground) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground);
  }

  ///设置状态栏文字颜色以及背景颜色
  static void changeStatusColor(Color color, bool useWhiteForeground) async {
    try {
      await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground);
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(useWhiteForeground);
    } on PlatformException catch (e) {}
  }

  ///资金减少,增加的颜色值
  ///now:绿增红减
  ///p=>true:增加
  static Color getTurnInAndTurnOutColor(bool isOutIn) => isOutIn ? GREEN : READ;


}
