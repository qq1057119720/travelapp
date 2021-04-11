import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/cache/sp_util.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter/cupertino.dart' as cup;
Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    Lifecycle.initState: _onAction,
  });
}

void _onAction(Action action, Context<SplashState> ctx) async{
  await SpUtil.getInstance();
  UnifiedThemeStyles.setStatusBarWhiteForeground(false);
//  CommectivityUtils.instance.connectivityInitState((){
//    println("网络中断");
//    ToastTools.showToast("网络中断");
//  });
  _startDuration(ctx);
}
void _startDuration(Context<SplashState> ctx){
  ///设置倒计时三秒后执行跳转方法
  var duration = new Duration(seconds: 1);
  new Future.delayed(duration, () {
    if(UserinfoCacheManager.instance.checkUserLogin()){
      bool loginckeck = UserinfoCacheManager.instance.checkLoginOut();
      println(loginckeck.toString()+"-------------");
      if (!loginckeck) {
        cup.Navigator.of(ctx.context).pushNamedAndRemoveUntil(
            RoutePath.APP_HOME, (cup.Route<dynamic> route) => false);
      }else{
        cup.Navigator.of(ctx.context).pushNamedAndRemoveUntil(
            RoutePath.REGISTER_PAGE, (cup.Route<dynamic> route) => false,
            arguments: {"pageIndex":"1"});
      }
    }else{
      cup.Navigator.of(ctx.context).pushNamedAndRemoveUntil(
          RoutePath.REGISTER_PAGE, (cup.Route<dynamic> route) => false,
          arguments: {"pageIndex":"1"});
    }


  });
}
