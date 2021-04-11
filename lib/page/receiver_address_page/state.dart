import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/receiver_address_model.dart';

class ReceiverAddressState implements Cloneable<ReceiverAddressState> {
  List<ReceiverAddressModel> addressList=new List();
  String type="";
  @override
  ReceiverAddressState clone() {
    return ReceiverAddressState()..addressList=addressList..type=type;
  }
}

ReceiverAddressState initState(Map<String, dynamic> args) {
  ReceiverAddressState addressState=ReceiverAddressState();
  addressState.type=args["type"];
  return addressState;
}
