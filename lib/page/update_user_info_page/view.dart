
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_right_widget.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';

import 'action.dart';
import 'state.dart';


Widget buildView(UpdateUserInfoState state, Dispatch dispatch, ViewService viewService) {
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  Widget _buildLine(double height){
    return Container(
      height: height,
      width: GlobalThemeStyles.instance.widthFromPx(750),
      color: ColorUtil.color("#F4F2F9"),
    );
  }
  ///加载File头像
  Widget _createFileIcon() =>  AssetThumb(
    asset: state.images[0],
    width: 74,
    height: 74,
  );

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
            CustomAppBarRightWidget(
              "修改资料",
                  (){
                Navigator.pop(viewService.context);
              },

              rightWidget:GestureDetector(
                onTap: (){
                  dispatch(UpdateUserInfoActionCreator.onUpdateUserInfo());
                },
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 30,right: 15),
                  alignment: Alignment.center,
                  child: Text(
                    "确定",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15),
                  ),
                ),
              ),
            ),

            Positioned(
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      dispatch(UpdateUserInfoActionCreator.onSelectImage());
                    },
                    child: Container(
                      height: 65,
                      margin: EdgeInsets.only(top: 70),
                      width: GlobalThemeStyles.instance.widthFromPx(750),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text("头像",style: TextStyle(fontSize: 16,
                                color: ColorUtil.color("#333333"),fontWeight:
                                FontWeight.bold),),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          GestureDetector(onTap: (){
//                        Navigator.of(viewService.context).pushNamed(RoutePath.UPDATE_USERINFO);
                            dispatch(UpdateUserInfoActionCreator.onSelectImage());
                          },
                            child: Container(
                              width: 40,
                              height:40,
                              child: ClipOval(
                                child: state
                                    .images==null||state
                                    .images.length==0?CustomCachedImageWidget(
                                  BaseTools.isEmpty(userModel.userimage)
                                      ?"":userModel.userimage,
                                  width: 40,
                                  height: 40,
                                ):_createFileIcon(),
                              ),
                            ),),

                          Container(
                            margin: EdgeInsets.only(right: 13),
                            child: Image.asset("assets/bh_user_right.png"),
                          )
                        ],
                      ),
                    ),
                  ),
                  _buildLine(0.5),

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
                          child: Container(
                            height: GlobalThemeStyles.instance.heightFromPx(94),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(
                                left: 0,  right: 37),
                            child: TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(hintText:"请输入昵称",
                                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                                  filled: true,
                                  fillColor: ColorUtil.color("#ffffff"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none
                                  )),
                              controller: state.nicknameEditController,
                              focusNode: state.nicknameFocusNode,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              style:  TextStyle(color: ColorUtil.color("333333"), fontSize: 16),
                              onChanged: (account){
//                    dispatch(CheckPhoneActionCreator.onAccountChange());
                              },
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
                              dispatch(UpdateUserInfoActionCreator.onSelectSex());
                            },
                            child:  Container(
                              height: GlobalThemeStyles.instance.heightFromPx(94),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right:10 ),
                              child: Text(state.userSex,style: TextStyle
                                (color: GlobalThemeStyles.instance.getMainTitleColor(),
                                  fontSize: 15),),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 13),
                          child: Image.asset("assets/bh_user_right.png"),
                        )

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
                              dispatch(UpdateUserInfoActionCreator.onSelectDate());
                            },
                            behavior: HitTestBehavior.translucent,
                            child:  Container(
                              height: GlobalThemeStyles.instance.heightFromPx(94),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right:10 ),
                              child: Text(state.briday,style: TextStyle
                                (color: GlobalThemeStyles.instance.getMainTitleColor(),
                                  fontSize: 15),),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 13),
                          child: Image.asset("assets/bh_user_right.png"),
                        )

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
