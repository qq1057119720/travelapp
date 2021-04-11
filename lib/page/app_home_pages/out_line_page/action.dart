import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum OutLineAction { action }

class OutLineActionCreator {
  static Action onAction() {
    return const Action(OutLineAction.action);
  }
}
