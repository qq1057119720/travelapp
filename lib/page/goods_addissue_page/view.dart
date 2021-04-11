import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_right_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GoodsAddissueState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: SafeArea(
      top: false,
      child: Container(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            CustomAppBarRightWidget("提问",
                    () {
                  BaseTools.closePage(viewService.context);
                },rightWidget:  GestureDetector(
                  onTap: (){
                    dispatch(GoodsAddissueActionCreator.onAction());
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 60,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "提交",style: TextStyle(fontSize: 14,color:
                    GlobalThemeStyles
                        .instance.getThemeColor()),
                    ),
                  ),
                )),

            Container(
              height: 10,
              color: ColorUtil.color("#F8F8F8"),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  left: 17, top: 12, bottom: 10, right: 17),
              padding: EdgeInsets.only(
                  left: 17, top: 20, bottom: 10, right: 17),
              decoration: BoxDecoration(
                color: ColorUtil.color("#ffffff"),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(hintText:"请输入您的问题",
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    filled: true,
                    fillColor: ColorUtil.color("#ffffff"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none
                    )),
                controller: state.infoEditController,
                focusNode: state.infoFocusNode,
                minLines: 9,
                maxLines: 9,
                autofocus: false,
                style:  TextStyle(color: ColorUtil.color("333333"), fontSize: UnifiedThemeStyles.normalFontSize),
                onChanged: (account){
//                    dispatch(CheckPhoneActionCreator.onAccountChange());
                },
              ),
            ),

            Container(
              padding: EdgeInsets.only(right:16.5,bottom: 15 ),
              alignment: Alignment.centerRight,
              child: Text(
                "最多可写100个字哦",style: TextStyle(
                  fontSize: 11,color: ColorUtil.color("#9F9F9F")
              ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                color: ColorUtil.color("#F8F8F8"),
              ),
            )

          ],
        ),
      ),
    ),
  );
}
