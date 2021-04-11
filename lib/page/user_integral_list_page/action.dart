import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/user_integral_model.dart';

//TODO replace with your own action
enum UserIntegralListAction { action,update_wallet_list }

class UserIntegralListActionCreator {
  static Action onAction() {
    return const Action(UserIntegralListAction.action);
  }
  static Action updateWalletList(List<UserIntegralModel> list) {
    return  Action(UserIntegralListAction.update_wallet_list,payload: list);
  }
}
