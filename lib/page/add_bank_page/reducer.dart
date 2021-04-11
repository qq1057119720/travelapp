import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AddBankState> buildReducer() {
  return asReducer(
    <Object, Reducer<AddBankState>>{
      AddBankAction.action: _onAction,
      AddBankAction.update_bank_list: _onUpdateBankList,
      AddBankAction.update_bank: _onUpdateBank,
    },
  );
}

AddBankState _onAction(AddBankState state, Action action) {
  final AddBankState newState = state.clone();
  return newState;
}
AddBankState _onUpdateBankList(AddBankState state, Action action) {
  final AddBankState newState = state.clone();
  newState.bankList=action.payload;
  return newState;
}
//
AddBankState _onUpdateBank(AddBankState state, Action action) {
  final AddBankState newState = state.clone();
  newState.bankModel=action.payload;
  return newState;
}