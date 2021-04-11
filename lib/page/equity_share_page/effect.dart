import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/equity_share_model.dart';
import 'package:travelapp/model/equity_share_record_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';

Effect<EquityShareState> buildEffect() {
  return combineEffects(<Object, Effect<EquityShareState>>{
   Lifecycle.initState: _onAction,
    EquityShareAction.onRefresh: _onRefresh,
    EquityShareAction.onLoadMore: _onLoadMore,
  });
}

void _onAction(Action action, Context<EquityShareState> ctx) {
  requestData(true, ctx);
}

requestData(bool isRefresh, Context<EquityShareState> ctx) {
  if (isRefresh) {
    ///刷新
    getHomeCommentList(1, ctx, isRefresh);
  } else {
    ///加载更多
    int _pageIndex = isRefresh ? 1 : ctx.state.pageIndex + 1;
    getHomeCommentList(_pageIndex, ctx, isRefresh);
  }
}

getHomeCommentList(int pageIndex, Context<EquityShareState> ctx, bool isRefresh) {
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.getEquityShareRecordList
    (userModel.userid,pageIndex.toString(), "10",
      netSuccess:
          (data){
        ctx.dispatch(
            EquityShareActionCreator.initData((data as List).map((e)=>EquityShareRecordModel
                .fromJson(e)).toList(),
                isRefresh,
                pageIndex));
      },netFail: (code,msg){

      },netError: (e){

      });
}


void _onRefresh(Action action, Context<EquityShareState> ctx) async =>
    await requestData(true, ctx);

void _onLoadMore(Action action, Context<EquityShareState> ctx) async =>
    await requestData(false, ctx);