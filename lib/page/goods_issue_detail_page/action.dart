import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/issue_reply_model.dart';

//TODO replace with your own action
enum GoodsIssueDetailAction {
  action,
  onRefresh,
  onLoadMore,
  initData,
}

class GoodsIssueDetailActionCreator {
  static Action onAction() {
    return const Action(GoodsIssueDetailAction.action);
  }
  static Action onRefresh() {
    return Action(GoodsIssueDetailAction.onRefresh);
  }

  static Action onLoadMore() {
    return Action(GoodsIssueDetailAction.onLoadMore);
  }

  static Action initData(
      List<IssueReplyModel> newsinfolist, bool isRefresh, pageIndex) {
    return Action(GoodsIssueDetailAction.initData, payload: {
      "list": newsinfolist,
      "isRefresh": isRefresh,
      "pageIndex": pageIndex
    });
  }
}
