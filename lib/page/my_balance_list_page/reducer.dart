import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyBalanceListState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyBalanceListState>>{
      MyBalanceListAction.action: _onAction,
      MyBalanceListAction.update_wallet_list: _updateWalletList,
    },
  );
}

MyBalanceListState _onAction(MyBalanceListState state, Action action) {
  final MyBalanceListState newState = state.clone();
  return newState;
}

MyBalanceListState _updateWalletList(MyBalanceListState state, Action action) {
  final MyBalanceListState newState = state.clone();
  newState.walletlist=action.payload;
  return newState;
}
