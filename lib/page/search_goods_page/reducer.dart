import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/utils/base_tools.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchGoodsState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchGoodsState>>{
      SearchGoodsAction.action: _onAction,
      SearchGoodsAction.initData: _initData,
    },
  );
}

SearchGoodsState _onAction(SearchGoodsState state, Action action) {
  final SearchGoodsState newState = state.clone();
  return newState;
}
SearchGoodsState _initData(SearchGoodsState state, Action action) {
  final SearchGoodsState newState = state.clone();
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