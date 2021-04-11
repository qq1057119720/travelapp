import 'dart:convert';


import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter/cupertino.dart' as cup;

Effect<PasswordLoginState> buildEffect() {
  return combineEffects(<Object, Effect<PasswordLoginState>>{
    PasswordLoginAction.action: _onAction,
    PasswordLoginAction.to_login: _toLogin,
  });
}

void _onAction(Action action, Context<PasswordLoginState> ctx) {
}
void _toLogin(Action action, Context<PasswordLoginState> ctx) {
  if (BaseTools.isEmpty(ctx.state.accoutEditController.text)) {
    ToastTools.showToast("请输入手机号码");
    return;
  }
  if (!BaseTools.isPhone(ctx.state
      .accoutEditController.text)) {
    ToastTools.showToast("手机号码格式不正确");
    return;
  }
  if (BaseTools.isEmpty(ctx.state.passwordEditController.text)) {
    ToastTools.showToast("请输入密码");
    return;
  }
  LoadingDialog.showDialog(ctx.context);

  ApiWork.instance.userLogin(ctx.state.accoutEditController.text, ctx.state
      .passwordEditController.text,netSuccess: (data){
    BaseTools.closePage(ctx.context);
    UserModel userModel=UserModel.fromJson(data);
    UserinfoCacheManager.instance.saveUserInfo(json.encode(userModel));
    UserinfoCacheManager.instance.removeLoginOut();
    ToastTools.showToast("登录成功");
    cup.Navigator.of(ctx.context).pushNamedAndRemoveUntil(
        RoutePath.APP_HOME, (cup.Route<dynamic> route) => false,
        arguments: null);
  },netFail: (code,msg){
    BaseTools.closePage(ctx.context);
    ToastTools.showToast(msg);
  },netError: (e){
    BaseTools.closePage(ctx.context);
  });
}