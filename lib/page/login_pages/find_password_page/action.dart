import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FindPasswordAction {
  action,
  update_countdown,
  get_code,
  to_register,
}

class FindPasswordActionCreator {
  static Action onAction() {
    return const Action(FindPasswordAction.action);
  }
  static Action onGetCode() {
    return const Action(FindPasswordAction.get_code);
  }

  static Action toRegister() {
    return const Action(FindPasswordAction.to_register);
  }

  static Action onUpdateCountDown(String title, bool canGet, int countNum) {
    return Action(FindPasswordAction.update_countdown,
        payload: [title, canGet, countNum]);
  }
}
