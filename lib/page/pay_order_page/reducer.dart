import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PayOrderState> buildReducer() {
  return asReducer(
    <Object, Reducer<PayOrderState>>{
      PayOrderAction.action: _onAction,
      PayOrderAction.select_pay_type: _onSelectPayType,
    },
  );
}

PayOrderState _onAction(PayOrderState state, Action action) {
  final PayOrderState newState = state.clone();
  return newState;
}
PayOrderState _onSelectPayType(PayOrderState state, Action action) {
  final PayOrderState newState = state.clone();
  newState.payType=action.payload;
  return newState;
}
