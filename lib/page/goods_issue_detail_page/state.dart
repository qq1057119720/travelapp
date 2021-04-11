import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/goods_detail_model.dart';
import 'package:travelapp/model/issue_reply_model.dart';

class GoodsIssueDetailState implements Cloneable<GoodsIssueDetailState> {
  Issuecontentlist issuecontentlist;
  List<IssueReplyModel> issuelist = List();

  ///页码.
  int pageIndex = 1;

  ///是否有更多.
  bool isMore = false;

  @override
  GoodsIssueDetailState clone() {
    return GoodsIssueDetailState()
      ..issuecontentlist = issuecontentlist
      ..pageIndex = pageIndex
      ..isMore = isMore
      ..issuelist = issuelist;
  }
}

GoodsIssueDetailState initState(Map<String, dynamic> args) {
  GoodsIssueDetailState state = GoodsIssueDetailState();
  state.issuecontentlist = args["data"];
  return state;
}
