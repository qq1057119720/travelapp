import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AddReceiverAddressAction {
  action,
  updat_city,
  select_city,
  to_add_address,
}

class AddReceiverAddressActionCreator {
  static Action onAction() {
    return const Action(AddReceiverAddressAction.action);
  }

  static Action onUpdateCity(String province, String city, String zone) {
    return Action(AddReceiverAddressAction.updat_city,
        payload: [province, city, zone]);
  }
  static Action onSelectCity() {
    return const Action(AddReceiverAddressAction.select_city);
  }
  static Action toAddAddress() {
    return const Action(AddReceiverAddressAction.to_add_address);
  }
}
