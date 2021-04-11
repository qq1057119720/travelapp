import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/user_lower_level_model.dart';
import 'package:travelapp/model/user_model.dart';

class MyTeamState implements Cloneable<MyTeamState> {
  List<UserLowerLevelModel> goodsList = new List();

  ///页码.
  int pageIndex = 1;

  ///是否有更多.
  bool isMore = false;

  @override
  MyTeamState clone() {
    return MyTeamState()
      ..goodsList = goodsList
      ..isMore = isMore
      ..pageIndex;
  }
}

MyTeamState initState(Map<String, dynamic> args) {
  return MyTeamState();
}
