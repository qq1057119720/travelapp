import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SystemInfoListState> buildReducer() {
  return asReducer(
    <Object, Reducer<SystemInfoListState>>{
      SystemInfoListAction.action: _onAction,
      SystemInfoListAction.update_system_info: _updateSystemInfo,
    },
  );
}

SystemInfoListState _onAction(SystemInfoListState state, Action action) {
  final SystemInfoListState newState = state.clone();
  return newState;
}

SystemInfoListState _updateSystemInfo(SystemInfoListState state, Action action) {
  final SystemInfoListState newState = state.clone();
  newState.list=action.payload;
  return newState;
}
