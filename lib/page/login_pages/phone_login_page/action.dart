import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PhoneLoginAction {
  action,
  update_countdown,
  get_code,
  to_login,

}

class PhoneLoginActionCreator {
  static Action onAction() {
    return const Action(PhoneLoginAction.action);
  }
  static Action onGetCode() {
    return const Action(PhoneLoginAction.get_code);
  }

  static Action onUpdateCountDown(String title, bool canGet, int countNum) {
    return Action(PhoneLoginAction.update_countdown,
        payload: [title, canGet, countNum]);
  }

  static Action onToLogin() {
    return const Action(PhoneLoginAction.to_login);
  }
}
