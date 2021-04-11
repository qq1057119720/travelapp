import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelapp/utils/base_tools.dart';

class PhoneLoginState implements Cloneable<PhoneLoginState> {
  TextEditingController accoutEditController= TextEditingController();
  FocusNode focusNodeAccount= FocusNode();

  TextEditingController passwordEditController = TextEditingController();
  FocusNode focusNodePassword = FocusNode();
  String getCodeTitle = "获取验证码"; //获取验证码的title
  bool canGetCode = true; //是否可以点击获取验证码 ture 是可以 false 表示禁止获取
  Timer countdownTimer;
  int countdownNum = 60;
  String pageIndex;
  @override
  PhoneLoginState clone() {
    return PhoneLoginState()
      ..accoutEditController = accoutEditController
      ..focusNodeAccount = focusNodeAccount
      ..getCodeTitle = getCodeTitle
      ..canGetCode = canGetCode
      ..countdownTimer = countdownTimer..pageIndex=pageIndex
      ..countdownNum = countdownNum
      ..passwordEditController = passwordEditController
      ..focusNodePassword;
  }
}

PhoneLoginState initState(Map<String, dynamic> args) {
  PhoneLoginState state=PhoneLoginState();
  if(args!=null&&!BaseTools.isEmpty(args["pageIndex"])){
    state.pageIndex=args["pageIndex"];
  }
  return state;
}
