import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:fluwx/fluwx.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/div_wxpay_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<RechargeState> buildEffect() {
  return combineEffects(<Object, Effect<RechargeState>>{
    RechargeAction.action: _onAction,
  });
}

void _wxpay(String orderNum,Action action, Context<RechargeState> ctx) async {
  //ctx.state.typeList[ctx.state.selectType-1].nowprice.toString()

  String price="0.01";



  ApiWork.instance.wxpay(orderNum, price, "支付商品",netSuccess: (data){
    WxPayModel wxPayModel=WxPayModel.fromJson(data);
    BaseTools.closePage(ctx.context);
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

void _ailpay(String orderNum,Action action, Context<RechargeState> ctx) async {
  //ctx.state.typeList[ctx.state.selectType-1].nowprice.toString()
  String price="0.01";

  ApiWork.instance.alipay(orderNum,price,
      netSuccess:
          (data)
      async {
    BaseTools.closePage(ctx.context);
        AlipayResult result = await FlutterAlipay.pay(data);
        if(result.resultStatus=="9000"){
          ToastTools.showToast("支付成功");
          // _getUserVip(action, ctx);
        }else{
          // ToastTools.showToast(AppLocalizations.of(ctx.context).zhifuquxiao);
        }
      });
}


void _onAction(Action action, Context<RechargeState> ctx) {

  if(BaseTools.isEmpty(ctx.state.moneyController.text)){
    ToastTools.showToast("请输入充值金额");
    return;
  }

  LoadingDialog.showDialog(ctx.context);

  ApiWork.instance.recharge(UserinfoCacheManager.instance.getUserInfo().userid, ctx.state.moneyController.text,netSuccess: (data){
    if(ctx.state.payType==2){
      _ailpay(data["recordnumber"], action, ctx);
    }else{
      _wxpay(data["recordnumber"], action, ctx);
    }

  },netFail: (code,msg){
    BaseTools.closePage(ctx.context);
    ToastTools.showToast(msg);
  },netError: (e){
    BaseTools.closePage(ctx.context);

  });
}
