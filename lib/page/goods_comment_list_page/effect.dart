import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/goods_detail_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/widgets/custom_browse_imges_widget.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter/cupertino.dart' as cup;
Effect<GoodsCommentListState> buildEffect() {
  return combineEffects(<Object, Effect<GoodsCommentListState>>{
   Lifecycle.initState: _onAction,
    GoodsCommentListAction.onRefresh: _onRefresh,
    GoodsCommentListAction.onLoadMore: _onLoadMore,
    GoodsCommentListAction.show_image: _onShowImage,
  });
}

void _onAction(Action action, Context<GoodsCommentListState> ctx) {
  requestData(true, ctx);
}

requestData(bool isRefresh, Context<GoodsCommentListState> ctx) {
  if (isRefresh) {
    ///刷新
    getGoodsCommentList(1, ctx, isRefresh);
  } else {
    ///加载更多
    int _pageIndex = isRefresh ? 1 : ctx.state.pageIndex + 1;
    getGoodsCommentList(_pageIndex, ctx, isRefresh);
  }
}

getGoodsCommentList(int pageIndex, Context<GoodsCommentListState> ctx, bool isRefresh) {
  ApiWork.instance.getGoodsCommentList(ctx.state.goodsid,pageIndex.toString(), "10",
      netSuccess:
          (data){
        ctx.dispatch(
            GoodsCommentListActionCreator.initData((data as List).map((e)=>Commentlist
                .fromJson(e)).toList(),
                isRefresh,
                pageIndex));
      },netFail: (code,msg){

      },netError: (e){

      });
}


void _onRefresh(Action action, Context<GoodsCommentListState> ctx) async =>
    await requestData(true, ctx);

void _onLoadMore(Action action, Context<GoodsCommentListState> ctx) async =>
    await requestData(false, ctx);
void _onShowImage(Action action, Context<GoodsCommentListState> ctx) {
//  ToastTools.showToast(action.payload);
//showImageDialog(ctx.context, action.payload);
  List<PictureList> picList = action.payload[0];
  if (picList != null){
    List<String> urls=new List();
    for(int i=0;i<picList.length;i++){
      urls.add(picList[i].pictureurl);
    }
    // cup.FadeTransition(
    //
    // );
    // cup.Navigator.of(ctx.context).push(FadeRoute(page:
    // PhotoViewGalleryScreen(
    //   images:urls,//传入图片list
    //   index: action.payload[1],//传入当前点击的图片的index
    // )));
    cup. Navigator.of(ctx.context).push(cup.PageRouteBuilder(
        pageBuilder: (c, a, s) => CustomBrowseImagesWidget(urls,initialPage: action.payload[1],)));
  }

}