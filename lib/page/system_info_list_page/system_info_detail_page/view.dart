import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(SystemInfoDetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: ColorUtil.color("ffffff"),
    body: SafeArea(
      top: false,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[

          CustomAppBarWidget(
            state.model.infoname,
                (){
              BaseTools.closePage(viewService.context);
            },
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 20),
              child: Text(
                state.model.infocontent,
                style: TextStyle(
                  fontSize: 14,color: GlobalThemeStyles.instance.getMainTitleColor()
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
