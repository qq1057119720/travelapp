import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AboutUsAction { action }

class AboutUsActionCreator {
  static Action onAction() {
    return const Action(AboutUsAction.action);
  }
}
