import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/bank_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<AddBankState> buildEffect() {
  return combineEffects(<Object, Effect<AddBankState>>{
    Lifecycle.initState: _onAction,
    AddBankAction.to_add_bank: _onToAddBank,
  });
}

void _onAction(Action action, Context<AddBankState> ctx) {
  ApiWork.instance.getBankList(netSuccess: (data){
    // ctx.dispatch(MyBalanceActionCreator.updateUserwallet(UserWalletModel.fromJson(data)));
    ctx.dispatch(AddBankActionCreator.onUpdateBankList(    (data as List).map((e) =>
        BankModel.fromJson(e)).toList()
    ));
  },netFail: (code,msg){

  },netError: (e){

  });
}
//
void _onToAddBank(Action action, Context<AddBankState> ctx) {

  if(BaseTools.isEmpty(ctx.state.accNameEditController.text)){
    ToastTools.showToast( "请输入开户名称");
    return;
  }
  if(BaseTools.isEmpty(ctx.state.accPhoneEditController.text)){
    ToastTools.showToast( "请输入预留手机号码");
    return;
  }

  if(!BaseTools.isPhone(ctx.state.accPhoneEditController.text)){
    ToastTools.showToast( "手机号码不正确，请重新输入");
    return;
  }
  if(BaseTools.isEmpty(ctx.state.bankNumEditController.text)){
    ToastTools.showToast( "请输入银行卡号");
    return;
  }

  if(BaseTools.isEmpty(ctx.state.bankSubEditController.text)){
    ToastTools.showToast( "请输入开户行支行");
    return;
  }
  if(BaseTools.isEmpty(ctx.state.bankModel)){
    ToastTools.showToast( "请选择开户行");
    return;
  }
  LoadingDialog.showDialog(ctx.context);

  ApiWork.instance.bindbankcard(UserinfoCacheManager.instance.getUserInfo().userid,
      ctx.state.bankModel.name,
      ctx.state.accNameEditController.text,
      ctx.state.accPhoneEditController.text,
     "", ctx.state.bankSubEditController.text,
      ctx.state.bankNumEditController.text,
      netSuccess: (data){
        BaseTools.closePage(ctx.context);
        ToastTools.showToast( "绑定成功");
      },netFail: (code,msg){
        BaseTools.closePage(ctx.context);
        ToastTools.showToast( msg);
      },netError: (e){
        BaseTools.closePage(ctx.context);
      });


}