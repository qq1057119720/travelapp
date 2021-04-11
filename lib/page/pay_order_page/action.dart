import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PayOrderAction { action ,  select_pay_type,pay_order}

class PayOrderActionCreator {
  static Action onAction() {
    return const Action(PayOrderAction.action);
  }

  static Action payOrder() {
    return const Action(PayOrderAction.pay_order);
  }

  static Action onSelectPayType(int payType) {
    return Action(PayOrderAction.select_pay_type, payload: payType);
  }

}
