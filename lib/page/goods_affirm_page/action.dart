import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/receiver_address_model.dart';

//TODO replace with your own action
enum GoodsAffirmAction {
  action,
  update_goodcount,
  select_pay_type,
  select_address,
  update_address,
  create_order,
}

class GoodsAffirmActionCreator {
  static Action onAction() {
    return const Action(GoodsAffirmAction.action);
  }

  static Action onCreateOrder() {
    return const Action(GoodsAffirmAction.create_order);
  }

  static Action updateGoodCount(int count) {
    return Action(GoodsAffirmAction.update_goodcount, payload: count);
  }

  static Action onSelectPayType(int payType) {
    return Action(GoodsAffirmAction.select_pay_type, payload: payType);
  }

  static Action toSelectAddress() {
    return const Action(GoodsAffirmAction.select_address);
  }

  static Action onUpdateAddress(ReceiverAddressModel model) {
    return Action(GoodsAffirmAction.update_address, payload: model);
  }
}
