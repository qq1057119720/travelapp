import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/model/wallet_log_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';

Effect<MyBalanceListState> buildEffect() {
  return combineEffects(<Object, Effect<MyBalanceListState>>{
   Lifecycle.initState: _onAction,
  });
}

void _onAction(Action action, Context<MyBalanceListState> ctx) {
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.getTravelWalletLogList(userModel.userid,netSuccess: (data){
    // ctx.dispatch(MyBalanceActionCreator.updateUserwallet(UserWalletModel.fromJson(data)));
        ctx.dispatch(MyBalanceListActionCreator.updateWalletList(    (data as List).map((e) => WalletLogModel.fromJson(e)).toList()
        ));

  },netFail: (code,msg){

  },netError: (e){

  });
}
