import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/goods_detail_model.dart';
import 'package:travelapp/utils/base_tools.dart';

import 'action.dart';
import 'state.dart';

Reducer<GoodsIssueListState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsIssueListState>>{
      GoodsIssueListAction.action: _onAction,
      GoodsIssueListAction.initData: _initData,
    },
  );
}

GoodsIssueListState _onAction(GoodsIssueListState state, Action action) {
  final GoodsIssueListState newState = state.clone();
  return newState;
}
GoodsIssueListState _initData(GoodsIssueListState state, Action action) {
  final GoodsIssueListState newState = state.clone();
  List<Issuecontentlist> newinfolist = action.payload["list"];
  bool isRefresh = action.payload["isRefresh"];
  int pageIndex = action.payload["pageIndex"];

  if (isRefresh) {
    ///刷新.
    newState.pageIndex = pageIndex;
    newState.issuelist = newinfolist;
  } else {
    ///加载更多.
    newState.pageIndex = pageIndex;
    newState.issuelist.addAll(newinfolist);
  }

  ///判断是否还有更多
  newState.isMore = BaseTools.checkMore(newinfolist);
  return newState;
}