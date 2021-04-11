import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/equity_share_record_model.dart';
import 'package:travelapp/model/recommend_goods_model.dart';

//TODO replace with your own action
enum EquityShareAction {
  action,
  onRefresh,
  onLoadMore,
  initData,
}

class EquityShareActionCreator {
  static Action onAction() {
    return const Action(EquityShareAction.action);
  }
  static Action onRefresh() {
    return Action(EquityShareAction.onRefresh);
  }

  static Action onLoadMore() {
    return Action(EquityShareAction.onLoadMore);
  }

  static Action initData(
      List<EquityShareRecordModel> newsinfolist, bool isRefresh, pageIndex) {
    return Action(EquityShareAction.initData, payload: {
      "list": newsinfolist,
      "isRefresh": isRefresh,
      "pageIndex": pageIndex
    });
  }
}
