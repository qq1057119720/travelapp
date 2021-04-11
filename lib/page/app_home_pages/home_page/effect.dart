import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/category_model.dart';
import 'package:travelapp/model/home_comment_model.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/amap_location.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
   Lifecycle.initState: _onAction,
    HomeAction.onRefresh: _onRefresh,
    HomeAction.onLoadMore: _onLoadMore,
    HomeAction.onRefreshGoods: _onRefreshGoods,
    HomeAction.onLoadMoreGoods: _onLoadMoreGoods,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {
  if(UserinfoCacheManager.instance.checkLocation()){
    ctx.dispatch(HomeActionCreator.updateLocation(UserinfoCacheManager.instance.getLocation()));
  }
  AmapLoaction.startLocation().then((value){
      println("定位成功------------------------------------------");
      println(value.toString());
      UserinfoCacheManager.instance.saveLocation(json.encode(value));
      ctx.dispatch(HomeActionCreator.updateLocation(UserinfoCacheManager.instance.getLocation()));
  });
  // AmapLocationFlutterPlugin().startLocation();
  //
  // AmapLocationFlutterPlugin().onLocationChanged().listen((value){
  //   println("定位成功------------------------------------------");
  //   println(value.toString());
  //
  //   AmapLocationFlutterPlugin().stopLocation();
  // });

  if(UserinfoCacheManager.instance.checkCategoryInfo()){
    ctx.dispatch(HomeActionCreator.updateCatelist(UserinfoCacheManager.instance.getCategoryInfo()));
    ApiWork.instance.getUserInfo(UserinfoCacheManager.instance.getUserInfo()
            .userid,netSuccess: (data){
      UserModel userModel=UserModel.fromJson(data);
      UserinfoCacheManager.instance.saveUserInfo(json.encode(userModel));
    },netFail: (code,msg){

    },netError: (e){

    });

  }

  ApiWork.instance.getTravelCategoryList(netSuccess:(data){
    ctx.dispatch(HomeActionCreator.updateCatelist((data as List).map((e)
    =>CategoryModel.fromJson(e)).toList()));
  },netFail: (code,msg){

  },netError: (e){

  });
  ApiWork.instance.getTravelRecommendGoods
    ("63f77a94-6493-4225-940a-e02092320cd7","1","1",netSuccess:(data){
    // ctx.dispatch(HomeActionCreator.updateCatelist((data as List).map((e)
    // =>CategoryModel.fromJson(e)).toList()));
    List<RecommendGoodsModel> list=(data as List).map((e) =>RecommendGoodsModel
        .fromJson(e)).toList();
    ctx.dispatch(HomeActionCreator.updateRecommendOne(list[0]));
  },netFail: (code,msg){

  },netError: (e){

  });

  ApiWork.instance.getTravelRecommendGoods
    ("4d434e0c-3c32-41fa-9154-365a020febae","1","1",netSuccess:(data){
    // ctx.dispatch(HomeActionCreator.updateCatelist((data as List).map((e)
    // =>CategoryModel.fromJson(e)).toList()));
    List<RecommendGoodsModel> list=(data as List).map((e) =>RecommendGoodsModel
        .fromJson(e)).toList();
    ctx.dispatch(HomeActionCreator.updateRecommendTwo(list[0]));
  },netFail: (code,msg){

  },netError: (e){

  });
  requestData(true, ctx);
  requestGoodsData(true, ctx);
}

requestData(bool isRefresh, Context<HomeState> ctx) {
  if (isRefresh) {
    ///刷新
    getHomeCommentList(1, ctx, isRefresh);
  } else {
    ///加载更多
    int _pageIndex = isRefresh ? 1 : ctx.state.pageIndex + 1;
    getHomeCommentList(_pageIndex, ctx, isRefresh);
  }
}

getHomeCommentList(int pageIndex, Context<HomeState> ctx, bool isRefresh) {
  ApiWork.instance.getHomeCommentList(pageIndex.toString(), "10",netSuccess:(data){
    ctx.dispatch(
        HomeActionCreator.initData((data as List).map((e)=>HomeCommentModel
            .fromJson(e)).toList(),
            isRefresh,
            pageIndex));
  },netFail: (code,msg){

  },netError: (e){

  });
}


void _onRefresh(Action action, Context<HomeState> ctx) async =>
    await requestData(true, ctx);

void _onLoadMore(Action action, Context<HomeState> ctx) async =>
    await requestData(false, ctx);


requestGoodsData(bool isRefresh, Context<HomeState> ctx) {
  if (isRefresh) {
    ///刷新
    getTravelRecommendGoods(1, ctx, isRefresh);
  } else {
    ///加载更多
    int _pageIndex = isRefresh ? 1 : ctx.state.pageIndexGoods + 1;
    getTravelRecommendGoods(_pageIndex, ctx, isRefresh);
  }
}

getTravelRecommendGoods(int pageIndex, Context<HomeState> ctx, bool isRefresh) {
  ApiWork.instance.getTravelRecommendGoods("",pageIndex.toString(), "10",
      netSuccess:(data){
    ctx.dispatch(
        HomeActionCreator.initDataGoods((data as List).map((e)=>RecommendGoodsModel
            .fromJson(e)).toList(),
            isRefresh,
            pageIndex));
  },netFail: (code,msg){

  },netError: (e){

  });
}


void _onRefreshGoods(Action action, Context<HomeState> ctx) async =>
    await requestGoodsData(true, ctx);

void _onLoadMoreGoods(Action action, Context<HomeState> ctx) async =>
    await requestGoodsData(false, ctx);
