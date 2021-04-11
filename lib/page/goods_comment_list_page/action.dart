import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/goods_detail_model.dart';

//TODO replace with your own action
enum GoodsCommentListAction {
  action,
  onRefresh,
  onLoadMore,
  initData,
  show_image,
}

class GoodsCommentListActionCreator {
  static Action onAction() {
    return const Action(GoodsCommentListAction.action);
  }

  static Action onRefresh() {
    return Action(GoodsCommentListAction.onRefresh);
  }

  static Action onLoadMore() {
    return Action(GoodsCommentListAction.onLoadMore);
  }

  static Action initData(
      List<Commentlist> newsinfolist, bool isRefresh, pageIndex) {
    return Action(GoodsCommentListAction.initData, payload: {
      "list": newsinfolist,
      "isRefresh": isRefresh,
      "pageIndex": pageIndex
    });
  }

  static Action onShowImage(List<PictureList> picList, int postion) {
    return Action(GoodsCommentListAction.show_image,
        payload: [picList, postion]);
  }
}
