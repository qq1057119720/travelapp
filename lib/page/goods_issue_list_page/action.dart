import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/goods_detail_model.dart';

//TODO replace with your own action
enum GoodsIssueListAction {
  action,
  onRefresh,
  onLoadMore,
  initData,
}

class GoodsIssueListActionCreator {
  static Action onAction() {
    return const Action(GoodsIssueListAction.action);
  }
  static Action onRefresh() {
    return Action(GoodsIssueListAction.onRefresh);
  }

  static Action onLoadMore() {
    return Action(GoodsIssueListAction.onLoadMore);
  }

  static Action initData(
      List<Issuecontentlist> newsinfolist, bool isRefresh, pageIndex) {
    return Action(GoodsIssueListAction.initData, payload: {
      "list": newsinfolist,
      "isRefresh": isRefresh,
      "pageIndex": pageIndex
    });
  }

}
