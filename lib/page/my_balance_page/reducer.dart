import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyBalanceState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyBalanceState>>{
      MyBalanceAction.action: _onAction,
      MyBalanceAction.update_userwallet: _updateUserwallet,
    },
  );
}

MyBalanceState _onAction(MyBalanceState state, Action action) {
  final MyBalanceState newState = state.clone();
  return newState;
}
MyBalanceState _updateUserwallet(MyBalanceState state, Action action) {
  final MyBalanceState newState = state.clone();
  newState.userWalletModel=action.payload;
  return newState;
}
