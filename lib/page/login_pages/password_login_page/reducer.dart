import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PasswordLoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<PasswordLoginState>>{
      PasswordLoginAction.action: _onAction,
    },
  );
}

PasswordLoginState _onAction(PasswordLoginState state, Action action) {
  final PasswordLoginState newState = state.clone();
  return newState;
}
