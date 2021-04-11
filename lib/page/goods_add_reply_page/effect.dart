import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<GoodsAddReplyState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsAddReplyState>>{
    GoodsAddReplyAction.action: _onAction,
  });
}

void _onAction(Action action, Context<GoodsAddReplyState> ctx) {

  if(BaseTools.isEmpty(ctx.state.infoEditController.text)){
    ToastTools.showToast("请输入回答内容");
    return;
  }
  LoadingDialog.showDialog(ctx.context);
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.addIssueReply(userModel.userid, ctx.state
      .infoEditController.text, ctx.state.issuecontentlist.issuecontentid,
      ctx.state.issuecontentlist.replycount.toString(),netSuccess: (data){
        BaseTools.closePage(ctx.context);
        ToastTools.showToast("回答成功");
      },netFail: (code,msg){
        BaseTools.closePage(ctx.context);
        ToastTools.showToast(msg);
      },netError: (e){
        BaseTools.closePage(ctx.context);
      });
}
