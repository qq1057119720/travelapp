import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/user_bank_model.dart';

class BankListState implements Cloneable<BankListState> {

  List<UserBankModel> accountList=new List();
  @override
  BankListState clone() {
    return BankListState()..accountList=accountList;
  }
}

BankListState initState(Map<String, dynamic> args) {
  return BankListState();
}
