import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/user_wallet_model.dart';

//TODO replace with your own action
enum MyBalanceAction { action ,update_userwallet}

class MyBalanceActionCreator {
  static Action onAction() {
    return const Action(MyBalanceAction.action);
  }
  static Action updateUserwallet(UserWalletModel userWalletModel) {
    return  Action(MyBalanceAction.update_userwallet,payload: userWalletModel);
  }
}
