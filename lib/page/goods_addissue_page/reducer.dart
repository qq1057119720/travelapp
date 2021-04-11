import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GoodsAddissueState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsAddissueState>>{
      GoodsAddissueAction.action: _onAction,
    },
  );
}

GoodsAddissueState _onAction(GoodsAddissueState state, Action action) {
  final GoodsAddissueState newState = state.clone();
  return newState;
}
