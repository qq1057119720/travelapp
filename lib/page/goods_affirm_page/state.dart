import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelapp/model/goods_detail_model.dart';
import 'package:travelapp/model/receiver_address_model.dart';

class GoodsAffirmState implements Cloneable<GoodsAffirmState> {
  GoodsDetailModel goodsModel;
  int goodsCount = 1;
  ReceiverAddressModel addressModel;
  int payType = 1;
  TextEditingController infoEditController = TextEditingController();
  FocusNode infoFocusNode = FocusNode();
  @override
  GoodsAffirmState clone() {
    return GoodsAffirmState()
      ..goodsModel = goodsModel
      ..infoEditController = infoEditController
      ..infoFocusNode = infoFocusNode
      ..addressModel = addressModel
      ..payType = payType
      ..goodsCount = goodsCount;
  }
}

GoodsAffirmState initState(Map<String, dynamic> args) {
  GoodsAffirmState state = GoodsAffirmState();
  state.goodsModel = args["goods"];
  return state;
}
