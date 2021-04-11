import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SystemInfoDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<SystemInfoDetailState>>{
      SystemInfoDetailAction.action: _onAction,
    },
  );
}

SystemInfoDetailState _onAction(SystemInfoDetailState state, Action action) {
  final SystemInfoDetailState newState = state.clone();
  return newState;
}
