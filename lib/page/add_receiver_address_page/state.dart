import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class AddReceiverAddressState implements Cloneable<AddReceiverAddressState> {
  TextEditingController nameEditController = new TextEditingController();
  FocusNode nameFocusNode = new FocusNode();

  TextEditingController phoneEditController = new TextEditingController();
  FocusNode phoneFocusNode = new FocusNode();

  TextEditingController addressEditController = new TextEditingController();
  FocusNode addressFocusNode = new FocusNode();
  String province;
  String city;
  String zone;
  @override
  AddReceiverAddressState clone() {
    return AddReceiverAddressState()
      ..nameEditController = nameEditController
      ..nameFocusNode = nameFocusNode
      ..phoneEditController = phoneEditController
      ..phoneFocusNode = phoneFocusNode
      ..addressEditController = addressEditController..province=province
      ..city=city..zone=zone
      ..addressFocusNode = addressFocusNode;
  }
}

AddReceiverAddressState initState(Map<String, dynamic> args) {
  return AddReceiverAddressState();
}
