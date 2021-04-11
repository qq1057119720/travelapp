import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/wallet_log_model.dart';

class MyBalanceListState implements Cloneable<MyBalanceListState> {
  List<WalletLogModel> walletlist = List();
  @override
  MyBalanceListState clone() {
    return MyBalanceListState()..walletlist=walletlist;
  }
}

MyBalanceListState initState(Map<String, dynamic> args) {
  return MyBalanceListState();
}
