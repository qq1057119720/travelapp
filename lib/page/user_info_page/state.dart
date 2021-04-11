import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/user_lower_level_model.dart';

class UserInfoState implements Cloneable<UserInfoState> {
  UserLowerLevelModel model;
  @override
  UserInfoState clone() {
    return UserInfoState()..model=model;
  }
}

UserInfoState initState(Map<String, dynamic> args) {
  UserInfoState state=UserInfoState();
  state.model=args["data"];
  return state;
}
