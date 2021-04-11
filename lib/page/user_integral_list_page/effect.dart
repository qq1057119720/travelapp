import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/user_integral_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';

Effect<UserIntegralListState> buildEffect() {
  return combineEffects(<Object, Effect<UserIntegralListState>>{
 Lifecycle.initState: _onAction,
  });
}

void _onAction(Action action, Context<UserIntegralListState> ctx) {
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.getUserIntegralList(userModel.userid,netSuccess: (data){
    // ctx.dispatch(MyBalanceActionCreator.updateUserwallet(UserWalletModel.fromJson(data)));
    ctx.dispatch(UserIntegralListActionCreator.updateWalletList(    (data as List).map((e) =>
        UserIntegralModel.fromJson(e)).toList()
    ));

  },netFail: (code,msg){

  },netError: (e){

  });
}
