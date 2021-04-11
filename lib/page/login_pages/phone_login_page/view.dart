import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/utils/android_back_desktop.dart';
import 'package:travelapp/utils/toast_tools.dart';

import 'action.dart';
import 'state.dart';
DateTime lastPopTime;
Widget buildView(PhoneLoginState state, Dispatch dispatch, ViewService viewService) {
//   if(state.pageIndex!=null){
//     return WillPopScope(
//       child: Scaffold(
//         resizeToAvoidBottomPadding: false,
//         body: Scaffold(
//           backgroundColor: ColorUtil.color("#F6F6F6"),
//           body: SafeArea(
//             top: false,
//             child: GestureDetector(
//               onTap: (){
//                 FocusScope.of(viewService.context).requestFocus(new FocusNode());
//               },
//
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.only(top: 79,left: 21.5),
//                       height: 44,
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         "手机验证",style: TextStyle(
//                           fontSize: 31,color: Colors.black,fontWeight:FontWeight.bold
//                       ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 8,left: 21.5),
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "请输入您的手机号码登录您的账号",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 12,color: ColorUtil.color("#9B9B9B")
//                         ),
//                       ),
//                     ),
//
//                     Container(
//                       height: 41,
//                       margin: EdgeInsets.only(left: 15,right: 15,top: 49.5),
//                       child: Flex(
//                         direction: Axis.horizontal,
//                         children: <Widget>[
//                           Container(
//                             width: 30.9,
//                             margin: EdgeInsets.only(left: 6.5),
//                             child: Text(
//                               "+86",style: TextStyle(
//                                 fontSize: 14,color: ColorUtil.color("#9B9B9B")
//                             ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child: Container(
//                               alignment: Alignment.centerLeft,
//                               height: 41,
//                               padding: EdgeInsets.only(left: 40.5,right: 20),
//                               child:TextField(
//                                 textAlign: TextAlign.start,
//                                 decoration: InputDecoration(
//                                     hintText: "请输入手机号码",
//                                     hintStyle: TextStyle(
//                                         color: ColorUtil.color(
//                                             "333333")),
//                                     contentPadding:
//                                     EdgeInsets.symmetric(
//                                         vertical: 0),
//                                     filled: true,
//                                     fillColor: UnifiedThemeStyles
//                                         .TRANSPARENT,
//                                     border: OutlineInputBorder(
//                                         borderRadius:
//                                         BorderRadius.circular(
//                                             1),
//                                         borderSide:
//                                         BorderSide.none)),
//                                 controller: state.accoutEditController,
//                                 focusNode: state.focusNodeAccount,
//                                 keyboardType: TextInputType.phone,
//                                 autofocus: false,
//                                 style: TextStyle(
//                                     color: ColorUtil.color("#333333"),
//                                     fontSize: 16),
//                                 onChanged: (account) {},
//                               ) ,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: (){
//
//                             },
//                             child: Container(
//                               margin: EdgeInsets.only(right: 9),
//                               child: Image.asset("assets/bh_login_del.png"),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: 1,
//                       color: ColorUtil.color("#EBEBEB"),
//                       margin: EdgeInsets.only(left: 15,right: 15),
//                     ),
//
//                     Container(
//                       height: 41,
//                       margin: EdgeInsets.only(left: 15,right: 15,top: 20),
//                       child: Flex(
//                         direction: Axis.horizontal,
//                         children: <Widget>[
//                           Container(
//                             width: 50.12,
//                             margin: EdgeInsets.only(left: 6.5),
//                             child: Text(
//                               "验证码",style: TextStyle(
//                                 fontSize: 14,color: ColorUtil.color("#9B9B9B")
//                             ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child:     Container(
//                               child: Flex(
//                                 direction: Axis.horizontal,
//                                 children: <Widget>[
//
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       alignment: Alignment.centerLeft,
//                                       padding: EdgeInsets.only(
//                                           left: 21.5, right:
//                                       20),
//                                       height: 41,
//                                       child: TextField(
//                                         textAlign: TextAlign.left,
//                                         decoration: InputDecoration(
//                                             hintText: "请输入验证码",
//                                             hintStyle: TextStyle(
//                                                 color: ColorUtil.color(
//                                                     "333333")),
//                                             contentPadding: EdgeInsets.symmetric(vertical: 0),
//                                             filled: true,
//                                             fillColor: UnifiedThemeStyles
//                                                 .TRANSPARENT,
//                                             border: OutlineInputBorder(
//                                                 borderRadius: BorderRadius
//                                                     .circular(1),
//                                                 borderSide: BorderSide.none)),
//                                         controller: state.passwordEditController,
//                                         focusNode: state.focusNodePassword,
//                                         keyboardType: TextInputType.number,
//                                         autofocus: false,
//                                         style: TextStyle(
//                                             color: ColorUtil.color("333333"),
//                                             fontSize: 16),
//                                         onChanged: (account) {
// //                    dispatch(CheckPhoneActionCreator.onAccountChange());
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: (){
//                               dispatch(PhoneLoginActionCreator.onGetCode());
//                             },
//                             child: Container(
//                               margin: EdgeInsets.only(right: 20),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 state.getCodeTitle,
//                                 style: TextStyle(
//                                     fontSize: 12,color: ColorUtil.color("#4A90E2"),
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: 1,
//                       color: ColorUtil.color("#EBEBEB"),
//                       margin: EdgeInsets.only(left: 15,right: 15),
//                     ),
//
//                     GestureDetector(
//                       onTap: (){
//                         Navigator.pushNamed(viewService.context, RoutePath.PASSWORD_LOGIN_PAGE);
//                       },
//                       child: Container(
//                         alignment: Alignment.centerLeft,
//                         margin: EdgeInsets.only(top: 7.5,left: 21.5),
//                         child: Text(
//                           "密码登录",style: TextStyle(
//                             fontSize: 12,color: ColorUtil.color("#4A90E2")
//                         ),
//                         ),
//                       ),
//                     ),
//
//                     GestureDetector(
//                       onTap: (){
//                         dispatch(PhoneLoginActionCreator.onToLogin());
//                       },
//                       child: Container(
//                         margin: EdgeInsets.only(top: 33,left: 22,right: 22),
//                         height: 45,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(colors: [
//                             ColorUtil.color("#4A90E2"),
//                             ColorUtil.color("#4A90E2"),
//                           ]),
//
//                           borderRadius: BorderRadius.circular(29),
//
//                         ),
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: <Widget>[
//                             Container(
//                               child: Text(
//                                 "确认",style: TextStyle(
//                                   fontSize: 18,color: Colors.white,fontWeight:
//                               FontWeight.bold
//                               ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     GestureDetector(
//                       onTap: (){
//
//                       },
//                       child: Container(
//                         margin: EdgeInsets.only(left: 32,right: 32,
//                             top: 10),
//                         child: RichText(
//                           text: TextSpan(children: <TextSpan>[
//                             TextSpan(
//                                 text: "点击确认，既表示已阅读并同意",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: ColorUtil.color("#9B9B9B"),),
//                                 recognizer: TapGestureRecognizer()..onTap = () {
//
//                                 }),
//                             TextSpan(
//                                 text: "《手机APP服务条款》",
//                                 style: TextStyle(
//                                     fontSize: 12,
//                                     color: UnifiedThemeStyles.themeColor,
//                                     fontWeight: FontWeight.bold),
//                                 recognizer: TapGestureRecognizer()..onTap = () {
//                                   // Navigator.pushNamed(viewService.context,
//                                   //     RoutePath
//                                   //         .USER_AGREEMENT_PAGE);
//                                 }),
//
//
//                           ]),
//                         ),
//                       ),
//                     )
//
//
//                   ],
//                 ),
//               ),
//             ),
//           ) ,
//         ),
// //      body: TabNavigator()
//       ),
//       onWillPop: _doubleExit,
//     );
//   }else {
//
//   }
  return Scaffold(
    backgroundColor: ColorUtil.color("#F6F6F6"),
    body: SafeArea(
      top: false,
      child: GestureDetector(
        onTap: (){
          FocusScope.of(viewService.context).requestFocus(new FocusNode());
        },

        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 79,left: 21.5),
                height: 44,
                alignment: Alignment.topLeft,
                child: Text(
                  "手机验证",style: TextStyle(
                    fontSize: 31,color: Colors.black,fontWeight:FontWeight.bold
                ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8,left: 21.5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "请输入您的手机号码登录您的账号",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,color: ColorUtil.color("#9B9B9B")
                  ),
                ),
              ),

              Container(
                height: 41,
                margin: EdgeInsets.only(left: 15,right: 15,top: 49.5),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 30.9,
                      margin: EdgeInsets.only(left: 6.5),
                      child: Text(
                        "+86",style: TextStyle(
                          fontSize: 14,color: ColorUtil.color("#9B9B9B")
                      ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 41,
                        padding: EdgeInsets.only(left: 40.5,right: 20),
                        child:TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              hintText: "请输入手机号码",
                              hintStyle: TextStyle(
                                  color: ColorUtil.color(
                                      "333333")),
                              contentPadding:
                              EdgeInsets.symmetric(
                                  vertical: 0),
                              filled: true,
                              fillColor: UnifiedThemeStyles
                                  .TRANSPARENT,
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      1),
                                  borderSide:
                                  BorderSide.none)),
                          controller: state.accoutEditController,
                          focusNode: state.focusNodeAccount,
                          keyboardType: TextInputType.phone,
                          autofocus: false,
                          style: TextStyle(
                              color: ColorUtil.color("#333333"),
                              fontSize: 16),
                          onChanged: (account) {},
                        ) ,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 9),
                        child: Image.asset("assets/bh_login_del.png"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                color: ColorUtil.color("#EBEBEB"),
                margin: EdgeInsets.only(left: 15,right: 15),
              ),

              Container(
                height: 41,
                margin: EdgeInsets.only(left: 15,right: 15,top: 20),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 50.12,
                      margin: EdgeInsets.only(left: 6.5),
                      child: Text(
                        "验证码",style: TextStyle(
                          fontSize: 14,color: ColorUtil.color("#9B9B9B")
                      ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child:     Container(
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[

                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    left: 21.5, right:
                                20),
                                height: 41,
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      hintText: "请输入验证码",
                                      hintStyle: TextStyle(
                                          color: ColorUtil.color(
                                              "333333")),
                                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                                      filled: true,
                                      fillColor: UnifiedThemeStyles
                                          .TRANSPARENT,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius
                                              .circular(1),
                                          borderSide: BorderSide.none)),
                                  controller: state.passwordEditController,
                                  focusNode: state.focusNodePassword,
                                  keyboardType: TextInputType.number,
                                  autofocus: false,
                                  style: TextStyle(
                                      color: ColorUtil.color("333333"),
                                      fontSize: 16),
                                  onChanged: (account) {
//                    dispatch(CheckPhoneActionCreator.onAccountChange());
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        dispatch(PhoneLoginActionCreator.onGetCode());
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        alignment: Alignment.center,
                        child: Text(
                          state.getCodeTitle,
                          style: TextStyle(
                              fontSize: 12,color: ColorUtil.color("#4A90E2"),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: ColorUtil.color("#EBEBEB"),
                margin: EdgeInsets.only(left: 15,right: 15),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(viewService.context, RoutePath.PASSWORD_LOGIN_PAGE);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 7.5,left: 21.5),
                  child: Text(
                    "密码登录",style: TextStyle(
                      fontSize: 12,color: ColorUtil.color("#4A90E2")
                  ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  dispatch(PhoneLoginActionCreator.onToLogin());
                },
                child: Container(
                  margin: EdgeInsets.only(top: 33,left: 22,right: 22),
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      ColorUtil.color("#4A90E2"),
                      ColorUtil.color("#4A90E2"),
                    ]),

                    borderRadius: BorderRadius.circular(29),

                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "确认",style: TextStyle(
                            fontSize: 18,color: Colors.white,fontWeight:
                        FontWeight.bold
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){

                },
                child: Container(
                  margin: EdgeInsets.only(left: 32,right: 32,
                      top: 10),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "点击确认，既表示已阅读并同意",
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorUtil.color("#9B9B9B"),),
                          recognizer: TapGestureRecognizer()..onTap = () {

                          }),
                      TextSpan(
                          text: "《手机APP服务条款》",
                          style: TextStyle(
                              fontSize: 12,
                              color: UnifiedThemeStyles.themeColor,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            // Navigator.pushNamed(viewService.context,
                            //     RoutePath
                            //         .USER_AGREEMENT_PAGE);
                          }),


                    ]),
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    ) ,
  );
}
