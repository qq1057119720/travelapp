import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/user_lower_level_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'action.dart';
import 'state.dart';

Effect<MyTeamState> buildEffect() {
  return combineEffects(<Object, Effect<MyTeamState>>{
   Lifecycle.initState: _onAction,
    MyTeamAction.onRefresh: _onRefresh,
    MyTeamAction.onLoadMore: _onLoadMore,
  });
}

void _onAction(Action action, Context<MyTeamState> ctx) {
  // if(UserinfoCacheManager.instance.checkUserLogin()) {
  //   ctx.dispatch(MyTeamActionCreator.onUpdatePersonModel(
  //       UserinfoCacheManager.instance.getUserInfo()));
  //    requestData(true, ctx);
  // }
     requestData(true, ctx);

}


requestData(bool isRefresh, Context<MyTeamState> ctx) {
  if (isRefresh) {
    ///刷新
    selectUserRelation(1, ctx, isRefresh);
  } else {
    ///加载更多
    int _pageIndex = isRefresh ? 1 : ctx.state.pageIndex + 1;
    selectUserRelation(_pageIndex, ctx, isRefresh);
  }
}

selectUserRelation(int pageIndex, Context<MyTeamState> ctx, bool isRefresh) {
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.getUserRelationshipList(userModel.userid,pageIndex
      .toString(), "1"
      "0",netSuccess: (data){
    ctx.dispatch(
        MyTeamActionCreator.initData((data as List).map((e)=>UserLowerLevelModel
            .fromJson(e)).toList(),
            isRefresh,
            pageIndex));
  },netFail: (code,msg){
    if(pageIndex==1){
      // ToastTools.showToast("暂无旅客，前去分享获取吧");
    }
  },netError: (e){

  });
}

void _onRefresh(Action action, Context<MyTeamState> ctx) async =>
    await requestData(true, ctx);

void _onLoadMore(Action action, Context<MyTeamState> ctx) async =>
    await requestData(false, ctx);
