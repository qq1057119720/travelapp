import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MineState> buildReducer() {
  return asReducer(
    <Object, Reducer<MineState>>{
      MineAction.action: _onAction,
      MineAction.update_userwallet: _updateUserwallet,
      MineAction.update_jifen: _updateJifen,
      MineAction.update_userinfo: _updateUserinfo,
      MineAction.update_equity_share: _updateEquityShare,
    },

  );
}

MineState _onAction(MineState state, Action action) {
  final MineState newState = state.clone();
  return newState;
}
MineState _updateUserwallet(MineState state, Action action) {
  final MineState newState = state.clone();
  newState.userWalletModel=action.payload;
  return newState;
}
MineState _updateJifen(MineState state, Action action) {
  final MineState newState = state.clone();
  newState.jifen=action.payload;
  return newState;
}
MineState _updateUserinfo(MineState state, Action action) {
  final MineState newState = state.clone();
  newState.userModel=action.payload;
  return newState;
}
MineState _updateEquityShare(MineState state, Action action) {
  final MineState newState = state.clone();
  newState.equityShareModel=action.payload;
  return newState;
}
