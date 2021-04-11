import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(SplashState state, Dispatch dispatch, ViewService viewService) {
  ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)
    ..init(viewService.context);
  return Scaffold(
    backgroundColor: ColorUtil.color("fbfbfb"),
    body: Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            color: ColorUtil.color("fbfbfb"),
            alignment: Alignment.center,
            child: new GestureDetector(
              onTap: () {}, //设置页面点击事件
//              child: _getLoading(),
              child: Image.asset("assets/quickin_shouping.png",fit: BoxFit.cover,width: MediaQuery.of(viewService.context).size.width,height: MediaQuery.of(viewService.context).size.height,),//此处fit: BoxFit.cover用于拉伸图片,使图片铺满全屏
            ),
          ),
        )
      ],
    ),
  );
}
