import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/order_detail_model.dart';

class PayOrderState implements Cloneable<PayOrderState> {
  OrderDetailModel goodsModel;
  int payType = 1;

  @override
  PayOrderState clone() {
    return PayOrderState()
      ..goodsModel = goodsModel
      ..payType = payType;
  }
}

PayOrderState initState(Map<String, dynamic> args) {
  PayOrderState state = PayOrderState();
  state.goodsModel = args["order"];
  return state;
}
