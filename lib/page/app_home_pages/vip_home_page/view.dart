import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    VipHomeState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildGoodsGridViewItem(int index,List<RecommendGoodsModel> list) {
    if(index<list.length){
      RecommendGoodsModel commentModel=list[index];
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(viewService.context, RoutePath
              .GOODS_DETAIL_PAGE,arguments: {"goodsid":commentModel.goodsid});
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child:Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Container(
                height: 232,
                child:  Stack(
                  children: <Widget>[
                    Container(
                      height: 232,
                      decoration: BoxDecoration(
                        color: ColorUtil.color("99ffffff"),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: CustomCachedImageWidget(
                        commentModel.pictureList[0].pictureurl,
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 5,
                      right: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorUtil.color("99ffffff"),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        padding: EdgeInsets.all(4),
                        child: Text(
                          commentModel.goodsname,maxLines: 2, overflow: TextOverflow
                            .ellipsis,style:
                        TextStyle
                          (fontSize: 12,
                          color: Colors.black,fontWeight: FontWeight.bold,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: commentModel.price.toString(),
                              style: TextStyle(
                                fontSize: 18.6,
                                color: ColorUtil.color("#FF9B85"),
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {}),
                          TextSpan(
                              text: "起",
                              style: TextStyle(
                                fontSize: 10.2,
                                color: ColorUtil.color("#FF9B85"),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigator.pushNamed(viewService.context,
                                  //     RoutePath
                                  //         .USER_AGREEMENT_PAGE);
                                }),
                        ]),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),

                    Container(
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: commentModel.salesvolume.toString(),
                              style: TextStyle(
                                fontSize: 13.6,
                                color: ColorUtil.color("#4A90E2"),
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {}),
                          TextSpan(
                              text: "人购买",
                              style: TextStyle(
                                fontSize: 10.2,
                                color: ColorUtil.color("#4A90E2"),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigator.pushNamed(viewService.context,
                                  //     RoutePath
                                  //         .USER_AGREEMENT_PAGE);
                                }),
                        ]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }else{
      return Container();
    }


  }

  return Scaffold(
    body: SafeArea(
      top: false,
      child:Container(
        width: UnifiedThemeStyles.widthFromPx(750),
        height: UnifiedThemeStyles.heightFromPx(1334),
        child:  Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              width: UnifiedThemeStyles.widthFromPx(750),
              child: Image.asset(
                "assets/bh_vip_bg.png",
                fit: BoxFit.fill,
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
                      "用户等级",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: UnifiedThemeStyles.WHITE, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: UnifiedThemeStyles.heightFromPx(386),
              child: Container(
                child: Text(
                  BaseTools.getVipLevel(state.userModel.userlevel),
                  style:
                  TextStyle(fontSize: 20, color: ColorUtil.color("#B97001")),
                ),
              ),
            ),
            Positioned(
              top: UnifiedThemeStyles.heightFromPx(504),
              child: Container(
                height: 44.5,
                width: UnifiedThemeStyles.widthFromPx(414),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    ColorUtil.color("#2B2C34"),
                    ColorUtil.color("#616162"),
                  ]),
                  borderRadius: BorderRadius.all(Radius.circular(44.5 / 2)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "升级为会员，每日领积分",
                  style:
                  TextStyle(fontSize: 14, color: ColorUtil.color("#EEE7D0")),
                ),
              ),
            ),
            Positioned(
              top: UnifiedThemeStyles.heightFromPx(604),
              child: Container(
                color: Colors.white,
                width: UnifiedThemeStyles.widthFromPx(750),
                height: UnifiedThemeStyles.heightFromPx(1334)
                    -UnifiedThemeStyles.heightFromPx(704),
                child: ListView(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(viewService.context, RoutePath.CATE_GOOD_LIST_PAGE,
                            arguments: {"title":"会员产品","id":"1"});
                      },
                      behavior: HitTestBehavior.translucent,
                      child:  Container(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "会员产品",
                                style: TextStyle(
                                    fontSize: 14, color: ColorUtil.color
                                  ("333333"),fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "查看更多",
                                style: TextStyle(
                                    fontSize: 14, color: ColorUtil.color
                                  ("666666"),fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 15),
                              child: Image.asset("assets/bh_sgin_right.png"),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: ColorUtil.color("#F8F8F8"),
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: _buildGoodsGridViewItem(0,state.vipList),
                          ),
                          Container(
                            width:10 ,
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildGoodsGridViewItem(1,state.vipList),
                          )
                        ],
                      ),
                    ),


                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(viewService.context, RoutePath.CATE_GOOD_LIST_PAGE,
                            arguments: {"title":"代理产品","id":"2"});
                      },
                      behavior: HitTestBehavior.translucent,
                      child:  Container(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "代理产品",
                                style: TextStyle(
                                    fontSize: 14, color: ColorUtil.color
                                  ("333333"),fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                "查看更多",
                                style: TextStyle(
                                    fontSize: 14, color: ColorUtil.color
                                  ("666666"),fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 15),
                              child: Image.asset("assets/bh_sgin_right.png"),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: ColorUtil.color("#F8F8F8"),
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: _buildGoodsGridViewItem(0,state.dailiList),
                          ),
                          Container(
                            width:10 ,
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildGoodsGridViewItem(1,state.dailiList),
                          )
                        ],
                      ),
                    ),
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
