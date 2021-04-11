import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/user_bank_model.dart';

//TODO replace with your own action
enum WithdrawDepositAction { action,update_account_list ,update_select_bank,to_add_bank,to_user_withdraw}

class WithdrawDepositActionCreator {
  static Action onAction() {
    return const Action(WithdrawDepositAction.action);
  }
  static Action toUserWithdraw() {
    return const Action(WithdrawDepositAction.to_user_withdraw);
  }

  static Action onToAddBank() {
    return const Action(WithdrawDepositAction.to_add_bank);
  }
  static Action onUpdateAccountList(List<UserBankModel> list) {
    return Action(WithdrawDepositAction.update_account_list,payload: list);
  }
  static Action onUpdateBank(UserBankModel bankModel) {
    return Action(WithdrawDepositAction.update_select_bank,payload: bankModel);
  }

}
