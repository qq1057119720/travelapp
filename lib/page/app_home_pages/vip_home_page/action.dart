import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/model/user_model.dart';

//TODO replace with your own action
enum VipHomeAction { action,update_goods_list ,update_userinfo}

class VipHomeActionCreator {
  static Action onAction() {

    return const Action(VipHomeAction.action);
  }

  static Action updateGoodsList( List<RecommendGoodsModel> vipList ,String
  categoryid) {
    return  Action(VipHomeAction.update_goods_list,payload: [categoryid,vipList]);
  }
  static Action updateUserinfo(UserModel userModel) {

    return  Action(VipHomeAction.update_userinfo,payload: userModel);
  }

}
