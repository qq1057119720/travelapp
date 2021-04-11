import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/model/order_detail_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_alert_widgets.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';
import 'package:travelapp/widgets/custom_widgets.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GoodsOrderListState state, Dispatch dispatch, ViewService viewService) {


  Widget _buidOrderState(OrderDetailModel model){
    if(model.orderstatus==1){
      return Container(
        margin: EdgeInsets.only(right: 16,bottom: 16),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            CustomWidgets().emptyExpanded(),
            GestureDetector(
              onTap: (){
                showGeneralDialog(
                  context: viewService.context,
                  barrierLabel: "",
                  barrierDismissible: true,
                  transitionDuration: Duration(milliseconds: 300),
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return CustomAlertWidget("确定要取消订单么？","确定",affirm: (){
                      // dispatch(BuyGoodsOrderListActionCreator
                      //     .onUpdateOrderStatus(model.goodsOrder.goodsOrderId,
                      //     "3"));
                      Navigator.pop(viewService.context);
                      dispatch(GoodsOrderListActionCreator.updateOrder("5",
                          model.goodsorderid, "取消成功"));
                    },cancel: (){
                      Navigator.pop(viewService.context);
                    },);
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 16),
                height:30 ,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    GlobalThemeStyles.instance.getThemeColor(),
                    GlobalThemeStyles.instance.getThemeColor(),
                  ]),
                  borderRadius:BorderRadius.all(Radius.circular(24)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "取消订单",style: TextStyle(
                    fontSize: 14,color: Colors.white
                ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(viewService.context, RoutePath.PAY_ORDER_PAGE,arguments: {"order":model});
              },
              child: Container(
                margin: EdgeInsets.only(left: 16),
                height:30 ,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    GlobalThemeStyles.instance.getThemeColor(),
                    GlobalThemeStyles.instance.getThemeColor(),
                  ]),
                  borderRadius:BorderRadius.all(Radius.circular(24)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "待支付",style: TextStyle(
                    fontSize: 14,color: Colors.white
                ),
                ),
              ),
            )
          ],
        ),
      );
    }else if(model.orderstatus==2){
      return Container(
        margin: EdgeInsets.only(right: 16,bottom: 16),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            CustomWidgets().emptyExpanded(),

            GestureDetector(
              onTap: (){
                Navigator.pushNamed(viewService.context, RoutePath.ADD_COMMENT_PAGE,
                    arguments: {"order":model});
              },
              child: Container(
                margin: EdgeInsets.only(left: 16),
                height:30 ,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    GlobalThemeStyles.instance.getThemeColor(),
                    GlobalThemeStyles.instance.getThemeColor(),
                  ]),
                  borderRadius:BorderRadius.all(Radius.circular(24)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "前去评价",style: TextStyle(
                    fontSize: 14,color: Colors.white
                ),
                ),
              ),
            )
          ],
        ),
      );
    }
    else if(model.orderstatus==3){
      return Container(
        margin: EdgeInsets.only(right: 16,bottom: 16),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            CustomWidgets().emptyExpanded(),

            GestureDetector(
              onTap: (){
                // dispatch(BuyGoodsOrderListActionCreator.toAddComment(model
                //     .goodsOrder.goodsOrderId));
                Navigator.pushNamed(viewService.context, RoutePath.ADD_COMMENT_PAGE,
                    arguments: {"order":model});
              },
              child: Container(
                margin: EdgeInsets.only(left: 16),
                height:30 ,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    GlobalThemeStyles.instance.getThemeColor(),
                    GlobalThemeStyles.instance.getThemeColor(),
                  ]),
                  borderRadius:BorderRadius.all(Radius.circular(24)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "前去评价",style: TextStyle(
                    fontSize: 14,color: Colors.white
                ),
                ),
              ),
            )
          ],
        ),
      );
    }
    else if(model.orderstatus==4){
      return Container(
        margin: EdgeInsets.only(right: 16,bottom: 16),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            CustomWidgets().emptyExpanded(),

            GestureDetector(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(left: 16),
                height:30 ,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    GlobalThemeStyles.instance.getThemeColor(),
                    GlobalThemeStyles.instance.getThemeColor(),
                  ]),
                  borderRadius:BorderRadius.all(Radius.circular(24)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "已评价",style: TextStyle(
                    fontSize: 14,color: Colors.white
                ),
                ),
              ),
            )
          ],
        ),
      );
    }
    else if(model.orderstatus==5){
      return Container(
        margin: EdgeInsets.only(right: 16,bottom: 16),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            CustomWidgets().emptyExpanded(),

            GestureDetector(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(left: 16),
                height:30 ,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    GlobalThemeStyles.instance.getThemeColor(),
                    GlobalThemeStyles.instance.getThemeColor(),
                  ]),
                  borderRadius:BorderRadius.all(Radius.circular(24)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "已取消",style: TextStyle(
                    fontSize: 14,color: Colors.white
                ),
                ),
              ),
            )
          ],
        ),
      );
    }
    else if(model.orderstatus==6){
      return Container(
        margin: EdgeInsets.only(right: 16,bottom: 16),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            CustomWidgets().emptyExpanded(),

            GestureDetector(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(left: 16),
                height:30 ,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    GlobalThemeStyles.instance.getThemeColor(),
                    GlobalThemeStyles.instance.getThemeColor(),
                  ]),
                  borderRadius:BorderRadius.all(Radius.circular(24)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "待退款",style: TextStyle(
                    fontSize: 14,color: Colors.white
                ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _buildItem(int index){
    OrderDetailModel model=state.orderList[index];
    return GestureDetector(
      onTap: (){
        // Navigator.pushNamed(viewService.context, RoutePath.ORDER_DETAIL_PAGE);
      },
      child: Container(
        margin: EdgeInsets.only(left: 16,right: 16,top: 10),
        decoration: BoxDecoration(
          color: GlobalThemeStyles.WHITE,
          borderRadius: BorderRadius.circular(14),
        ),

        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
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
                          model.pictureList[0].pictureurl
                      ),
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
                              model.goodsname,
                              style: TextStyle(
                                  fontSize: 14,color: GlobalThemeStyles.instance
                                  .getMainTitleColor(),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 8),
                          //   child: Text(
                          //     model.category.cateName,
                          //     style: TextStyle(
                          //       fontSize: 12,color: GlobalThemeStyles.instance
                          //         .getExplainTitleColor(),
                          //
                          //     ),
                          //   ),
                          // ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "X${model.goodscount}",
                                    style: TextStyle(
                                      fontSize: 12,color: GlobalThemeStyles
                                        .instance
                                        .getExplainTitleColor(),
                                    ),
                                  ),
                                ),
                                CustomWidgets().emptyExpanded(),
                                Container(
                                  child: Text(
                                    "￥",
                                    style: TextStyle(
                                      fontSize: 16,color: ColorUtil.color("#F34B4B"),
                                    ),
                                  ),
                                ),

                                Container(
                                  child: Text(
                                    "${model.allprice}",
                                    style: TextStyle(
                                        fontSize: 22,color: ColorUtil.color
                                      ("#F34B4B"),fontWeight: FontWeight.bold
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
            ),
            _buidOrderState(model)
          ],
        ),

      ),
    );
  }
  Widget _buildListView() {
    return EasyRefresh(
      header: MaterialHeader(),
      footer:
      BezierBounceFooter(backgroundColor: GlobalThemeStyles.instance.getThemeColor()),
      child: ListView.builder(
          padding: EdgeInsets.only(top: 0),
          itemBuilder: (c, i) => _buildItem(i),
          itemCount: state.orderList!=null&&state.orderList.length>0?state
              .orderList.length:0),
      onRefresh: () async =>
      await dispatch(GoodsOrderListActionCreator.onRefresh()),
      onLoad: () async =>
      await dispatch(GoodsOrderListActionCreator.onLoadMore()),
    );
  }
  return Scaffold(
    backgroundColor: ColorUtil.color("#F5F5F5"),
    body: SafeArea(
      top: false,
      child:Flex(
        direction: Axis.vertical,
        children: <Widget>[
          CustomAppBarWidget("我的订单",(){
            BaseTools.closePage(viewService.context);
          }),

          Expanded(
            flex: 1,
            child: _buildListView(),
          )
        ],
      ),
    ),
  );
}
