import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/wallet_log_model.dart';

//TODO replace with your own action
enum MyBalanceListAction { action,update_wallet_list }

class MyBalanceListActionCreator {
  static Action onAction() {
    return const Action(MyBalanceListAction.action);
  }
  static Action updateWalletList(List<WalletLogModel> list) {
    return  Action(MyBalanceListAction.update_wallet_list,payload: list);
  }
}
