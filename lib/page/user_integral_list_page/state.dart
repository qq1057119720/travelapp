import 'package:date_format/date_format.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/user_integral_model.dart';

class UserIntegralListState implements Cloneable<UserIntegralListState> {
  List<UserIntegralModel> walletlist = List();
  @override
  UserIntegralListState clone() {
    return UserIntegralListState()..walletlist=walletlist;
  }
}

UserIntegralListState initState(Map<String, dynamic> args) {
  return UserIntegralListState();
}
