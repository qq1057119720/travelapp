import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelapp/model/user_bank_model.dart';
import 'package:travelapp/model/user_wallet_model.dart';

class WithdrawDepositState implements Cloneable<WithdrawDepositState> {
  TextEditingController nameEditController;
  FocusNode nameFocusNode;

  List<UserBankModel> accountList = new List();
  UserBankModel accountBankModel;
  UserWalletModel walletModel;
  WithdrawDepositState() {
    nameFocusNode = new FocusNode();
    nameEditController = new TextEditingController();
  }

  @override
  WithdrawDepositState clone() {
    return WithdrawDepositState()
      ..nameEditController = nameEditController
      ..nameFocusNode = nameFocusNode
      ..accountList = accountList
      ..accountBankModel = accountBankModel
      ..walletModel=walletModel;
  }
}

WithdrawDepositState initState(Map<String, dynamic> args) {
  WithdrawDepositState state=new WithdrawDepositState();
  state.walletModel=args["data"];
  return state;
}
