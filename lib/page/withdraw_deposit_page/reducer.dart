import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WithdrawDepositState> buildReducer() {
  return asReducer(
    <Object, Reducer<WithdrawDepositState>>{
      WithdrawDepositAction.action: _onAction,
      WithdrawDepositAction.update_account_list: _onUpdateAccountList,
      WithdrawDepositAction.update_select_bank: _onUpdateBank,
    },
  );
}

WithdrawDepositState _onAction(WithdrawDepositState state, Action action) {
  final WithdrawDepositState newState = state.clone();
  return newState;
}
WithdrawDepositState _onUpdateAccountList(WithdrawDepositState state, Action action) {
  final WithdrawDepositState newState = state.clone();
  newState.accountList=action.payload;
  return newState;
}
//
WithdrawDepositState _onUpdateBank(WithdrawDepositState state, Action action) {
  final WithdrawDepositState newState = state.clone();
  newState.accountBankModel=action.payload;
  return newState;
}