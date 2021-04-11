import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:fluwx/fluwx.dart';
import 'package:travelapp/model/div_wxpay_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'action.dart';
import 'state.dart';

Effect<PayOrderState> buildEffect() {
  return combineEffects(<Object, Effect<PayOrderState>>{
    PayOrderAction.action: _onAction,
    PayOrderAction.pay_order: _payOrder,
  });
}

void _onAction(Action action, Context<PayOrderState> ctx) {
}
void _payOrder(Action action, Context<PayOrderState> ctx) {
  if(ctx.state.payType==2){
    _ailpay(ctx.state.goodsModel.ordernumber, action, ctx);
  }else{
    _wxpay(ctx.state.goodsModel.ordernumber, action, ctx);
  }

}
void _wxpay(String orderNum,Action action, Context<PayOrderState> ctx) async {
  //ctx.state.typeList[ctx.state.selectType-1].nowprice.toString()
  ApiWork.instance.wxpay(orderNum, "0.01", "支付商品",netSuccess: (data){
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

void _ailpay(String orderNum,Action action, Context<PayOrderState> ctx) async {
  //ctx.state.typeList[ctx.state.selectType-1].nowprice.toString()
  ApiWork.instance.alipay(orderNum,"0.01",
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