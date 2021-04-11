import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/user_bank_model.dart';

//TODO replace with your own action
enum BankListAction { action ,update_account_list,to_add_new_bank,deleteAccountBank}

class BankListActionCreator {
  static Action onAction() {
    return const Action(BankListAction.action);
  }
  static Action onToAddNewBank() {
    return const Action(BankListAction.to_add_new_bank);
  }

  static Action deleteAccountBank(String accountId) {
    return Action(BankListAction.deleteAccountBank,payload: accountId);
  }
  static Action onUpdateAccountList(List<UserBankModel> list) {
    return  Action(BankListAction.update_account_list,payload: list);
  }
}
