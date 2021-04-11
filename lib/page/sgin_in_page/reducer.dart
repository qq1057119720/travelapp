import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SginInState> buildReducer() {
  return asReducer(
    <Object, Reducer<SginInState>>{
      SginInAction.action: _onAction,
      SginInAction.update_sginin_list: _updateSgininList,
      SginInAction.update_sgin_task_list: _updateSginTaskList,
    },
  );
}

SginInState _onAction(SginInState state, Action action) {
  final SginInState newState = state.clone();
  return newState;
}

SginInState _updateSgininList(SginInState state, Action action) {
  final SginInState newState = state.clone();
  newState.sginList=action.payload;
  return newState;
}

SginInState _updateSginTaskList(SginInState state, Action action) {
  final SginInState newState = state.clone();
  newState.tasklist=action.payload;
  return newState;
}
