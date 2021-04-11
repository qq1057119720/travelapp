import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/order_detail_model.dart';

class GoodsOrderListState implements Cloneable<GoodsOrderListState> {
  List<OrderDetailModel> orderList = List();

  ///页码.
  int pageIndex = 1;

  ///是否有更多.
  bool isMore = false;

  @override
  GoodsOrderListState clone() {
    return GoodsOrderListState()
      ..isMore = isMore
      ..pageIndex = pageIndex
      ..orderList = orderList;
  }
}

GoodsOrderListState initState(Map<String, dynamic> args) {
  return GoodsOrderListState();
}
