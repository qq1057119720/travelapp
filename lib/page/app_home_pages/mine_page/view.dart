import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';
import 'package:travelapp/widgets/custom_widgets.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MineState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildGnView(String image,String name){
    return GestureDetector(
      onTap: (){
        if(name=="我的推广"){
          Navigator.pushNamed(viewService.context, RoutePath
              .MY_PROMOTION_PAGE);
        }else if(name=="签到"){
            Navigator.pushNamed(viewService.context, RoutePath
                .SGIN_IN_PAGE);
          }
        else if(name=="我的订单"){
          Navigator.pushNamed(viewService.context, RoutePath
              .GOODS_ORDER_LIST_PAGE);
        }
        else if(name=="我的余额"){
          Navigator.pushNamed(viewService.context, RoutePath
              .MY_BALANCE_PAGE);
        }
        else if(name=="意见反馈"){
          Navigator.pushNamed(viewService.context, RoutePath
              .FEED_BACK_PAGE);
        }
        else if(name=="常见问题"){
          Navigator.pushNamed(viewService.context, RoutePath
              .SYSTEM_INFO_LIST_PAGE);
        }
        else if(name=="地址管理"){
            Navigator.pushNamed(viewService.context, RoutePath
                .RECEIVER_ADDRESS_PAGE,arguments: {"type":"0"});
        }
        else if(name=="我的旅客"){
          Navigator.pushNamed(viewService.context, RoutePath
              .MY_TEAM_PAGE);
        }
        // if(!UserinfoCacheManager.instance.checkUserLogin()){
        //   Navigator.pushNamed(viewService.context, RoutePath.USER_LOGIN_PAGE);
        //   return;
        // }
        //
        // if(name=="订单管理"){
        //   Navigator.pushNamed(viewService.context, RoutePath
        //       .BUY_GOODS_ORDER_LIST_PAGE);
        // }else if(name=="地址管理"){
        //   Navigator.pushNamed(viewService.context, RoutePath
        //       .RECEIVER_ADDRESS_PAGE,arguments: {"type":"0"});
        // }else if(name=="商品管理"){
        //   Navigator.pushNamed(viewService.context, RoutePath
        //       .USER_GOODS_LIST_PAGE);
        // }else if(name=="我的战队"){
        //   Navigator.pushNamed(viewService.context, RoutePath
        //       .MY_TEAM_PAGE);
        // }else if(name=="我的店铺"){
        //   Navigator.pushNamed(viewService.context, RoutePath
        //       .MY_SHOP_PAGE,arguments: {"personId":state.personModel
        //       .personData.personId});
        // }else if(name=="粉丝关注"){
        //   Navigator.pushNamed(viewService.context, RoutePath
        //       .MY_FANS_PAGE,);
        // }else if(name=="支付宝"){
        //   Navigator.pushNamed(viewService.context, RoutePath
        //       .MY_ALIPAY_PAGE,);
        // }else if(name=="我的上级"){
        //   dispatch(MineActionCreator.onGetSuperUserinfo());
        // }else if(name=="我的二维码"){
        //   Navigator.pushNamed(viewService.context, RoutePath
        //       .MY_ERWEIMA_PAGE,);
        // }else if(name=="常见问题"){
        //   Navigator.pushNamed(viewService.context, RoutePath
        //       .SYSTEM_INFO_LIST_PAGE,arguments: {"type":"1","title":"常见问题"});
        // }else if(name=="使用帮助"){
        //   Navigator.pushNamed(viewService.context, RoutePath
        //       .SYSTEM_INFO_LIST_PAGE,arguments: {"type":"0","title":"使用帮助"});
        // }
        // else if(name=="意见反馈"){
        //   Navigator.pushNamed(viewService.context, RoutePath
        //       .FEED_BACK_PAGE);
        // }
      },
      child: Container(
        color: Colors.transparent,
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Container(
              child: Image.asset(image,color: GlobalThemeStyles.instance.getThemeColor(),),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                name,style: TextStyle(color: GlobalThemeStyles.instance
                  .getExplainTitleColor(),fontSize: 12,),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMsgView(String count,String name){
    return Container(
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            child: Text(
              count,style: TextStyle(color: GlobalThemeStyles.instance
                .getMainTitleColor(),fontSize: 20,fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text(
              name,style: TextStyle(color: GlobalThemeStyles.instance
                .getExplainTitleColor(),fontSize: 12,),
            ),
          ),
        ],
      ),
    );
  }

  return Scaffold(
    body: SafeArea(
      top: false,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: GlobalThemeStyles.instance.widthFromPx(750),
                  child: Image.asset(
                    "assets/bh_my_bg.png",
                    fit: BoxFit.fill,
                    color: GlobalThemeStyles.instance.getThemeColor(),
                  ),
                ),
                Positioned(
                  top: 52,
                  child: Container(
                    child: Text(
                      "个人中心",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: GlobalThemeStyles.WHITE),
                    ),
                  ),
                ),
                Positioned(
                  top: 52,
                  right: 24,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(viewService.context, RoutePath.APP_SETTING_PAGE);
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      child: Image.asset("assets/bh_my_setting.png"),
                    ),
                  ),
                ),
                Positioned(
                  top: 106,
                  child: Container(
                    width: GlobalThemeStyles.instance.widthFromPx(750),
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(viewService.context, RoutePath.UPDATE_USER_INFO_PAGE);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 40),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: 56,
                                  height: 56,
                                  child: ClipOval(
                                    child: CustomCachedImageWidget(
                                      UserinfoCacheManager.instance
                                              .checkUserLogin()&&!BaseTools.isEmpty(state.userModel
                                          .userimage)
                                          ? state.userModel
                                              .userimage
                                          : "http://ppic"
                                              ".meituba"
                                              ".com:84/uploads/allimg/2017/12/30/305_18552.jpg",
                                      width: 56,
                                      height: 56,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 53,
                                  height: 18,
                                  margin: EdgeInsets.only(top: 52),
                                  decoration: BoxDecoration(
                                    color: GlobalThemeStyles.instance
                                        .getMainTitleColor(),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          BaseTools.getVipLevel(state.userModel.userlevel),
                                          style: TextStyle(
                                              fontSize: 8,
                                              color:
                                                  ColorUtil.color("#8B572A")),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 18),
                          child: Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  state.userModel
                                      .nickname,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        CustomWidgets().emptyExpanded(),
                        Container(
                          margin: EdgeInsets.only(right: 36),
                          child: Flex(
                            direction: Axis.vertical,
                            children: <Widget>[
                              Container(
                                child: Image.asset(
                                    "assets/bh_mine_baozhengjin.png"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50,right: 50,top: 24),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomWidgets().emptyExpanded(),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(viewService.context, RoutePath.USER_INTEGRAL_LIST_PAGE);
                  },
                  child: _buildMsgView(state.jifen, "积分"),
                ),
                CustomWidgets().emptyExpanded(),
                Container(
                  width: 1,
                  height: 26,
                  color: ColorUtil.color("f1f1f1"),
                ),
                CustomWidgets().emptyExpanded(),
               GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(viewService.context, RoutePath.EQUITY_SHARE_PAGE);
                 },
                 behavior: HitTestBehavior.translucent,
                 child:  _buildMsgView(BaseTools.isEmpty(state.equityShareModel)
                     ?"0":state.equityShareModel.equitycount.toString(), "权益"),
               ),
                CustomWidgets().emptyExpanded(),
                Container(
                  width: 1,
                  height: 26,
                  color: ColorUtil.color("f1f1f1"),
                ),
                CustomWidgets().emptyExpanded(),
                _buildMsgView(state.userWalletModel!=null?state
                    .userWalletModel.totalmoney.toString():"0.0", "余额"),
                CustomWidgets().emptyExpanded(),
              ],
            ),
          ),

          Container(
            height: 10,
            margin: EdgeInsets.only(top: 24),
            color: ColorUtil.color("#F5F5F5"),
          ),

          Container(
            margin: EdgeInsets.only(top: 14,left: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              "功能中心",
              style: TextStyle(
                  fontSize: 16,color: GlobalThemeStyles.instance
                  .getMainTitleColor(),fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 47,right: 47,top: 24),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _buildGnView("assets/bh_mine_icon13.png", "签到"),
                CustomWidgets().emptyExpanded(),
                _buildGnView("assets/bh_mine_icon7.png", "我的推广"),
                CustomWidgets().emptyExpanded(),
                _buildGnView("assets/bh_mine_icon3.png", "我的订单"),
                CustomWidgets().emptyExpanded(),
                _buildGnView("assets/bh_mine_icon5.png", "我的余额"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 47,right: 47,top: 18),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _buildGnView("assets/bh_mine_icon8.png", "我的旅客"),
                CustomWidgets().emptyExpanded(),
                _buildGnView("assets/bh_mine_icon9.png", "常见问题"),
                CustomWidgets().emptyExpanded(),
                _buildGnView("assets/bh_mine_icon11.png", "意见反馈"),
                CustomWidgets().emptyExpanded(),
                _buildGnView("assets/bh_mine_icon12.png", "地址管理"),
              ],
            ),
          ),



        ],
      ),
    ),
  );
}
