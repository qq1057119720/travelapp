import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' as cup;
import 'package:travelapp/app_route.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/user_bank_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<WithdrawDepositState> buildEffect() {
  return combineEffects(<Object, Effect<WithdrawDepositState>>{
    Lifecycle.initState: _onAction,
    Lifecycle.deactivate: _onAction,
    WithdrawDepositAction.to_add_bank: _onToAddBank,
    WithdrawDepositAction.to_user_withdraw: _toUserWithdraw,
  });
}

void _onAction(Action action, Context<WithdrawDepositState> ctx) {
  _getPersonBankList(action, ctx);
}
//
void _onToAddBank(Action action, Context<WithdrawDepositState> ctx) {
 cup.Navigator.pushNamed(ctx.context, RoutePath.ADD_BANK_PAGE).then((value) {
   _getPersonBankList(action, ctx);
 });
}
void _getPersonBankList(Action action, Context<WithdrawDepositState> ctx) {


  ApiWork.instance.getuserbanklist(UserinfoCacheManager.instance.getUserInfo
    ().userid,
      netSuccess: (data) {
    ctx.dispatch(WithdrawDepositActionCreator.onUpdateAccountList(
        (data as List).map((e) => UserBankModel.fromJson(e)).toList()));
  }, netFail: (code, msg) {}, netError: (e) {});
}
//
void _toUserWithdraw(Action action, Context<WithdrawDepositState> ctx) {
  if(BaseTools.isEmpty(ctx.state.nameEditController.text)){
    ToastTools.showToast("请输入提现金额");
    return;
  }
  if(BaseTools.isEmpty(ctx.state.accountBankModel)){
    ToastTools.showToast("请选择提现银行卡");
    return;
  }

  double txMoney=double.parse(ctx.state.nameEditController.text);
  // if(txMoney%100==0){
  //
  //
  // }else{
  //   ToastTools.showToast("提现金额必须是100的倍数");
  // }

  if(txMoney>ctx.state.walletModel.totalmoney){
    ToastTools.showToast("提现金额不能大于可提现金额");
  }else{
    LoadingDialog.showDialog(ctx.context);
    ApiWork.instance.withdrawDeposit(UserinfoCacheManager.instance
        .getUserInfo().userid, ctx.state
        .accountBankModel
        .bankcardid, ctx.state.nameEditController.text,netSuccess: (data){
      BaseTools.closePage(ctx.context);
      // BaseTools.showToast(ctx.context, "申请成功，请等候审核");
      ToastTools.showToast("申请成功，请等候审核");
    },netFail: (code,msg){
      BaseTools.closePage(ctx.context);
      // BaseTools.showToast(ctx.context, msg);
      ToastTools.showToast(msg);
    },netError: (e){
      BaseTools.closePage(ctx.context);
    });

  }

}

