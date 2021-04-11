import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<VipHomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<VipHomeState>>{
      VipHomeAction.action: _onAction,
      VipHomeAction.update_goods_list: _updateGoodsList,
      VipHomeAction.update_userinfo: _updateUserinfo,
    },
  );
}

VipHomeState _onAction(VipHomeState state, Action action) {
  final VipHomeState newState = state.clone();
  return newState;
}

VipHomeState _updateGoodsList(VipHomeState state, Action action) {
  final VipHomeState newState = state.clone();
  if(action.payload[0]=="1"){
    newState.vipList=action.payload[1];
  }else{
    newState.dailiList=action.payload[1];
  }
  return newState;
}
VipHomeState _updateUserinfo(VipHomeState state, Action action) {
  final VipHomeState newState = state.clone();
  newState.userModel=action.payload;
  return newState;
}
