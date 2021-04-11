import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RechargeState> buildReducer() {
  return asReducer(
    <Object, Reducer<RechargeState>>{
      RechargeAction.action: _onAction,
      RechargeAction.select_pay_type: _onSelectPayType,
    },
  );
}

RechargeState _onAction(RechargeState state, Action action) {
  final RechargeState newState = state.clone();
  return newState;
}
RechargeState _onSelectPayType(RechargeState state, Action action) {
  final RechargeState newState = state.clone();
  newState.payType=action.payload;
  return newState;
}
