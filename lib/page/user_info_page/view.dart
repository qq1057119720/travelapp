import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/model/user_lower_level_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_right_widget.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(UserInfoState state, Dispatch dispatch, ViewService viewService) {
  UserLowerLevelModel userModel=state.model;
  Widget _buildLine(double height){
    return Container(
      height: height,
      width: GlobalThemeStyles.instance.widthFromPx(750),
      color: ColorUtil.color("#F4F2F9"),
    );
  }

  return Scaffold(
    body: SafeArea(
      top: false,
      child: GestureDetector(
        onTap: (){
          FocusScope.of(viewService.context).requestFocus(new FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: GlobalThemeStyles.instance.widthFromPx(750),
              height: GlobalThemeStyles.instance.heightFromPx(1334),
            ),
            CustomAppBarWidget(
              "用户信息",(){
                BaseTools.closePage(viewService.context);
            }
            ),

            Positioned(
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 80),
                    width: 80,
                    height:80,
                    alignment: Alignment.center,
                    child: ClipOval(
                        child: CustomCachedImageWidget(
                          BaseTools.isEmpty(userModel.userimage)
                              ?"":userModel.userimage,
                          width: 60,
                          height: 60,
                        )
                    ),
                  ),

                  ///用户昵称
                  Container(
                    width: GlobalThemeStyles.instance.widthFromPx(750),
                    height: 44,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text("名称",style: TextStyle(color: ColorUtil
                              .color("#333333"),fontSize: 15,fontWeight:
                          FontWeight.bold),),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: (){
                            },
                            child:  Container(
                              height: GlobalThemeStyles.instance.heightFromPx(94),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right:10 ),
                              child: Text(userModel.nickname,style: TextStyle
                                (color: GlobalThemeStyles.instance.getMainTitleColor(),
                                  fontSize: 15),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildLine(0.5),

                  Container(
                    width: GlobalThemeStyles.instance.widthFromPx(750),
                    height: 44,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text("等级",style: TextStyle(color: ColorUtil
                              .color("#333333"),fontSize: 15,fontWeight:
                          FontWeight.bold),),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: (){
                            },
                            child:  Container(
                              height: GlobalThemeStyles.instance.heightFromPx(94),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right:10 ),
                              child: Text(BaseTools.getVipLevel(userModel.userlevel),style: TextStyle
                                (color: GlobalThemeStyles.instance.getMainTitleColor(),
                                  fontSize: 15),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildLine(0.5),
                  Container(
                    width: GlobalThemeStyles.instance.widthFromPx(750),
                    height: 44,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height: GlobalThemeStyles.instance.heightFromPx(94),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left:15 ),
                          child: Text("性别",style: TextStyle(color: ColorUtil
                              .color("#333333"),fontSize: 15,fontWeight:
                          FontWeight.bold),),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: (){
                            },
                            child:  Container(
                              height: GlobalThemeStyles.instance.heightFromPx(94),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right:10 ),
                              child: Text(BaseTools.isEmpty(userModel.sex)
                                  ?"":userModel.sex,style: TextStyle
                                (color: GlobalThemeStyles.instance.getMainTitleColor(),
                                  fontSize: 15),),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),

                  _buildLine(0.5),
                  Container(
                    width: GlobalThemeStyles.instance.widthFromPx(750),
                    height: 44,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height: GlobalThemeStyles.instance.heightFromPx(94),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left:15 ),
                          child: Text("生日",style: TextStyle(color: ColorUtil
                              .color("#333333"),fontSize: 15,fontWeight:
                          FontWeight.bold),),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: (){
                            },
                            behavior: HitTestBehavior.translucent,
                            child:  Container(
                              height: GlobalThemeStyles.instance.heightFromPx(94),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right:10 ),
                              child: Text(BaseTools.isEmpty(userModel
                                  .birthday)?"":userModel.birthday,style: TextStyle
                                (color: GlobalThemeStyles.instance.getMainTitleColor(),
                                  fontSize: 15),),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  _buildLine(0.5),
                  Container(
                    width: GlobalThemeStyles.instance.widthFromPx(750),
                    height: 44,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text("注册时间",style: TextStyle(color: ColorUtil
                              .color("#333333"),fontSize: 15,fontWeight:
                          FontWeight.bold),),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: (){
                            },
                            child:  Container(
                              height: GlobalThemeStyles.instance.heightFromPx(94),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right:10 ),
                              child: Text(DateUtil.formatDateMs(userModel.createtime,format: "yyyy-MM-dd"),style: TextStyle
                                (color: GlobalThemeStyles.instance.getMainTitleColor(),
                                  fontSize: 15),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildLine(0.5),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
