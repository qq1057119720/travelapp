import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class RegisterState implements Cloneable<RegisterState> {
  TextEditingController accoutEditController = TextEditingController();
  FocusNode focusNodeAccount = FocusNode();

  TextEditingController passwordEditController = TextEditingController();
  FocusNode focusNodePassword = FocusNode();

  TextEditingController codeEditController = TextEditingController();
  FocusNode focusNodeCode = FocusNode();

  TextEditingController inviteEditController = TextEditingController();
  FocusNode focusNodeInvite = FocusNode();
  String getCodeTitle = "获取验证码"; //获取验证码的title
  bool canGetCode = true; //是否可以点击获取验证码 ture 是可以 false 表示禁止获取
  Timer countdownTimer;
  int countdownNum = 60;

  @override
  RegisterState clone() {
    return RegisterState()
      ..accoutEditController = accoutEditController
      ..inviteEditController = inviteEditController
      ..focusNodeInvite = focusNodeInvite
      ..focusNodeAccount = focusNodeAccount
      ..getCodeTitle = getCodeTitle
      ..canGetCode = canGetCode
      ..countdownTimer = countdownTimer
      ..countdownNum = countdownNum
      ..passwordEditController = passwordEditController
      ..codeEditController = codeEditController
      ..focusNodeCode = focusNodeCode
      ..focusNodePassword;
  }
}

RegisterState initState(Map<String, dynamic> args) {
  return RegisterState();
}
