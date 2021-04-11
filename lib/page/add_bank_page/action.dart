import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/bank_model.dart';

//TODO replace with your own action
enum AddBankAction { action,update_bank_list ,update_bank,to_add_bank}

class AddBankActionCreator {
  static Action onAction() {
    return const Action(AddBankAction.action);
  }
  static Action onToAddBank() {
    return const Action(AddBankAction.to_add_bank);
  }

  static Action onUpdateBankList(List<BankModel> list) {
    return  Action(AddBankAction.update_bank_list,payload: list);
  }
  static Action onUpdateBank(BankModel bankModel) {
    return  Action(AddBankAction.update_bank,payload: bankModel);
  }
}
