import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/equity_share_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/model/user_wallet_model.dart';

class MineState implements Cloneable<MineState> {
  UserWalletModel userWalletModel;
  String jifen = "0";
  UserModel userModel;
  EquityShareModel equityShareModel;

  @override
  MineState clone() {
    return MineState()
      ..userWalletModel = userWalletModel
      ..jifen = jifen
      ..equityShareModel = equityShareModel
      ..userModel = userModel;
  }
}

MineState initState(Map<String, dynamic> args) {
  return MineState();
}
