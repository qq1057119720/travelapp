import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class FeedBackState implements Cloneable<FeedBackState> {
  List<Asset> images = new List();
  List<String> webImageList = new List();
  TextEditingController contentEditController = new TextEditingController();
  FocusNode contentFocusNode = new FocusNode();

  @override
  FeedBackState clone() {
    return FeedBackState()..images=images..webImageList=webImageList
      ..contentEditController=contentEditController..contentFocusNode=contentFocusNode;
  }
}

FeedBackState initState(Map<String, dynamic> args) {
  return FeedBackState();
}
