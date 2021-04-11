import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelapp/model/recommend_goods_model.dart';

class SearchGoodsState implements Cloneable<SearchGoodsState> {
  TextEditingController keyController = TextEditingController();
  FocusNode keyFocusNode = FocusNode();
  List<RecommendGoodsModel> recommendList = List();

  ///页码.
  int pageIndex = 1;

  ///是否有更多.
  bool isMore = false;

  @override
  SearchGoodsState clone() {
    return SearchGoodsState()
      ..keyController = keyController
      ..recommendList = recommendList
      ..isMore = isMore
      ..pageIndex = pageIndex
      ..keyFocusNode = keyFocusNode;
  }
}

SearchGoodsState initState(Map<String, dynamic> args) {
  return SearchGoodsState();
}
