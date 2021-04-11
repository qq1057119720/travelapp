import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/model/user_wallet_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';

Effect<MyBalanceState> buildEffect() {
  return combineEffects(<Object, Effect<MyBalanceState>>{
   Lifecycle.initState: _onAction,
    Lifecycle.deactivate: _onAction,
  });
}

void _onAction(Action action, Context<MyBalanceState> ctx) {
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.getUserTravelWallet(userModel.userid,netSuccess: (data){
    ctx.dispatch(MyBalanceActionCreator.updateUserwallet(UserWalletModel.fromJson(data)));
  },netFail: (code,msg){

  },netError: (e){

  });
}
