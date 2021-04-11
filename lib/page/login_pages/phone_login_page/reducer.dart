import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PhoneLoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<PhoneLoginState>>{
      PhoneLoginAction.action: _onAction,
      PhoneLoginAction.update_countdown: _updateCountDown,
    },
  );
}

PhoneLoginState _onAction(PhoneLoginState state, Action action) {
  final PhoneLoginState newState = state.clone();
  return newState;
}
PhoneLoginState _updateCountDown(PhoneLoginState state, Action action) {
  final PhoneLoginState newState = state.clone();
  newState.canGetCode=action.payload[1];
  newState.getCodeTitle=action.payload[0];
  newState.countdownNum=action.payload[2];

  if(newState.canGetCode){
    newState.countdownTimer?.cancel();
    newState.countdownTimer=null;
  }
  return newState;
}