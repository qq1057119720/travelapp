import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RechargeAction { action,select_pay_type }

class RechargeActionCreator {
  static Action onAction() {
    return const Action(RechargeAction.action);
  }
  static Action onSelectPayType(int payType) {
    return Action(RechargeAction.select_pay_type, payload: payType);
  }

}
