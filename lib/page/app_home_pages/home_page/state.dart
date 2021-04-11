import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/category_model.dart';
import 'package:travelapp/model/home_comment_model.dart';
import 'package:travelapp/model/location_model.dart';
import 'package:travelapp/model/recommend_goods_model.dart';

class HomeState implements Cloneable<HomeState> {
  List<CategoryModel> cateList = List();
  RecommendGoodsModel recommendOne;
  RecommendGoodsModel recommendTwo;
  List<HomeCommentModel> commentList = List();
  List<RecommendGoodsModel> recommendList = List();

  ///页码.
  int pageIndex = 1;

  ///是否有更多.
  bool isMore = false;

  ///页码.
  int pageIndexGoods = 1;

  ///是否有更多.
  bool isMoreGoods = false;
  int showItem = 0;
  LocationModel locationModel;
  @override
  HomeState clone() {
    return HomeState()
      ..pageIndex = pageIndex..isMoreGoods=isMoreGoods..pageIndexGoods=pageIndexGoods
      ..recommendList = recommendList
      ..isMore = isMore..locationModel=locationModel
      ..showItem = showItem
      ..cateList = cateList
      ..commentList = commentList
      ..recommendOne = recommendOne
      ..recommendTwo = recommendTwo;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}
