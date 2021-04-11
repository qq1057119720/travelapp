import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/recommend_goods_model.dart';

class CateGoodListState implements Cloneable<CateGoodListState> {
  String categoryid;
  String categorytitle;
  List<RecommendGoodsModel> recommendList = List();

  ///页码.
  int pageIndex = 1;

  ///是否有更多.
  bool isMore = false;

  @override
  CateGoodListState clone() {
    return CateGoodListState()
      ..categoryid = categoryid
      ..isMore = isMore
      ..pageIndex = pageIndex
      ..recommendList = recommendList
      ..categorytitle = categorytitle;
  }
}

CateGoodListState initState(Map<String, dynamic> args) {
  CateGoodListState state = CateGoodListState();
  state.categorytitle = args["title"];
  state.categoryid = args["id"];
  return state;
}
