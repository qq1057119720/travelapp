import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';

///Toast工具类
class ToastTools {
//  final DEBUG=true;
  ///默认模式下的toast
  static void showToast(String msg,{Toast toastLength=Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: UnifiedThemeStyles.HALF_TRANSPARENT,
        textColor: UnifiedThemeStyles.WHITE,
        fontSize: ScreenUtil.instance.setSp(28));
  }

  ///自定义toast
  static void showToasts(msg, toastLength, gravity, timeInSecForIos,
      backgroundColor, textColor, fontSize) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: gravity,
        timeInSecForIos: timeInSecForIos,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }

  ///配置默认snackbar.
  static SnackBar showSnackBar(Widget widget,
      {Duration duration = const Duration(milliseconds: 1000),
      Color backgroundColor}) {
    return SnackBar(
      backgroundColor: backgroundColor != null
          ? backgroundColor
          : UnifiedThemeStyles.themeColor,
      content: widget,
      duration: duration,
    );
  }
}
