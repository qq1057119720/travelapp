import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/goods_detail_model.dart';
import 'package:travelapp/utils/base_tools.dart';

import 'action.dart';
import 'state.dart';

Reducer<GoodsCommentListState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsCommentListState>>{
      GoodsCommentListAction.action: _onAction,
      GoodsCommentListAction.initData: _initData,
    },
  );
}

GoodsCommentListState _onAction(GoodsCommentListState state, Action action) {
  final GoodsCommentListState newState = state.clone();
  return newState;
}
GoodsCommentListState _initData(GoodsCommentListState state, Action action) {
  final GoodsCommentListState newState = state.clone();
  List<Commentlist> newinfolist = action.payload["list"];
  bool isRefresh = action.payload["isRefresh"];
  int pageIndex = action.payload["pageIndex"];

  if (isRefresh) {
    ///刷新.
    newState.pageIndex = pageIndex;
    newState.commentlist = newinfolist;
  } else {
    ///加载更多.
    newState.pageIndex = pageIndex;
    newState.commentlist.addAll(newinfolist);
  }

  ///判断是否还有更多
  newState.isMore = BaseTools.checkMore(newinfolist);
  return newState;
}