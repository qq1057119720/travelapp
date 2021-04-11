import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyPromotionState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyPromotionState>>{
      MyPromotionAction.action: _onAction,
    },
  );
}

MyPromotionState _onAction(MyPromotionState state, Action action) {
  final MyPromotionState newState = state.clone();
  return newState;
}
