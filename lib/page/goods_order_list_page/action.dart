import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/order_detail_model.dart';

//TODO replace with your own action
enum GoodsOrderListAction {
  action,
  onRefresh,
  onLoadMore,
  initData,
  updateOrder,
}

class GoodsOrderListActionCreator {
  static Action onAction() {
    return const Action(GoodsOrderListAction.action);
  }

  static Action onRefresh() {
    return Action(GoodsOrderListAction.onRefresh);
  }

  static Action onLoadMore() {
    return Action(GoodsOrderListAction.onLoadMore);
  }

  static Action updateOrder(String status,String orderid,String msg) {
    return Action(GoodsOrderListAction.updateOrder,payload: [status,orderid,
      msg]);
  }

  static Action initData(
      List<OrderDetailModel> newsinfolist, bool isRefresh, pageIndex) {
    return Action(GoodsOrderListAction.initData, payload: {
      "list": newsinfolist,
      "isRefresh": isRefresh,
      "pageIndex": pageIndex
    });
  }
}
