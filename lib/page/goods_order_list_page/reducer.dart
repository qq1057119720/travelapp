import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/order_detail_model.dart';
import 'package:travelapp/utils/base_tools.dart';

import 'action.dart';
import 'state.dart';

Reducer<GoodsOrderListState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsOrderListState>>{
      GoodsOrderListAction.action: _onAction,
      GoodsOrderListAction.initData: _initData,
    },
  );
}

GoodsOrderListState _onAction(GoodsOrderListState state, Action action) {
  final GoodsOrderListState newState = state.clone();
  return newState;
}
GoodsOrderListState _initData(GoodsOrderListState state, Action action) {
  final GoodsOrderListState newState = state.clone();
List<OrderDetailModel> newinfolist = action.payload["list"];
bool isRefresh = action.payload["isRefresh"];
int pageIndex = action.payload["pageIndex"];

if (isRefresh) {
///刷新.
newState.pageIndex = pageIndex;
newState.orderList = newinfolist;
} else {
///加载更多.
newState.pageIndex = pageIndex;
newState.orderList.addAll(newinfolist);
}

///判断是否还有更多
newState.isMore = BaseTools.checkMore(newinfolist);
return newState;
}