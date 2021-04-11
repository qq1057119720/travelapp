import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AboutUsState> buildReducer() {
  return asReducer(
    <Object, Reducer<AboutUsState>>{
      AboutUsAction.action: _onAction,
    },
  );
}

AboutUsState _onAction(AboutUsState state, Action action) {
  final AboutUsState newState = state.clone();
  return newState;
}
