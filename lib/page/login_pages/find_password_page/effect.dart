import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/log_utils.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart' as cup;
Effect<FindPasswordState> buildEffect() {
  return combineEffects(<Object, Effect<FindPasswordState>>{
    FindPasswordAction.action: _onAction,
    FindPasswordAction.get_code: _onGetCode,
  });
}

void _onAction(Action action, Context<FindPasswordState> ctx) {
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
    ToastTools.showToast("请输入验证码");
    return;
  }
  LoadingDialog.showDialog(ctx.context);

  ApiWork.instance.userCodeLogin(ctx.state.accoutEditController.text, ctx.state.passwordEditController.text,netSuccess: (data){
    BaseTools.closePage(ctx.context);
    ToastTools.showToast("重置成功");
    // cup.Navigator.of(ctx.context).pushNamedAndRemoveUntil(
    //     RoutePath.REGISTER_PAGE, (cup.Route<dynamic> route) => false,
    //     arguments: null);
  },netFail: (code,msg){
    BaseTools.closePage(ctx.context);
    ToastTools.showToast(msg);
  },netError: (e){
    BaseTools.closePage(ctx.context);
  });
}

void _onGetCode(Action action, Context<FindPasswordState> ctx) {
  if (BaseTools.isEmpty(ctx.state.accoutEditController.text)) {
    ToastTools.showToast("请输入手机号码");
    return;
  }
  if (!BaseTools.isPhone(ctx.state
      .accoutEditController.text)) {
    ToastTools.showToast("手机号码格式不正确");
    return;
  }

  ApiWork.instance.sendSmsCode( ctx.state.accoutEditController
      .text, "3",netSuccess: (data){
    ToastTools.showToast("发送成功");
    _countDown(action, ctx);
  },netFail: (code,msg){
    ToastTools.showToast(msg);
  },netError: (e){

  });
}
void _countDown(Action action, Context<FindPasswordState> ctx) {
  ctx.state.countdownTimer =
  new Timer.periodic(new Duration(seconds: 1), (timer) {
    LogUtil.v("更新时间______________" + ctx.state.countdownNum.toString());
    if (ctx.state.countdownNum > 0) {
      ctx.dispatch(FindPasswordActionCreator.onUpdateCountDown(
          '${ctx.state.countdownNum - 1}S', false, ctx.state.countdownNum - 1));
    } else {
      ctx.dispatch(FindPasswordActionCreator.onUpdateCountDown("重新获取", true,
              60));
    }
  });
}