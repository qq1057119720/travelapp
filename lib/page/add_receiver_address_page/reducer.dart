import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AddReceiverAddressState> buildReducer() {
  return asReducer(
    <Object, Reducer<AddReceiverAddressState>>{
      AddReceiverAddressAction.action: _onAction,
      AddReceiverAddressAction.updat_city: onUpdateCity,
    },
  );
}

AddReceiverAddressState _onAction(AddReceiverAddressState state, Action action) {
  final AddReceiverAddressState newState = state.clone();
  return newState;
}
AddReceiverAddressState onUpdateCity(AddReceiverAddressState state, Action action) {
  final AddReceiverAddressState newState = state.clone();
  newState.province=action.payload[0];
  newState.city=action.payload[1];
  newState.zone=action.payload[2];
  return newState;
}