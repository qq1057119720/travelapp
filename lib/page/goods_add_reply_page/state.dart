import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelapp/model/goods_detail_model.dart';

class GoodsAddReplyState implements Cloneable<GoodsAddReplyState> {
  Issuecontentlist issuecontentlist;
  TextEditingController infoEditController = TextEditingController();
  FocusNode infoFocusNode = FocusNode();

  @override
  GoodsAddReplyState clone() {
    return GoodsAddReplyState()
      ..issuecontentlist = issuecontentlist
      ..infoEditController = infoEditController
      ..infoFocusNode = infoFocusNode;
  }
}

GoodsAddReplyState initState(Map<String, dynamic> args) {
  GoodsAddReplyState state = GoodsAddReplyState();
  state.issuecontentlist = args["data"];
  return state;
}
