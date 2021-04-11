import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' as cup;
import 'package:travelapp/app_route.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/user_bank_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';

Effect<BankListState> buildEffect() {
  return combineEffects(<Object, Effect<BankListState>>{
    Lifecycle.initState: _onAction,
    Lifecycle.deactivate: _onAction,
    BankListAction.to_add_new_bank: _onToAddNewBank,
    BankListAction.deleteAccountBank: _deleteAccountBank,
  });
}

void _onAction(Action action, Context<BankListState> ctx) {

  _getPersonBankList(action, ctx);
}
void _onToAddNewBank(Action action, Context<BankListState> ctx) {
 cup.Navigator.pushNamed(ctx.context, RoutePath.ADD_BANK_PAGE);
}
//
void _deleteAccountBank(Action action, Context<BankListState> ctx) {
  ApiWork.instance.deleteBank(action.payload,netSuccess:
      (data) {
        _getPersonBankList(action, ctx);
  }, netFail: (code, msg) {}, netError: (e) {});
}
//
void _getPersonBankList(Action action, Context<BankListState> ctx) {
  ApiWork.instance.getuserbanklist(UserinfoCacheManager.instance.getUserInfo().userid,netSuccess: (data) {
    ctx.dispatch(BankListActionCreator.onUpdateAccountList(
        (data as List).map((e) => UserBankModel.fromJson(e)).toList()));
  }, netFail: (code, msg) {}, netError: (e) {});
}
