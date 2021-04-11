import 'package:fish_redux/fish_redux.dart';

class AppHomeState implements Cloneable<AppHomeState> {

  @override
  AppHomeState clone() {
    return AppHomeState();
  }
}

AppHomeState initState(Map<String, dynamic> args) {
  return AppHomeState();
}
