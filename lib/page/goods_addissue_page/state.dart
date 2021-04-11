import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class GoodsAddissueState implements Cloneable<GoodsAddissueState> {
  String goodsid;
  TextEditingController infoEditController = TextEditingController();
  FocusNode infoFocusNode = FocusNode();

  @override
  GoodsAddissueState clone() {
    return GoodsAddissueState()
      ..goodsid = goodsid
      ..infoEditController = infoEditController
      ..infoFocusNode = infoFocusNode;
  }
}

GoodsAddissueState initState(Map<String, dynamic> args) {
  GoodsAddissueState state = GoodsAddissueState();
  state.goodsid = args["id"];
  return state;
}
