import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReceiverAddressState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReceiverAddressState>>{
      ReceiverAddressAction.action: _onAction,
      ReceiverAddressAction.update_address_list: _onUpdateAddressList,
    },
  );
}

ReceiverAddressState _onAction(ReceiverAddressState state, Action action) {
  final ReceiverAddressState newState = state.clone();
  return newState;
}
ReceiverAddressState _onUpdateAddressList(ReceiverAddressState state, Action action) {
  final ReceiverAddressState newState = state.clone();
  newState.addressList=action.payload;
  return newState;
}