
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_right_widget.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AddReceiverAddressState state, Dispatch dispatch, ViewService viewService) {

  return Scaffold(
    backgroundColor: ColorUtil.color("f5f5f5"),
    body: SafeArea(
      top: false,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          CustomAppBarRightWidget(
            "新增联系人地址",
            () {
              BaseTools.closePage(viewService.context);
            },
            rightWidget:  GestureDetector(
              onTap: (){
                dispatch(AddReceiverAddressActionCreator.toAddAddress());
              },
              child: Container(
                margin: EdgeInsets.only(top: 30),
                width: 60,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  "保存",style: TextStyle(fontSize: 14,color: GlobalThemeStyles
                    .instance.getThemeColor()),
                ),
              ),
            ),
          ),
          Container(
            height: 49,
            margin: EdgeInsets.only(top:10,right: 15,left: 15 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "收件人：",
                    style: TextStyle(
                      fontSize: 14,color: GlobalThemeStyles.instance.getMainTitleColor()
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          hintText: "请输入收件人",
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 0),
                          filled: true,
                          fillColor: GlobalThemeStyles.WHITE,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                      controller: state.nameEditController,
                      focusNode: state.nameFocusNode,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      style: TextStyle(
                          color: GlobalThemeStyles.instance
                              .getMainTitleColor(),
                          fontSize: 14),
                    ),
                  ),
                )

              ],
            ),
          ),

          Container(
            height: 0.5,
            margin: EdgeInsets.only(left: 15,right: 15),
            color: ColorUtil.color("#F2F2F2"),
          ),
          Container(
            height: 49,
            margin: EdgeInsets.only(right: 15,left: 15 ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "联系电话：",
                    style: TextStyle(
                        fontSize: 14,color: GlobalThemeStyles.instance.getMainTitleColor()
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          hintText: "填写联系人手机号码",
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 0),
                          filled: true,
                          fillColor: GlobalThemeStyles.WHITE,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                      controller: state.phoneEditController,
                      focusNode: state.phoneFocusNode,
                      keyboardType: TextInputType.phone,
                      autofocus: false,
                      style: TextStyle(
                          color: GlobalThemeStyles.instance
                              .getMainTitleColor(),
                          fontSize: 14),
                    ),
                  ),
                )

              ],
            ),
          ),

          Container(
            height: 0.5,
            margin: EdgeInsets.only(left: 15,right: 15),
            color: ColorUtil.color("#F2F2F2"),
          ),

          GestureDetector(
            onTap: (){
                dispatch(AddReceiverAddressActionCreator.onSelectCity());
            },
            child: Container(
              height: 49,
              margin: EdgeInsets.only(right: 15,left: 15 ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "联系地址：",
                      style: TextStyle(
                          fontSize: 14,color: GlobalThemeStyles.instance.getMainTitleColor()
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        BaseTools.isEmpty(state.province)?"请选择联系地址":state
                            .province+" "+state.city+" "+state.zone,
                        style: TextStyle(
                            fontSize: 14,color: GlobalThemeStyles.instance.getThemeColor()
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),

          Container(
            height: 0.5,
            margin: EdgeInsets.only(left: 15,right: 15),
            color: ColorUtil.color("#F2F2F2"),
          ),

          Container(
            height: 49,
            margin: EdgeInsets.only(right: 15,left: 15 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight:
              Radius.circular(5)),
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "街道小区：",
                    style: TextStyle(
                        fontSize: 14,color: GlobalThemeStyles.instance.getMainTitleColor()
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          hintText: "填写联系地址的街道小区信息",
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 0),
                          filled: true,
                          fillColor: GlobalThemeStyles.WHITE,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                      controller: state.addressEditController,
                      focusNode: state.addressFocusNode,
                      keyboardType: TextInputType.phone,
                      autofocus: false,
                      style: TextStyle(
                          color: GlobalThemeStyles.instance
                              .getMainTitleColor(),
                          fontSize: 14),
                    ),
                  ),
                )

              ],
            ),
          ),

        ],
      ),
    ),
  );
}
