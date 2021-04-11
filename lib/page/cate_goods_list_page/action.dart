import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/recommend_goods_model.dart';

//TODO replace with your own action
enum CateGoodListAction {
  action,
  onRefresh,
  onLoadMore,
  initData,
}

class CateGoodListActionCreator {
  static Action onAction() {
    return const Action(CateGoodListAction.action);
  }
  static Action onRefresh() {
    return Action(CateGoodListAction.onRefresh);
  }

  static Action onLoadMore() {
    return Action(CateGoodListAction.onLoadMore);
  }

  static Action initData(
      List<RecommendGoodsModel> newsinfolist, bool isRefresh, pageIndex) {
    return Action(CateGoodListAction.initData, payload: {
      "list": newsinfolist,
      "isRefresh": isRefresh,
      "pageIndex": pageIndex
    });
  }
}
