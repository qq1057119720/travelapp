import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/customer_service_model.dart';
import 'package:travelapp/model/goods_detail_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:nim_plugin/nim_plugin.dart';
import 'action.dart';
import 'state.dart';

Effect<GoodsDetailState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsDetailState>>{
   Lifecycle.initState: _onAction,
    GoodsDetailAction.to_chat:_toChat,
  });
}

void _onAction(Action action, Context<GoodsDetailState> ctx) {

  ApiWork.instance.getTravelGoodsDetail(ctx.state.goodsid,netSuccess: (data){
    ctx.dispatch(GoodsDetailActionCreator.updateGoodsDetail(GoodsDetailModel.fromJson(data)));
  },netFail: (code,msg){

  },netError: (e){

  });

  ApiWork.instance.getCustomerServiceList("1",netSuccess: (data){

    List<CustomerServiceModel> list=(data as List).map((e) =>
        CustomerServiceModel.fromJson(e)).toList();
    ctx.dispatch(GoodsDetailActionCreator.updateKefumodel(list));
  },netFail: (code,msg){

  },netError: (e){

  });

  ApiWork.instance.getCustomerServiceList("2",netSuccess: (data){

    List<CustomerServiceModel> list=(data as List).map((e) =>
        CustomerServiceModel.fromJson(e)).toList();
    ctx.dispatch(GoodsDetailActionCreator.updateYonghumodel(list));
    Nim.instance.initImLogin(list[0].accid, list[0].imtoken);
  },netFail: (code,msg){

  },netError: (e){

  });
}


void _toChat(Action action, Context<GoodsDetailState> ctx) {
  println("shsohsoshsoishosi");
  if(ctx.state.yonghuModel!=null&&ctx.state.kefuModel!=null){
    Map<String, dynamic> userMap = new Map();
    userMap["accid"] = ctx.state.kefuModel[0].accid;
    userMap["sex"] = "";
    userMap["nickname"] = ctx.state.kefuModel[0].nickname;
    userMap["info"] = "";
    Nim.instance.startChat(userMap).then((map) {
        // Nim.instance.loginOut();
    });
  }
}