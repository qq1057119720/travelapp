import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserIntegralListState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserIntegralListState>>{
      UserIntegralListAction.action: _onAction,
      UserIntegralListAction.update_wallet_list: _updateWalletList,
    },
  );
}

UserIntegralListState _onAction(UserIntegralListState state, Action action) {
  final UserIntegralListState newState = state.clone();
  return newState;
}
UserIntegralListState _updateWalletList(UserIntegralListState state, Action action) {
  final UserIntegralListState newState = state.clone();
  newState.walletlist=action.payload;
  return newState;
}
