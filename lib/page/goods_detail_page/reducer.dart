import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GoodsDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsDetailState>>{
      GoodsDetailAction.action: _onAction,
      GoodsDetailAction.update_goods_detail: _updateGoodsDetail,
      GoodsDetailAction.update_show_all: _updateShowAll,
      GoodsDetailAction.update_kefumodel: _updateKefumodel,
      GoodsDetailAction.update_yonghumodel: _updateYonghumodel,
    },
  );
}

GoodsDetailState _onAction(GoodsDetailState state, Action action) {
  final GoodsDetailState newState = state.clone();
  return newState;
}

GoodsDetailState _updateGoodsDetail(GoodsDetailState state, Action action) {
  final GoodsDetailState newState = state.clone();
  newState.goodsDetailModel=action.payload;
  println(newState.goodsDetailModel.goodshtml);
  return newState;
}
GoodsDetailState _updateShowAll(GoodsDetailState state, Action action) {
  final GoodsDetailState newState = state.clone();
  newState.showAll=action.payload;
  return newState;
}
GoodsDetailState _updateKefumodel(GoodsDetailState state, Action action) {
  final GoodsDetailState newState = state.clone();
  newState.kefuModel=action.payload;
  return newState;
}

GoodsDetailState _updateYonghumodel(GoodsDetailState state, Action action) {
  final GoodsDetailState newState = state.clone();
  newState.yonghuModel=action.payload;
  return newState;
}
