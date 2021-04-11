import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';

Effect<VipHomeState> buildEffect() {
  return combineEffects(<Object, Effect<VipHomeState>>{
    Lifecycle.initState: _onAction,
    Lifecycle.deactivate: _onAction,
  });
}

void _onAction(Action action, Context<VipHomeState> ctx) {
  if(UserinfoCacheManager.instance.checkUserLogin()){
    UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
    ctx.dispatch(VipHomeActionCreator.updateUserinfo(userModel));
    getTravelGoodsList("1", ctx);
    getTravelGoodsList("2", ctx);
  }
}

getTravelGoodsList(String categoryid, Context<VipHomeState> ctx) {
  ApiWork.instance.getTravelGoodsList(categoryid, "1", "2", netSuccess: (data) {
    ctx.dispatch(VipHomeActionCreator.updateGoodsList(
        (data as List).map((e) => RecommendGoodsModel.fromJson(e)).toList(),
        categoryid));
  }, netFail: (code, msg) {}, netError: (e) {});
  ApiWork.instance.getUserInfo(UserinfoCacheManager.instance.getUserInfo()
      .userid,netSuccess: (data){
    UserModel userModel=UserModel.fromJson(data);
    UserinfoCacheManager.instance.saveUserInfo(json.encode(userModel));
    ctx.dispatch(VipHomeActionCreator.updateUserinfo(userModel));
  },netFail: (code,msg){

  },netError: (e){

  });

}
