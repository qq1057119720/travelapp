import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/equity_share_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/model/user_wallet_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';

Effect<MineState> buildEffect() {
  return combineEffects(<Object, Effect<MineState>>{
  Lifecycle.initState: _onAction,
    Lifecycle.deactivate: _onAction,
  });
}

void _onAction(Action action, Context<MineState> ctx) {

  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ctx.dispatch(MineActionCreator.updateUserinfo(userModel));
  ApiWork.instance.getUserTravelWallet(userModel.userid,netSuccess: (data){
    ctx.dispatch(MineActionCreator.updateUserwallet(UserWalletModel.fromJson(data)));
  },netFail: (code,msg){

  },netError: (e){

  });
  
  ApiWork.instance.getUserIntegralCount(userModel.userid,netSuccess: (data){
    ctx.dispatch(MineActionCreator.updateJifen(data.toString()));
  },netFail: (code,msg){

  },netError: (e){

  });

  ApiWork.instance.getUserInfo(UserinfoCacheManager.instance.getUserInfo()
      .userid,netSuccess: (data){
    UserModel userModel=UserModel.fromJson(data);
    UserinfoCacheManager.instance.saveUserInfo(json.encode(userModel));
    ctx.dispatch(MineActionCreator.updateUserinfo(userModel));
  },netFail: (code,msg){

  },netError: (e){

  });
  ApiWork.instance.getUserEquityShares(userModel.userid,netSuccess: (data){

    List<EquityShareModel> list=(data as List).map((e)=>EquityShareModel
        .fromJson(e)).toList();
    ctx.dispatch(MineActionCreator.updateEquityShare(list[0]));
  },netFail: (code,msg){

  },netError: (e){

  });
}
