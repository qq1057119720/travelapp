import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/issue_reply_model.dart';
import 'package:travelapp/utils/base_tools.dart';

import 'action.dart';
import 'state.dart';

Reducer<GoodsIssueDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<GoodsIssueDetailState>>{
      GoodsIssueDetailAction.action: _onAction,
      GoodsIssueDetailAction.initData: _initData,
    },
  );
}

GoodsIssueDetailState _onAction(GoodsIssueDetailState state, Action action) {
  final GoodsIssueDetailState newState = state.clone();
  return newState;
}
GoodsIssueDetailState _initData(GoodsIssueDetailState state, Action action) {
  final GoodsIssueDetailState newState = state.clone();
  List<IssueReplyModel> newinfolist = action.payload["list"];
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