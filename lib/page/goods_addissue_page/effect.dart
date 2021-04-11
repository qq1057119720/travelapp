import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<GoodsAddissueState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsAddissueState>>{
    GoodsAddissueAction.action: _onAction,
  });
}

void _onAction(Action action, Context<GoodsAddissueState> ctx) {

  if(BaseTools.isEmpty(ctx.state.infoEditController.text)){
    ToastTools.showToast("请输入问题内容");
    return;
  }
  LoadingDialog.showDialog(ctx.context);
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.addIssueContent(userModel.userid, ctx.state.goodsid, ctx
      .state.infoEditController.text,netSuccess: (data){
    BaseTools.closePage(ctx.context);
    ToastTools.showToast("提问成功");
  },netFail: (code,msg){
  BaseTools.closePage(ctx.context);
  ToastTools.showToast(msg);
  },netError: (e){
  BaseTools.closePage(ctx.context);
  });
}
