import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/customer_service_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';
import 'package:nim_plugin/nim_plugin.dart';
Effect<AppSettingState> buildEffect() {
  return combineEffects(<Object, Effect<AppSettingState>>{
    Lifecycle.initState: _onAction,
    AppSettingAction.to_chat:_toChat,
  });
}

void _onAction(Action action, Context<AppSettingState> ctx) {
  ApiWork.instance.getCustomerServiceList("1",netSuccess: (data){

    List<CustomerServiceModel> list=(data as List).map((e) =>
        CustomerServiceModel.fromJson(e)).toList();
    ctx.dispatch(AppSettingActionCreator.updateKefumodel(list));
  },netFail: (code,msg){

  },netError: (e){

  });

  ApiWork.instance.getCustomerServiceList("2",netSuccess: (data){

    List<CustomerServiceModel> list=(data as List).map((e) =>
        CustomerServiceModel.fromJson(e)).toList();
    ctx.dispatch(AppSettingActionCreator.updateYonghumodel(list));
    Nim.instance.initImLogin(list[0].accid, list[0].imtoken);
  },netFail: (code,msg){

  },netError: (e){

  });
}
void _toChat(Action action, Context<AppSettingState> ctx) {
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