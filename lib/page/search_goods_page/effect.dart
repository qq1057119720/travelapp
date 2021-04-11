import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchGoodsState> buildEffect() {
  return combineEffects(<Object, Effect<SearchGoodsState>>{
    SearchGoodsAction.action: _onAction,
    SearchGoodsAction.onRefresh: _onRefresh,
    SearchGoodsAction.onLoadMore: _onLoadMore,
    SearchGoodsAction.to_search: _toSearch,
  });
}

void _onAction(Action action, Context<SearchGoodsState> ctx) {
}


void _toSearch(Action action, Context<SearchGoodsState> ctx) {
  if(BaseTools.isEmpty(ctx.state.keyController.text)){
    ToastTools.showToast("请输入关键字");
    return;
  }
  requestData(true, ctx);
}

requestData(bool isRefresh, Context<SearchGoodsState> ctx) {
  if (isRefresh) {
    ///刷新
    getHomeCommentList(1, ctx, isRefresh);
  } else {
    ///加载更多
    int _pageIndex = isRefresh ? 1 : ctx.state.pageIndex + 1;
    getHomeCommentList(_pageIndex, ctx, isRefresh);
  }
}

getHomeCommentList(int pageIndex, Context<SearchGoodsState> ctx, bool isRefresh) {
  ApiWork.instance.getTravelGoodsList("",pageIndex.toString(), "10",keyword:
  ctx.state.keyController.text,
      netSuccess:
          (data){
        ctx.dispatch(
            SearchGoodsActionCreator.initData((data as List).map((e)=>RecommendGoodsModel
                .fromJson(e)).toList(),
                isRefresh,
                pageIndex));
      },netFail: (code,msg){

      },netError: (e){

      });
}


void _onRefresh(Action action, Context<SearchGoodsState> ctx) async =>
    await requestData(true, ctx);

void _onLoadMore(Action action, Context<SearchGoodsState> ctx) async =>
    await requestData(false, ctx);
