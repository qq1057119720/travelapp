import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/receiver_address_model.dart';

//TODO replace with your own action
enum ReceiverAddressAction { action,update_address_list,select_address_item }

class ReceiverAddressActionCreator {
  static Action onAction() {
    return const Action(ReceiverAddressAction.action);
  }
  static Action onSelectAddressItem(ReceiverAddressModel model) {
    return Action(ReceiverAddressAction.select_address_item,payload: model);
  }

  static Action onUpdateAddressList(List<ReceiverAddressModel> list) {
    return Action(ReceiverAddressAction.update_address_list,payload: list);
  }
}
