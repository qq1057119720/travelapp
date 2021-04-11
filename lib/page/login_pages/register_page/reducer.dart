import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RegisterState> buildReducer() {
  return asReducer(
    <Object, Reducer<RegisterState>>{
      RegisterAction.action: _onAction,
      RegisterAction.update_countdown: _updateCountDown,
    },
  );
}

RegisterState _onAction(RegisterState state, Action action) {
  final RegisterState newState = state.clone();
  return newState;
}
RegisterState _updateCountDown(RegisterState state, Action action) {
  final RegisterState newState = state.clone();
  newState.canGetCode=action.payload[1];
  newState.getCodeTitle=action.payload[0];
  newState.countdownNum=action.payload[2];

  if(newState.canGetCode){
    newState.countdownTimer?.cancel();
    newState.countdownTimer=null;
  }
  return newState;
}