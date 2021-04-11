import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/utils/base_tools.dart';

import 'action.dart';
import 'state.dart';

Reducer<CateGoodListState> buildReducer() {
  return asReducer(
    <Object, Reducer<CateGoodListState>>{
      CateGoodListAction.action: _onAction,
      CateGoodListAction.initData: _initData,
    },
  );
}

CateGoodListState _onAction(CateGoodListState state, Action action) {
  final CateGoodListState newState = state.clone();
  return newState;
}
CateGoodListState _initData(CateGoodListState state, Action action) {
  final CateGoodListState newState = state.clone();
  List<RecommendGoodsModel> newinfolist = action.payload["list"];
  bool isRefresh = action.payload["isRefresh"];
  int pageIndex = action.payload["pageIndex"];

  if (isRefresh) {
    ///刷新.
    newState.pageIndex = pageIndex;
    newState.recommendList = newinfolist;
  } else {
    ///加载更多.
    newState.pageIndex = pageIndex;
    newState.recommendList.addAll(newinfolist);
  }

  ///判断是否还有更多
  newState.isMore = BaseTools.checkMore(newinfolist);
  return newState;
}