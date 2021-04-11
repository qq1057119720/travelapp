import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/user_wallet_model.dart';

class MyBalanceState implements Cloneable<MyBalanceState> {
  UserWalletModel userWalletModel;
  @override
  MyBalanceState clone() {
    return MyBalanceState()..userWalletModel=userWalletModel;
  }
}

MyBalanceState initState(Map<String, dynamic> args) {
  return MyBalanceState();
}
