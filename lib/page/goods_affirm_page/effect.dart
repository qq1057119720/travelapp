import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:fluwx/fluwx.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/create_order_model.dart';
import 'package:travelapp/model/div_wxpay_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter/cupertino.dart' as cup;

Effect<GoodsAffirmState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsAffirmState>>{
    GoodsAffirmAction.action: _onAction,
    GoodsAffirmAction.create_order: _onCreateOrder,
    GoodsAffirmAction.select_address: _toSelectAddress,
  });
}

void _onAction(Action action, Context<GoodsAffirmState> ctx) {}

void _wxpay(String orderNum,Action action, Context<GoodsAffirmState> ctx) async {
  //ctx.state.typeList[ctx.state.selectType-1].nowprice.toString()

  String price="0.01";

  if(ctx.state.goodsModel.categoryid=="1"){
    price="1";
  }else if(ctx.state.goodsModel.categoryid=="2"){
    price="6";
  }

  ApiWork.instance.wxpay(orderNum, price, "支付商品",netSuccess: (data){
    WxPayModel wxPayModel=WxPayModel.fromJson(data);
    payWithWeChat(appId: wxPayModel.appid, partnerId: wxPayModel
        .partnerid, prepayId: wxPayModel.prepayid, packageValue:wxPayModel
        .package, nonceStr: wxPayModel.noncestr,timeStamp: int.parse
      (wxPayModel.timestamp), sign: wxPayModel.sign);
    weChatResponseEventHandler.listen((res) {
      if (res is WeChatPaymentResponse) {
        if(res.isSuccessful){
          // ToastTools.showToast(AppLocalizations.of(ctx.context).zhifuchenggong);
          // _getUserVip(action, ctx);
          ToastTools.showToast("支付成功");
        }else{
          // ToastTools.showToast(AppLocalizations.of(ctx.context).zhifuquxiao);
        }
        println("pay :${res.isSuccessful}");

      }
    });

  });
}

void _ailpay(String orderNum,Action action, Context<GoodsAffirmState> ctx) async {
  //ctx.state.typeList[ctx.state.selectType-1].nowprice.toString()
  String price="0.01";

  if(ctx.state.goodsModel.categoryid=="1"){
    price="1";
  }else if(ctx.state.goodsModel.categoryid=="2"){
    price="6";
  }

  ApiWork.instance.alipay(orderNum,price,
      netSuccess:
      (data)
  async {
    AlipayResult result = await FlutterAlipay.pay(data);
    if(result.resultStatus=="9000"){
      ToastTools.showToast("支付成功");
      // _getUserVip(action, ctx);
    }else{
      // ToastTools.showToast(AppLocalizations.of(ctx.context).zhifuquxiao);
    }
  });
}

void _onCreateOrder(Action action, Context<GoodsAffirmState> ctx) {
  if (ctx.state.addressModel == null) {
    ToastTools.showToast("请选择联系人");

    return;
  }
  if (BaseTools.isEmpty(ctx.state.infoEditController.text)) {
    ToastTools.showToast("请输入备注信息");
    return;
  }
  LoadingDialog.showDialog(ctx.context);

  UserModel userModel = UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.createOrder(
      userModel.userid,
      ctx.state.goodsCount.toString(),
      ctx.state.goodsModel.goodsid,
      (ctx.state.goodsModel.price * ctx.state.goodsCount).toString(),
      ctx.state.payType.toString(),
      ctx.state.infoEditController.text,
      ctx.state.addressModel.province +
          ctx.state.addressModel.city +
          ctx.state.addressModel.zone +
          ctx.state.addressModel.detailedaddress,
      ctx.state.addressModel.contacts,
      ctx.state.addressModel.contactnumber,
      netSuccess: (data) {
        BaseTools.closePage(ctx.context);
        CreateOrderModel createOrderModel=CreateOrderModel.fromJson(data);
        if(ctx.state.payType==2){
          _ailpay(createOrderModel.ordernumber, action, ctx);
        }else{
          _wxpay(createOrderModel.ordernumber, action, ctx);
        }

      },
      netFail: (code, msg) {},
      netError: (e) {});
}

void _toSelectAddress(Action action, Context<GoodsAffirmState> ctx) {
  cup.Navigator.pushNamed(ctx.context, RoutePath.RECEIVER_ADDRESS_PAGE,
      arguments: {"type": "1"}).then((value) {
    if (!BaseTools.isEmpty(value)) {
      ctx.dispatch((GoodsAffirmActionCreator.onUpdateAddress(value)));
    }
  });
}
