import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AppSettingState> buildReducer() {
  return asReducer(
    <Object, Reducer<AppSettingState>>{
      AppSettingAction.action: _onAction,
      AppSettingAction.update_kefumodel: _updateKefumodel,
      AppSettingAction.update_yonghumodel: _updateYonghumodel,
    },
  );
}

AppSettingState _onAction(AppSettingState state, Action action) {
  final AppSettingState newState = state.clone();
  return newState;
}
AppSettingState _updateKefumodel(AppSettingState state, Action action) {
  final AppSettingState newState = state.clone();
  newState.kefuModel=action.payload;
  return newState;
}

AppSettingState _updateYonghumodel(AppSettingState state, Action action) {
  final AppSettingState newState = state.clone();
  newState.yonghuModel=action.payload;
  return newState;
}
