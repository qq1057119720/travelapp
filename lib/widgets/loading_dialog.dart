import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog{

  static void showDialog(BuildContext c){
    showGeneralDialog(
      context: c,
      barrierLabel: "登录中",
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return  Column(
          children: <Widget>[Container(
            width: ScreenUtil.instance.setWidth(240),
            height:ScreenUtil.instance.setWidth(240),
            margin: EdgeInsets.only(top:ScreenUtil.instance.setHeight(547) ),
            decoration: BoxDecoration(
              color: ColorUtil.color("bb000000"),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: SpinKitCubeGrid(
              itemBuilder: (_, int index) {
                return DecoratedBox(

                  decoration: BoxDecoration(
                    color: index.isEven ? GlobalThemeStyles.instance.getThemeColor():
                    GlobalThemeStyles.instance.getThemeColor(),
                  ),
                );
              },
              size: ScreenUtil.instance.setWidth(160),
            ),
          )],
        );
      },
    );
  }
}