import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PasswordLoginAction { action  , to_login,}

class PasswordLoginActionCreator {
  static Action onAction() {
    return const Action(PasswordLoginAction.action);
  }
  static Action onToLogin() {
    return const Action(PasswordLoginAction.to_login);
  }
}
