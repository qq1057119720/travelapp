import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/recommend_goods_model.dart';

//TODO replace with your own action
enum SearchGoodsAction {
  action,
  onRefresh,
  onLoadMore,
  initData,
  to_search,
}

class SearchGoodsActionCreator {
  static Action onAction() {
    return const Action(SearchGoodsAction.action);
  }
  static Action toSearch() {
    return Action(SearchGoodsAction.to_search);
  }
  static Action onRefresh() {
    return Action(SearchGoodsAction.onRefresh);
  }

  static Action onLoadMore() {
    return Action(SearchGoodsAction.onLoadMore);
  }

  static Action initData(
      List<RecommendGoodsModel> newsinfolist, bool isRefresh, pageIndex) {
    return Action(SearchGoodsAction.initData, payload: {
      "list": newsinfolist,
      "isRefresh": isRefresh,
      "pageIndex": pageIndex
    });
  }
}
