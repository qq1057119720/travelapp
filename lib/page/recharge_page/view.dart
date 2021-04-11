import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';
import 'package:travelapp/widgets/custom_widgets.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(RechargeState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildPayItem(String name, String image, int index) {
    return GestureDetector(
      onTap: () {
        dispatch(RechargeActionCreator.onSelectPayType(index));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
        color: Colors.white,
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(image),
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 14,
                    color: GlobalThemeStyles.instance.getMainTitleColor()),
              ),
            ),
            CustomWidgets().emptyExpanded(),
            Container(
              margin: EdgeInsets.only(right: 16),
              child: Image.asset(index == state.payType
                  ? "assets/bh_mall_pay_yixuan.png"
                  : "assets/bh_mall_pay_weixuan.png"),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildPayView() {
    return Container(
      decoration: BoxDecoration(
        color: GlobalThemeStyles.WHITE,
        borderRadius: BorderRadius.circular(14),
      ),
      margin: EdgeInsets.only(left: 16, right: 16, top: 50),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            height: 0.5,
            margin: EdgeInsets.only(left: 16, right: 16),
            color: ColorUtil.color("#F0F0F0"),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, top: 16),
            child: Text(
              "充值方式",
              style: TextStyle(
                  fontSize: 14,
                  color: GlobalThemeStyles.instance.getMainTitleColor()),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: _buildPayItem("微信", "assets/bh_mall_weixin.png", 1),
          ),
          _buildPayItem("支付宝", "assets/bh_mall_zhifubao.png", 2),
          Container(
            height: 10,
          )
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

          CustomAppBarWidget(
            "充值",(){
              BaseTools.closePage(viewService.context);
          }
          ),


          Container(
            height: GlobalThemeStyles.instance.heightFromPx(94),
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: 0,  right: 0),
            margin: EdgeInsets.only(top: 60),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText:"请输入提现金额",
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  filled: true,
                  fillColor: ColorUtil.color("#ffffff"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                      borderSide: BorderSide.none
                  )),
              controller: state.moneyController,
              focusNode: state.moneyNode,
              keyboardType: TextInputType.number,
              autofocus: false,
              style:  TextStyle(color: ColorUtil.color("333333"), fontSize:
              30,fontWeight: FontWeight.bold),

              onChanged: (account){
//                    dispatch(CheckPhoneActionCreator.onAccountChange());
              },
            ),
          ),

          _buildPayView(),

          GestureDetector(
            onTap: (){
              dispatch(RechargeActionCreator.onAction());
            },
            child: Container(
              width: 207.5,
              margin: EdgeInsets.only(left: 84,right: 84,top: 40),
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
                  fontSize: 17,color: ColorUtil.color("#ffffff"),
                  fontWeight: FontWeight.bold
              ),

              ),
            ),
          )
        ],
      ),
    ),
  );
}
