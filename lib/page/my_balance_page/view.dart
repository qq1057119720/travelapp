import 'package:date_format/date_format.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_right_widget.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MyBalanceState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: SafeArea(
      top: false,
      child: Container(
        width: UnifiedThemeStyles.widthFromPx(750),
        height: UnifiedThemeStyles.heightFromPx(1334),
        child: Stack(
          children: <Widget>[
            Container(
              width: UnifiedThemeStyles.widthFromPx(750),
              child: Image.asset("assets/bh_yue_bg.png",fit: BoxFit.fill,),
            ),

            Positioned(
              bottom: 0,
              child:     Container(
                width: UnifiedThemeStyles.widthFromPx(750),
                child: Image.asset("assets/bh_vip_bg2.png",fit: BoxFit.fill,),
              ),
            ),
            Container(
              height: 70,
              width: UnifiedThemeStyles.widthFromPx(750),
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    width: 300,
                    margin: EdgeInsets.only(top: 30),
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "我的余额",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: UnifiedThemeStyles.WHITE,
                          fontSize: 18),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: GestureDetector(
                      onTap: (){
                        BaseTools.closePage(viewService.context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(top: 30),
                        child: Image.asset(
                          "assets/bh_topback_h.png",color: ColorUtil.color
                          ("ffffff"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child:   GestureDetector(
                    onTap: (){
                      // dispatch(AddCommentActionCreator.onAddNewsInfo());
                      Navigator.pushNamed(viewService.context, RoutePath.MY_BALANCE_LIST_PAGE);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30,right: 20),
                      width: 70,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        "收支明细",style: TextStyle(fontSize: 14,color:
                      GlobalThemeStyles.WHITE),
                      ),
                    ),
                  ),
                  ),
                
                ],
              ),
            ),

            Positioned(
              top: 158,
              child: Container(
                width: UnifiedThemeStyles.widthFromPx(750),
                child: Flex(direction: Axis.vertical,
                children: <Widget>[
                  Container(
                    child: Text(
                      "我的零钱",style: TextStyle(
                      fontSize: 19.5,color: Colors.white
                    ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          child: Text(
                            "￥",style: TextStyle(
                              fontSize: 27.5,color: ColorUtil.color("#FFF5D7")
                          ),
                          ),
                        ),
                        Container(
                          child: Text(
                            state.userWalletModel!=null?state.userWalletModel
                            .totalmoney.toString():"0.0",style: TextStyle(
                              fontSize: 54.5,color:  ColorUtil.color("#FFF5D7")
                          ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                      ],
                    ),
                  )
                ],),
              ),
            ),

            Positioned(
              bottom: 95,
              child: Container(
                alignment: Alignment.center,
                child:
              Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(viewService.context, RoutePath.RECHARGE_PAGE);
                    },
                    child: Container(
                      width: 207.5,
                      margin: EdgeInsets.only(left: 84,right: 84),
                      height: 44.5,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          ColorUtil.color("#5992FE"),
                          ColorUtil.color("#5992FE"),
                        ]),

                        borderRadius: BorderRadius.circular(44.5/2),

                      ),
                      child: Text(
                        "充值",style: TextStyle(
                          fontSize: 17,color: ColorUtil.color("#EEE7D0"),
                          fontWeight: FontWeight.bold
                      ),

                      ),
                    ),
                  ),


            GestureDetector(
              onTap: (){
                Navigator.pushNamed(viewService.context, RoutePath
                    .WITHDRAW_DEPOSIT_PAGE,arguments: {"data":state.userWalletModel});
              },
              child:       Container(
                width: 207.5,
                margin: EdgeInsets.only(left: 84,right: 84,top: 15.5),
                height: 44.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    ColorUtil.color("#E6E6E6"),
                    ColorUtil.color("#E6E6E6"),
                  ]),

                  borderRadius: BorderRadius.circular(44.5/2),

                ),
                child: Text(
                  "提现",style: TextStyle(
                    fontSize: 17,color: ColorUtil.color("#5992FE"),
                    fontWeight: FontWeight.bold
                ),

                ),
              ),
            )

                ],
              ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
