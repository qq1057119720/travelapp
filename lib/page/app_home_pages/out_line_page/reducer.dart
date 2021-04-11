import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<OutLineState> buildReducer() {
  return asReducer(
    <Object, Reducer<OutLineState>>{
      OutLineAction.action: _onAction,
    },
  );
}

OutLineState _onAction(OutLineState state, Action action) {
  final OutLineState newState = state.clone();
  return newState;
}
