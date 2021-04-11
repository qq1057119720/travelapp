import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class UpdateUserInfoState implements Cloneable<UpdateUserInfoState> {
  TextEditingController nicknameEditController;
  FocusNode nicknameFocusNode;

  TextEditingController wxEditController;
  FocusNode wxFocusNode;

  TextEditingController qqEditController;
  FocusNode qqFocusNode;

  String userSex;
  String province;
  String city;
  String zone;
  String briday;
  List<Asset> images = new List();

  UpdateUserInfoState() {
    nicknameFocusNode = new FocusNode();
    nicknameEditController = TextEditingController();
    wxEditController = new TextEditingController();
    wxFocusNode = new FocusNode();
    qqEditController = new TextEditingController();
    qqFocusNode = new FocusNode();
    userSex = "男";
    province = "";
    city = "";
    zone = "";
    briday = "";
  }

  @override
  UpdateUserInfoState clone() {
    return UpdateUserInfoState()
      ..nicknameEditController = nicknameEditController
      ..nicknameFocusNode = nicknameFocusNode
      ..userSex = userSex
      ..province = province
      ..city = city
      ..images = images
      ..wxEditController = wxEditController
      ..wxFocusNode = wxFocusNode
      ..qqEditController = qqEditController
      ..qqFocusNode = qqFocusNode
      ..briday = briday
      ..zone = zone;
  }
}

UpdateUserInfoState initState(Map<String, dynamic> args) {
  return UpdateUserInfoState();
}
