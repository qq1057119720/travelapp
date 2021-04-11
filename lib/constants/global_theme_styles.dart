import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class GlobalThemeStyles {

  static int nowTheme=0;

  ///默认语言
  static Locale themeLocale = Locale('zh', 'CN');
  ///主题色
  static const List<Color> themeColors = <Color>[
    THEME_COLOR01,
  ];

  //基本文字颜色
  static const List<Color> baseTitleColors = <Color>[
    COLOR_TITLE01,
  ];
  ///说明文字颜色
  static const List<Color> explainColors = <Color>[
    COLOR_EXPLAIN01,
  ];
  static const List<Color> homeBgColors = <Color>[
    COLOR_HOME_BG01,
  ];

  ///内容颜色

  ///背景颜色
  static const List<Color> backGroundColor = <Color>[];

  ///主题色
  static const Color THEME_COLOR01 = const Color(0xFF4A90E2);

  ///常用颜色
  static const Color COLOR_TITLE01 = const Color(0xFF333333);

  ///浅灰色
  static const Color COLOR_EXPLAIN01 = const Color(0xFF999999);
  ///首页背景色
  static const Color COLOR_HOME_BG01= const Color(0xFFF5F5F5);



  static const Color _VIOLET = const Color(0xFF68129A);
  static const Color MIDDLE_VIOLET = const Color(0xFF431CA7);
  static const Color LIGHT_VIOLET = const Color(0xE5CEED);
  static const Color GREEN = const Color(0xFF11BB0D);
  static const Color READ = const Color(0xFFDE0A0A);
  static const Color ORANGE = const Color(0xFFF9820E);
  static const Color VIOLET_THIN = const Color(0xFFE2D0EC);
  static const Color YELLOW = const Color(0xFFFFEB8C);
  static const Color BLACK = const Color(0xFF000000);
  static const Color WHITE = const Color(0xFFFFFFFF);
  static const Color BLUE = const Color(0xFF256CEC);
  static const Color BLUE_THIN = const Color(0xFF1B96EB);
  ///透明
  static const Color TRANSPARENT = const Color(0x00000000);
  ///半透明
  static const Color HALF_TRANSPARENT=const Color(0x90000000);


  static GlobalThemeStyles _instance;
  static GlobalThemeStyles get instance => _getInstance();
  factory GlobalThemeStyles() => _getInstance();
  GlobalThemeStyles._internal();
  static GlobalThemeStyles _getInstance() {
    if (_instance == null) {
      _instance = new GlobalThemeStyles._internal();
    }
    return _instance;
  }

  ///获得主题颜色
  Color getThemeColor(){
    return themeColors[nowTheme];
  }
  ///获得基本文字颜色
  Color getMainTitleColor(){
    return baseTitleColors[nowTheme];
  }

  Color getExplainTitleColor(){
    return explainColors[nowTheme];
  }
  Color getHomeBgColor(){
    return homeBgColors[nowTheme];
  }

   double widthFromPx(double px) {
    return ScreenUtil().setWidth(px);
  }

   double heightFromPx(double px) {
    return ScreenUtil().setHeight(px);
  }

  ///设置状态栏文字颜色，ture 代表状态栏文字颜色是白色，false 表示黑色
   void setStatusBarWhiteForeground(bool useWhiteForeground) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground);
  }

  ///设置状态栏文字颜色以及背景颜色
   void changeStatusColor(Color color, bool useWhiteForeground) async {
    try {
      await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(useWhiteForeground);
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(useWhiteForeground);
    } on PlatformException catch (e) {}
  }
}
