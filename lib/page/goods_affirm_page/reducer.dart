import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GoodsAffirmState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsAffirmState>>{
      GoodsAffirmAction.action: _onAction,
      GoodsAffirmAction.update_goodcount: _updateGoodCount,
      GoodsAffirmAction.select_pay_type: _onSelectPayType,
      GoodsAffirmAction.update_address: _onUpdateAddress,
    },
  );
}

GoodsAffirmState _onAction(GoodsAffirmState state, Action action) {
  final GoodsAffirmState newState = state.clone();
  return newState;
}

GoodsAffirmState _updateGoodCount(GoodsAffirmState state, Action action) {
  final GoodsAffirmState newState = state.clone();
  newState.goodsCount=action.payload;
  return newState;
}
GoodsAffirmState _onSelectPayType(GoodsAffirmState state, Action action) {
  final GoodsAffirmState newState = state.clone();
  newState.payType=action.payload;
  return newState;
}

GoodsAffirmState _onUpdateAddress(GoodsAffirmState state, Action action) {
  final GoodsAffirmState newState = state.clone();
  newState.addressModel=action.payload;
  return newState;
}