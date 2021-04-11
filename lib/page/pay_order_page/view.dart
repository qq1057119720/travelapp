
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';
import 'package:travelapp/widgets/custom_widgets.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(PayOrderState state, Dispatch dispatch, ViewService viewService) {


  Widget _buildGoodsInfo() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 10),
      decoration: BoxDecoration(
        color: GlobalThemeStyles.WHITE,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: CustomCachedImageWidget(
                        state.goodsModel.pictureList[0].pictureurl),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 14),
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            state.goodsModel.goodsname,
                            style: TextStyle(
                                fontSize: 14,
                                color: GlobalThemeStyles.instance
                                    .getMainTitleColor(),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "￥",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorUtil.color("#FF4F4F"),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "${state.goodsModel.price}",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: ColorUtil.color("#FF4F4F"),
                                  ),
                                ),
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
          )
        ],
      ),
    );
  }

  Widget _buildPayItem(String name, String image, int index) {
    return GestureDetector(
      onTap: () {
        dispatch(PayOrderActionCreator.onSelectPayType(index));
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
      margin: EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 35,
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    "购买数",
                    style: TextStyle(
                        fontSize: 14,
                        color: GlobalThemeStyles.instance.getMainTitleColor()),
                  ),
                ),
                CustomWidgets().emptyExpanded(),

                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    state.goodsModel.goodscount.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        color:
                        GlobalThemeStyles.instance.getExplainTitleColor()),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.5,
            margin: EdgeInsets.only(left: 16, right: 16),
            color: ColorUtil.color("#F0F0F0"),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, top: 16),
            child: Text(
              "支付方式",
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
  Widget _buildItem(int index) {
    if (index == 0) {
      return Container();
    } else if (index == 1) {
      return _buildGoodsInfo();
    } else if (index == 2) {
      return _buildPayView();
    }else if(index==3){
      return Container(
        decoration: BoxDecoration(
          color: GlobalThemeStyles.WHITE,
          borderRadius: BorderRadius.circular(14),
        ),
        margin: EdgeInsets.only(left: 16, right: 16, top: 10),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                "备注：(请看要求认真填写)",
                style: TextStyle(
                    fontSize: 14,
                    color: GlobalThemeStyles.instance.getMainTitleColor()),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  left: 17, top: 12, bottom: 10, right: 17),
              padding: EdgeInsets.only(
                  left: 17, top: 20, bottom: 10, right: 17),
              decoration: BoxDecoration(
                color: ColorUtil.color("#EEEFF2"),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                state.goodsModel.orderremark,style: TextStyle(
                fontSize: 14,color: ColorUtil.color("333333")
              ),
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  Widget _buildListView() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemBuilder: (c, i) => _buildItem(i),
        itemCount: 6);
  }

  return Scaffold(
    backgroundColor: ColorUtil.color("#F5F5F5"),
    body: SafeArea(
      top: false,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          CustomAppBarWidget("支付订单", () {
            BaseTools.closePage(viewService.context);
          }),
          Expanded(
            flex: 1,
            child: _buildListView(),
          ),
          Container(
            height: 75,
            color: Colors.white,
            width: UnifiedThemeStyles.widthFromPx(750),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left: 20.5),
                    color: Colors.transparent,
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset("assets/bh_goods_kefu.png"),
                        ),
                        Container(
                          child: Text(
                            "客服",
                            style: TextStyle(
                                fontSize: 11,
                                color: ColorUtil.color("#7D7D7D")),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 21),
                  child: Text(
                    "总额",style: TextStyle(
                      fontSize: 13,color: ColorUtil.color("000000")
                  ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    "￥",style: TextStyle(
                      fontSize: 13,color: ColorUtil.color("#FF4F4F")
                  ),
                  ),
                ),

                Container(
                  child: Text(
                    "${state.goodsModel.price*state.goodsModel.goodscount}",style:
                  TextStyle(
                      fontSize: 23,color: ColorUtil.color("#FF4F4F")
                  ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                GestureDetector(
                  onTap: () {
                    dispatch(PayOrderActionCreator.payOrder());
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 16.5),
                    width: 145,
                    height: 44.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorUtil.color("#FFB94E"),
                            ColorUtil.color("#FF5D5D"),
                          ]),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "立即预订",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
