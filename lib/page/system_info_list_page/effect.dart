import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/system_info_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';

Effect<SystemInfoListState> buildEffect() {
  return combineEffects(<Object, Effect<SystemInfoListState>>{
    Lifecycle.initState: _onAction,
  });
}

void _onAction(Action action, Context<SystemInfoListState> ctx) {
  ApiWork.instance.getTravelSystemInfoList(netSuccess: (data){
    ctx.dispatch(SystemInfoListActionCreator.updateSystemInfo((data as List)
        .map((e)=>SystemInfoModel.fromJson(e)).toList()));
  },netFail: (code,msg){

  },netError: (e){

  });
}
