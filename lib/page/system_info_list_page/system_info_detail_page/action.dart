import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SystemInfoDetailAction { action }

class SystemInfoDetailActionCreator {
  static Action onAction() {
    return const Action(SystemInfoDetailAction.action);
  }
}
