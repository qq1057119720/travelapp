import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/sgin_in_modle.dart';
import 'package:travelapp/model/sgin_in_task_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<SginInState> buildEffect() {
  return combineEffects(<Object, Effect<SginInState>>{
   Lifecycle.initState: _onAction,
   SginInAction.sgin_in: _onSginIn,
  });
}

void _onAction(Action action, Context<SginInState> ctx) {
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.selectWeekSginIn(userModel.userid,netSuccess: (data){
    ctx.dispatch(SginInActionCreator.updateSgininList((data as List).map((e)
    =>SginInModel.fromJson(e)).toList()));
  },netFail: (code,msg){

  },netError: (e){

  });



  ApiWork.instance.getSginInTaskList(netSuccess: (data){
    ctx.dispatch(SginInActionCreator.updateSginTaskList((data as List).map((e)
    =>SginInTaskModel.fromJson(e)).toList()));
  },netFail: (code,msg){

  },netError: (e){

  });
}
void _onSginIn(Action action, Context<SginInState> ctx) {
  LoadingDialog.showDialog(ctx.context);
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.sginIn(userModel.userid,netSuccess: (data){
    BaseTools.closePage(ctx.context);
    ToastTools.showToast("签到成功");
    _onAction(action, ctx);
  },netFail: (code,msg){
    BaseTools.closePage(ctx.context);
    ToastTools.showToast(msg);
  },netError: (e){
    BaseTools.closePage(ctx.context);
  });
}
