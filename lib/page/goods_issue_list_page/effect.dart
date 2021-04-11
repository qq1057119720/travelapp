import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/goods_detail_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';

Effect<GoodsIssueListState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsIssueListState>>{
   Lifecycle.initState: _onAction,
    Lifecycle.deactivate: _onAction,
    GoodsIssueListAction.onRefresh: _onRefresh,
    GoodsIssueListAction.onLoadMore: _onLoadMore,
  });
}

void _onAction(Action action, Context<GoodsIssueListState> ctx) {
  requestData(true, ctx);
}

requestData(bool isRefresh, Context<GoodsIssueListState> ctx) {
  if (isRefresh) {
    ///刷新
    getIssueContentsByGoods(1, ctx, isRefresh);
  } else {
    ///加载更多
    int _pageIndex = isRefresh ? 1 : ctx.state.pageIndex + 1;
    getIssueContentsByGoods(_pageIndex, ctx, isRefresh);
  }
}

getIssueContentsByGoods(int pageIndex, Context<GoodsIssueListState> ctx, bool isRefresh) {
  ApiWork.instance.getIssueContentsByGoods(ctx.state.goodsid,pageIndex.toString(), "10",
      netSuccess:
          (data){
        ctx.dispatch(
            GoodsIssueListActionCreator.initData((data as List).map((e)=>Issuecontentlist
                .fromJson(e)).toList(),
                isRefresh,
                pageIndex));
      },netFail: (code,msg){

      },netError: (e){

      });
}


void _onRefresh(Action action, Context<GoodsIssueListState> ctx) async =>
    await requestData(true, ctx);

void _onLoadMore(Action action, Context<GoodsIssueListState> ctx) async =>
    await requestData(false, ctx);