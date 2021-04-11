import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/utils/android_back_desktop.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/multi_click_listener.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AppSettingState state, Dispatch dispatch, ViewService viewService) {


  return Scaffold(
    backgroundColor: ColorUtil.color("#F8F8F8"),
    body: SafeArea(
      top: false,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          CustomAppBarWidget("设置",(){
            BaseTools.closePage(viewService.context);
          }),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                  GestureDetector(
                    onTap: (){
                        Navigator.pushNamed(viewService.context, RoutePath.ABOUT_US_PAGE);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 17,left: 10,right: 10),
                      height: 72.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all( Radius.circular(10)),
                      ),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Image.asset("assets/bh_set_guanyu.png"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 6.5),
                            child: Text("关于我们",style: TextStyle(
                              fontSize: 16,color: Colors.black
                            ),),
                          ),Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 17.5),
                            width: 15,
                            height: 20,
                            child: Image.asset("assets/youjiantou.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(viewService.context, RoutePath.FIND_PASSWORD_PAGE);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 17,left: 10,right: 10),
                    height: 72.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all( Radius.circular(10)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Image.asset("assets/update_password.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6.5),
                          child: Text("找回密码",style: TextStyle(
                              fontSize: 16,color: Colors.black
                          ),),
                        ),Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 17.5),
                          width: 15,
                          height: 20,
                          child: Image.asset("assets/youjiantou.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(viewService.context, RoutePath.SYSTEM_INFO_LIST_PAGE);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 17,left: 10,right: 10),
                    height: 72.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all( Radius.circular(10)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Image.asset("assets/bh_set_wenti.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6.5),
                          child: Text("常见问题",style: TextStyle(
                              fontSize: 16,color: Colors.black
                          ),),
                        ),Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 17.5),
                          width: 15,
                          height: 20,
                          child: Image.asset("assets/youjiantou.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    dispatch(AppSettingActionCreator.toChat());
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    margin: EdgeInsets.only(top: 17,left: 10,right: 10),
                    height: 72.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all( Radius.circular(10)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Image.asset("assets/bh_set_kefu.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6.5),
                          child: Text("联系我们",style: TextStyle(
                              fontSize: 16,color: Colors.black
                          ),),
                        ),Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 17.5),
                          width: 15,
                          height: 20,
                          child: Image.asset("assets/youjiantou.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 17,left: 10,right: 10),
                    height: 72.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all( Radius.circular(10)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Image.asset("assets/bh_set_xiazai.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6.5),
                          child: Text("APP版本信息",style: TextStyle(
                              fontSize: 16,color: Colors.black
                          ),),
                        ),Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 21.5),
                          child: Text("1.0.1",style: TextStyle(
                              fontSize: 16,color: ColorUtil.color("#A2A2A2")
                          ),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),



          GestureDetector(
            onTap: (){
              if (OnMultiClickListener.onMultiClick(seconds: 3)) {
                UserinfoCacheManager.instance.saveLoginOut("1");
                Navigator.of(viewService.context)
                    .pushNamedAndRemoveUntil(
                    RoutePath.REGISTER_PAGE, (Route<dynamic> route) =>
                false,arguments: {"pageIndex":"1"});
                // Navigator.pushNamed(viewService.context, RoutePath
                //     .PHONE_LOGIN_PAGE).then((value){
                //       if(UserinfoCacheManager.instance.checkLocation()){
                //
                //       }else{
                //         SystemNavigator.pop();
                //       }
                // });
              }
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: UnifiedThemeStyles.themeColor,
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 30,left: 40,right: 40),
              child: Text(
                "退出登录",style: TextStyle(
                fontSize: 16,color: Colors.white
              ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
