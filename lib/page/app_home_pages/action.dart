import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AppHomeAction { action }

class AppHomeActionCreator {
  static Action onAction() {
    return const Action(AppHomeAction.action);
  }
}
