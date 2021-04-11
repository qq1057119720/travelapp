import 'dart:io';

import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UpdateUserInfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<UpdateUserInfoState>>{
      UpdateUserInfoAction.action: _onAction,
      UpdateUserInfoAction.update_sex: _onUpdateSex,
      UpdateUserInfoAction.updat_city: onUpdateCity,
      UpdateUserInfoAction.update_images: _updateImages,
      UpdateUserInfoAction.update_select_date: _updateSelectDate,
    },
  );
}

UpdateUserInfoState _onAction(UpdateUserInfoState state, Action action) {
  final UpdateUserInfoState newState = state.clone();
  return newState;
}
UpdateUserInfoState _onUpdateSex(UpdateUserInfoState state, Action action) {
  final UpdateUserInfoState newState = state.clone();
  newState.userSex=action.payload;
  return newState;
}
UpdateUserInfoState onUpdateCity(UpdateUserInfoState state, Action action) {
  final UpdateUserInfoState newState = state.clone();
  newState.province=action.payload[0];
  newState.city=action.payload[1];
  newState.zone=action.payload[2];
  return newState;
}


UpdateUserInfoState _updateImages(UpdateUserInfoState state, Action action) {
  final UpdateUserInfoState newState = state.clone();
  newState.images=action.payload;
  return newState;
}
UpdateUserInfoState _updateSelectDate(UpdateUserInfoState state, Action action) {
  final UpdateUserInfoState newState = state.clone();
  newState.briday=action.payload;
  return newState;
}