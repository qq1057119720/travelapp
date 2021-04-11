import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelapp/model/bank_model.dart';

class AddBankState implements Cloneable<AddBankState> {
  TextEditingController accNameEditController;
  FocusNode accNameFocusNode;

  TextEditingController accPhoneEditController;
  FocusNode accPhoneFocusNode;

  TextEditingController bankNumEditController;
  FocusNode bankNumFocusNode;

  TextEditingController bankSubEditController;
  FocusNode bankSubFocusNode;
  List<BankModel> bankList = new List();
  BankModel bankModel;
  AddBankState() {
    accNameEditController = TextEditingController();
    accNameFocusNode = FocusNode();

    accPhoneEditController = TextEditingController();
    accPhoneFocusNode = FocusNode();

    bankNumEditController = TextEditingController();
    bankNumFocusNode = FocusNode();

    bankSubEditController = TextEditingController();
    bankSubFocusNode = FocusNode();
  }

  @override
  AddBankState clone() {
    return AddBankState()
      ..accNameEditController = accNameEditController
      ..accNameFocusNode = accNameFocusNode
      ..accPhoneEditController = accPhoneEditController
      ..accPhoneFocusNode = accPhoneFocusNode
      ..bankNumEditController = bankNumEditController
      ..bankNumFocusNode = bankNumFocusNode
      ..bankSubEditController = bankSubEditController
      ..bankSubFocusNode = bankSubFocusNode
      ..bankModel=bankModel
      ..bankList = bankList
    ;
  }
}

AddBankState initState(Map<String, dynamic> args) {
  return AddBankState();
}
