import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/user_lower_level_model.dart';

//TODO replace with your own action
enum MyTeamAction {
  action,
  update_person_model,
  onRefresh,
  onLoadMore,
  initData,
}

class MyTeamActionCreator {
  static Action onAction() {
    return const Action(MyTeamAction.action);
  }

  // static Action onUpdatePersonModel(PersonModel personModel) {
  //   return Action(MyTeamAction.update_person_model, payload: personModel);
  // }
  static Action onRefresh() {
    return Action(MyTeamAction.onRefresh);
  }

  static Action onLoadMore() {
    return Action(MyTeamAction.onLoadMore);
  }

  static Action initData(
      List<UserLowerLevelModel> newsinfolist, bool isRefresh, pageIndex) {
    return Action(MyTeamAction.initData, payload: {
      "list": newsinfolist,
      "isRefresh": isRefresh,
      "pageIndex": pageIndex
    });
  }
}
