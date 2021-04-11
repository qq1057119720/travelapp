import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MyPromotionState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: ColorUtil.color("#F8F8F8"),
    body: SafeArea(
      top: false,
      child: RepaintBoundary(
        key: state.repaintWidgetKey,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              width: UnifiedThemeStyles.widthFromPx(750),
              height: UnifiedThemeStyles.heightFromPx(1334),
            ),
            Container(
              margin: EdgeInsets.only(top: 43),
              width: UnifiedThemeStyles.widthFromPx(750),
              height: 500,
              child: Image.asset("assets/bh_tuiguang_bg.png",fit: BoxFit.cover,),
            ),


            CustomAppBarWidget("我的推广", () {
              BaseTools.closePage(viewService.context);
            }),
            Positioned(
              top: 89,
              child: Container(
                alignment: Alignment.center,
                width: UnifiedThemeStyles.widthFromPx(750),
                child: Text("邀请好友 日进斗金",style: TextStyle(
                    fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold
                ),),
              ),
            ),
            Positioned(
              top:251 ,
              child: Container(
                width: UnifiedThemeStyles.widthFromPx(750),
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "新用户注册",style: TextStyle(
                          fontSize: 18,color: Colors.black
                      ),
                      ),
                    ),
                   GestureDetector(
                     onLongPress: (){
                        dispatch(MyPromotionActionCreator.saveErweima());
                     },
                     child: RepaintBoundary(
                       key: state.repaintWidgetKey2,
                       child:  Container(
                         width: 156,
                         margin: EdgeInsets.only(top: 10),
                         child:  QrImage(
                           data: "http://120.78.166"
                               ".156/travelserver/share/index"
                               ".html#/register?invite="+UserinfoCacheManager
                               .instance.getUserInfo().invitationcode,
                           size: 156,
                           padding: EdgeInsets.all(0),
                         ),
                       ),
                     ),
                   ),
                    GestureDetector(
                      onTap: (){
                      dispatch(MyPromotionActionCreator.saveImage());
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "保存推广二维码到相册",style: TextStyle(
                            fontSize: 14,color: ColorUtil.color("#503AAA")
                        ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 33,
              child: Container(
                height: 55,
                width: UnifiedThemeStyles.widthFromPx(680),
                decoration: BoxDecoration(
                  color: ColorUtil.color("#917CE0"),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 22),
                      child: Text(
                        "推广码",style: TextStyle(
                          fontSize: 18,color: Colors.white,fontWeight:
                      FontWeight.bold
                      ),
                      ),
                    ),Container(
                      margin: EdgeInsets.only(left: 18),
                      child: Text(
                        UserinfoCacheManager.instance.getUserInfo()
                            .invitationcode,style: TextStyle(
                          fontSize: 25,color: Colors.white,fontWeight:
                      FontWeight.bold
                      ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),

                    GestureDetector(
                      onTap: (){
                        Clipboard.setData(ClipboardData(text: UserinfoCacheManager.instance.getUserInfo()
                            .invitationcode));
                        ToastTools.showToast("复制成功");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorUtil.color("#524580"),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        width: 76.5,
                        height: 42,
                        margin: EdgeInsets.only(right: 8),
                        alignment: Alignment.center,
                        child: Text(
                          "复制",style: TextStyle(
                            fontSize: 18,color: Colors.white,fontWeight:
                        FontWeight.bold
                        ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
