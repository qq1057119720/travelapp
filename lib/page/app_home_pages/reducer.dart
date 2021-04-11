import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AppHomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<AppHomeState>>{
      AppHomeAction.action: _onAction,
    },
  );
}

AppHomeState _onAction(AppHomeState state, Action action) {
  final AppHomeState newState = state.clone();
  return newState;
}
