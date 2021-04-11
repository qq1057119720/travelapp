import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RegisterAction {
  action,
  update_countdown,
  get_code,
  to_register,
}

class RegisterActionCreator {
  static Action onAction() {
    return const Action(RegisterAction.action);
  }
  static Action onGetCode() {
    return const Action(RegisterAction.get_code);
  }

  static Action toRegister() {
    return const Action(RegisterAction.to_register);
  }

  static Action onUpdateCountDown(String title, bool canGet, int countNum) {
    return Action(RegisterAction.update_countdown,
        payload: [title, canGet, countNum]);
  }
}
