import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/customer_service_model.dart';
import 'package:travelapp/model/goods_detail_model.dart';

class GoodsDetailState implements Cloneable<GoodsDetailState> {
  String goodsid;
  GoodsDetailModel goodsDetailModel;
  int showAll = 0;
  List<CustomerServiceModel> kefuModel=List();
  List<CustomerServiceModel> yonghuModel=List();

  @override
  GoodsDetailState clone() {
    return GoodsDetailState()
      ..goodsid = goodsid
      ..showAll = showAll
      ..kefuModel = kefuModel
      ..yonghuModel = yonghuModel
      ..goodsDetailModel = goodsDetailModel;
  }
}

GoodsDetailState initState(Map<String, dynamic> args) {
  GoodsDetailState state = GoodsDetailState();
  state.goodsid = args["goodsid"];
  return state;
}
