import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/category_model.dart';
import 'package:travelapp/model/home_comment_model.dart';
import 'package:travelapp/model/location_model.dart';
import 'package:travelapp/model/recommend_goods_model.dart';

//TODO replace with your own action
enum HomeAction {
  action,
  update_catelist,
  update_recommend_one,
  update_recommend_two,
  onRefresh,
  onLoadMore,
  initData,
  onRefreshGoods,
  onLoadMoreGoods,
  initDataGoods,
  update_showitem,
  update_location
}

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action updateCatelist(List<CategoryModel> list) {
    return Action(HomeAction.update_catelist, payload: list);
  }

  static Action updateRecommendOne(RecommendGoodsModel model) {
    return Action(HomeAction.update_recommend_one, payload: model);
  }

  static Action updateShowitem(int showitem) {
    return Action(HomeAction.update_showitem, payload: showitem);
  }

  static Action updateRecommendTwo(RecommendGoodsModel model) {
    return Action(HomeAction.update_recommend_two, payload: model);
  }

  static Action updateLocation(LocationModel model) {
    return Action(HomeAction.update_location, payload: model);
  }
  static Action onRefresh() {
    return Action(HomeAction.onRefresh);
  }

  static Action onLoadMore() {
    return Action(HomeAction.onLoadMore);
  }

  static Action initData(
      List<HomeCommentModel> newsinfolist, bool isRefresh, pageIndex) {
    return Action(HomeAction.initData, payload: {
      "list": newsinfolist,
      "isRefresh": isRefresh,
      "pageIndex": pageIndex
    });
  }


  static Action onRefreshGoods() {
    return Action(HomeAction.onRefreshGoods);
  }

  static Action onLoadMoreGoods() {
    return Action(HomeAction.onLoadMoreGoods);
  }

  static Action initDataGoods(
      List<RecommendGoodsModel> newsinfolist, bool isRefresh, pageIndex) {
    return Action(HomeAction.initDataGoods, payload: {
      "list": newsinfolist,
      "isRefresh": isRefresh,
      "pageIndex": pageIndex
    });
  }
}
