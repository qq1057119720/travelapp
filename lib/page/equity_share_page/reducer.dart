import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/equity_share_record_model.dart';
import 'package:travelapp/utils/base_tools.dart';

import 'action.dart';
import 'state.dart';

Reducer<EquityShareState> buildReducer() {
  return asReducer(
    <Object, Reducer<EquityShareState>>{
      EquityShareAction.action: _onAction,
      EquityShareAction.initData: _initData,
    },
  );
}

EquityShareState _onAction(EquityShareState state, Action action) {
  final EquityShareState newState = state.clone();
  return newState;
}
EquityShareState _initData(EquityShareState state, Action action) {
  final EquityShareState newState = state.clone();
  List<EquityShareRecordModel> newinfolist = action.payload["list"];
  bool isRefresh = action.payload["isRefresh"];
  int pageIndex = action.payload["pageIndex"];

  if (isRefresh) {
    ///刷新.
    newState.pageIndex = pageIndex;
    newState.recordList = newinfolist;
  } else {
    ///加载更多.
    newState.pageIndex = pageIndex;
    newState.recordList.addAll(newinfolist);
  }

  ///判断是否还有更多
  newState.isMore = BaseTools.checkMore(newinfolist);
  return newState;
}