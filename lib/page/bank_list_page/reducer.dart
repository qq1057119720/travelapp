import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<BankListState> buildReducer() {
  return asReducer(
    <Object, Reducer<BankListState>>{
      BankListAction.action: _onAction,
      BankListAction.update_account_list: _onUpdateAccountList,
    },
  );
}

BankListState _onAction(BankListState state, Action action) {
  final BankListState newState = state.clone();
  return newState;
}
BankListState _onUpdateAccountList(BankListState state, Action action) {
  final BankListState newState = state.clone();
  newState.accountList=action.payload;
  return newState;
}