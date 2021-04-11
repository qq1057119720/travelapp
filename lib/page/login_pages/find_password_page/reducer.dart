import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FindPasswordState> buildReducer() {
  return asReducer(
    <Object, Reducer<FindPasswordState>>{
      FindPasswordAction.action: _onAction,
      FindPasswordAction.update_countdown: _updateCountDown,
    },
  );
}

FindPasswordState _onAction(FindPasswordState state, Action action) {
  final FindPasswordState newState = state.clone();
  return newState;
}
FindPasswordState _updateCountDown(FindPasswordState state, Action action) {
  final FindPasswordState newState = state.clone();
  newState.canGetCode=action.payload[1];
  newState.getCodeTitle=action.payload[0];
  newState.countdownNum=action.payload[2];

  if(newState.canGetCode){
    newState.countdownTimer?.cancel();
    newState.countdownTimer=null;
  }
  return newState;
}