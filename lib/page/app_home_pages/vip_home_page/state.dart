import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/model/user_model.dart';

class VipHomeState implements Cloneable<VipHomeState> {
  List<RecommendGoodsModel> vipList = List();
  List<RecommendGoodsModel> dailiList = List();
  UserModel userModel;
  @override
  VipHomeState clone() {
    return VipHomeState()
      ..vipList = vipList..userModel=userModel
      ..dailiList = dailiList;
  }
}

VipHomeState initState(Map<String, dynamic> args) {
  return VipHomeState();
}
