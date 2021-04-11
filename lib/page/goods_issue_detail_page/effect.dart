import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/issue_reply_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';

Effect<GoodsIssueDetailState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsIssueDetailState>>{
    Lifecycle.initState: _onAction,
    Lifecycle.deactivate: _onAction,
    GoodsIssueDetailAction.onRefresh: _onRefresh,
    GoodsIssueDetailAction.onLoadMore: _onLoadMore,
  });
}

void _onAction(Action action, Context<GoodsIssueDetailState> ctx) {
 requestData(true, ctx);
}

requestData(bool isRefresh, Context<GoodsIssueDetailState> ctx) {
  if (isRefresh) {
    ///刷新
    getIssueReplyByContent(1, ctx, isRefresh);
  } else {
    ///加载更多
    int _pageIndex = isRefresh ? 1 : ctx.state.pageIndex + 1;
    getIssueReplyByContent(_pageIndex, ctx, isRefresh);
  }
}

getIssueReplyByContent(int pageIndex, Context<GoodsIssueDetailState> ctx, bool isRefresh) {
  ApiWork.instance.getIssueReplyByContent(ctx.state.issuecontentlist.issuecontentid,
      pageIndex.toString(),
      "10",
      netSuccess:
          (data){
        ctx.dispatch(
            GoodsIssueDetailActionCreator.initData((data as List).map((e)=>IssueReplyModel
                .fromJson(e)).toList(),
                isRefresh,
                pageIndex));
      },netFail: (code,msg){

      },netError: (e){

      });
}


void _onRefresh(Action action, Context<GoodsIssueDetailState> ctx) async =>
    await requestData(true, ctx);

void _onLoadMore(Action action, Context<GoodsIssueDetailState> ctx) async =>
    await requestData(false, ctx);