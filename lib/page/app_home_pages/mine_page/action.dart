import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/equity_share_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/model/user_wallet_model.dart';

//TODO replace with your own action
enum MineAction { action ,update_userwallet,update_jifen,update_userinfo,
  update_equity_share}

class MineActionCreator {
  static Action onAction() {
    return const Action(MineAction.action);
  }
  static Action updateUserwallet(UserWalletModel userWalletModel) {
    return  Action(MineAction.update_userwallet,payload: userWalletModel);
  }

  static Action updateJifen(String jifen) {
    return  Action(MineAction.update_jifen,payload: jifen);
  }

  static Action updateUserinfo(UserModel userModel) {
    return  Action(MineAction.update_userinfo,payload: userModel);
  }
  static Action updateEquityShare(EquityShareModel equityShareModel) {
    return  Action(MineAction.update_equity_share,payload: equityShareModel);
  }
}
