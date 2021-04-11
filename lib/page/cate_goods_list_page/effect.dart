import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'action.dart';
import 'state.dart';

Effect<CateGoodListState> buildEffect() {
  return combineEffects(<Object, Effect<CateGoodListState>>{
    Lifecycle.initState: _onAction,
    CateGoodListAction.onRefresh: _onRefresh,
    CateGoodListAction.onLoadMore: _onLoadMore,
  });
}

void _onAction(Action action, Context<CateGoodListState> ctx) {
  requestData(true, ctx);
}

requestData(bool isRefresh, Context<CateGoodListState> ctx) {
  if (isRefresh) {
    ///刷新
    getHomeCommentList(1, ctx, isRefresh);
  } else {
    ///加载更多
    int _pageIndex = isRefresh ? 1 : ctx.state.pageIndex + 1;
    getHomeCommentList(_pageIndex, ctx, isRefresh);
  }
}

getHomeCommentList(int pageIndex, Context<CateGoodListState> ctx, bool isRefresh) {
  ApiWork.instance.getTravelGoodsList(ctx.state.categoryid,pageIndex.toString(), "10",
      netSuccess:
      (data){
    ctx.dispatch(
        CateGoodListActionCreator.initData((data as List).map((e)=>RecommendGoodsModel
            .fromJson(e)).toList(),
            isRefresh,
            pageIndex));
  },netFail: (code,msg){

  },netError: (e){

  });
}


void _onRefresh(Action action, Context<CateGoodListState> ctx) async =>
    await requestData(true, ctx);

void _onLoadMore(Action action, Context<CateGoodListState> ctx) async =>
    await requestData(false, ctx);
