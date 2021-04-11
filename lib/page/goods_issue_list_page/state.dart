import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/goods_detail_model.dart';

class GoodsIssueListState implements Cloneable<GoodsIssueListState> {
  String goodsid;
  List<Issuecontentlist> issuelist = List();

  ///页码.
  int pageIndex = 1;

  ///是否有更多.
  bool isMore = false;

  @override
  GoodsIssueListState clone() {
    return GoodsIssueListState()
      ..goodsid = goodsid
      ..isMore = isMore
      ..pageIndex = pageIndex
      ..issuelist = issuelist;
  }
}

GoodsIssueListState initState(Map<String, dynamic> args) {
  GoodsIssueListState state = GoodsIssueListState();
  state.goodsid = args["id"];
  return state;
}
