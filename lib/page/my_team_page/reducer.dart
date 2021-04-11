import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/user_lower_level_model.dart';
import 'package:travelapp/utils/base_tools.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyTeamState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyTeamState>>{
      MyTeamAction.action: _onAction,
      MyTeamAction.initData: _initData,
    },
  );
}

MyTeamState _onAction(MyTeamState state, Action action) {
  final MyTeamState newState = state.clone();
  return newState;
}

MyTeamState _initData(MyTeamState state, Action action) {
  final MyTeamState newState = state.clone();
  List<UserLowerLevelModel> newinfolist = action.payload["list"];
  bool isRefresh = action.payload["isRefresh"];
  int pageIndex = action.payload["pageIndex"];

  if (isRefresh) {
    ///刷新.
    newState.pageIndex = pageIndex;
    newState.goodsList = newinfolist;
  } else {
    ///加载更多.
    newState.pageIndex = pageIndex;
    newState.goodsList.addAll(newinfolist);
  }

  ///判断是否还有更多
  newState.isMore = BaseTools.checkMore(newinfolist);

  return newState;
}