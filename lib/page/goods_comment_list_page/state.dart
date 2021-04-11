import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/goods_detail_model.dart';

class GoodsCommentListState implements Cloneable<GoodsCommentListState> {
  String goodsid;
  List<Commentlist> commentlist = List();

  ///页码.
  int pageIndex = 1;

  ///是否有更多.
  bool isMore = false;

  @override
  GoodsCommentListState clone() {
    return GoodsCommentListState()
      ..goodsid = goodsid
      ..commentlist = commentlist
      ..isMore = isMore
      ..pageIndex = pageIndex;
  }
}

GoodsCommentListState initState(Map<String, dynamic> args) {
  GoodsCommentListState state = GoodsCommentListState();
  state.goodsid = args["id"];
  return state;
}
