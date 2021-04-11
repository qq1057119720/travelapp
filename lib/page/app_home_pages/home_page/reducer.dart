import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/home_comment_model.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/utils/base_tools.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.action: _onAction,
      HomeAction.update_catelist: _updateCatelist,
      HomeAction.update_recommend_one: _updateRecommendOne,
      HomeAction.update_recommend_two: _updateRecommendTwo,
      HomeAction.initData: _initData,
      HomeAction.initDataGoods: _initDataGoods,
      HomeAction.update_showitem: _updateShowitem,
      HomeAction.update_location: _updateLocation,
    },
  );
}

HomeState _onAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState;
}
HomeState _updateCatelist(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.cateList=action.payload;
  UserinfoCacheManager.instance.saveCategoryInfo(json.encode(newState.cateList));
  return newState;
}

HomeState _updateRecommendOne(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.recommendOne=action.payload;
  return newState;
}

HomeState _updateShowitem(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.showItem=action.payload;
  return newState;
}


HomeState _updateRecommendTwo(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.recommendTwo=action.payload;
  return newState;
}
HomeState _initData(HomeState state, Action action) {
  final HomeState newState = state.clone();
  List<HomeCommentModel> newinfolist = action.payload["list"];
  bool isRefresh = action.payload["isRefresh"];
  int pageIndex = action.payload["pageIndex"];

  if (isRefresh) {
    ///刷新.
    newState.pageIndex = pageIndex;
    newState.commentList = newinfolist;
  } else {
    ///加载更多.
    newState.pageIndex = pageIndex;
    newState.commentList.addAll(newinfolist);
  }

  ///判断是否还有更多
  newState.isMore = BaseTools.checkMore(newinfolist);
  return newState;
}

HomeState _initDataGoods(HomeState state, Action action) {
  final HomeState newState = state.clone();
  List<RecommendGoodsModel> newinfolist = action.payload["list"];
  bool isRefresh = action.payload["isRefresh"];
  int pageIndex = action.payload["pageIndex"];

  if (isRefresh) {
    ///刷新.
    newState.pageIndexGoods = pageIndex;
    newState.recommendList = newinfolist;
  } else {
    ///加载更多.
    newState.pageIndexGoods = pageIndex;
    newState.recommendList.addAll(newinfolist);
  }
  println(newState.recommendList.length.toString()
      +"------------aaaaaaaaaaaaaaa--------------");
  ///判断是否还有更多
  newState.isMoreGoods = BaseTools.checkMore(newinfolist);
  return newState;
}
HomeState _updateLocation(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState.locationModel=action.payload;
  return newState;
}
