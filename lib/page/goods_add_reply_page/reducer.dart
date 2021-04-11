import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GoodsAddReplyState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsAddReplyState>>{
      GoodsAddReplyAction.action: _onAction,
    },
  );
}

GoodsAddReplyState _onAction(GoodsAddReplyState state, Action action) {
  final GoodsAddReplyState newState = state.clone();
  return newState;
}
