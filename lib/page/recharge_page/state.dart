import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class RechargeState implements Cloneable<RechargeState> {
  TextEditingController moneyController = TextEditingController();

  FocusNode moneyNode = FocusNode();
  int payType = 1;
  @override
  RechargeState clone() {
    return RechargeState()
      ..moneyController = moneyController..payType=payType
      ..moneyNode = moneyNode;
  }
}

RechargeState initState(Map<String, dynamic> args) {
  return RechargeState();
}
