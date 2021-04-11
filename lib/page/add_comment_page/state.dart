import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:travelapp/model/order_detail_model.dart';

class AddCommentState implements Cloneable<AddCommentState> {
  OrderDetailModel goodsModel;
  TextEditingController infoEditController = TextEditingController();
  FocusNode infoFocusNode = FocusNode();
  List<Asset> images;
  List<PictureList> piclist=List();

  @override
  AddCommentState clone() {
    return AddCommentState()
      ..goodsModel = goodsModel
      ..infoEditController = infoEditController
      ..infoFocusNode = infoFocusNode
      ..images = images
      ..piclist = piclist;
  }
}

AddCommentState initState(Map<String, dynamic> args) {
  AddCommentState state = AddCommentState();
  state.goodsModel = args["order"];
  return state;
}
