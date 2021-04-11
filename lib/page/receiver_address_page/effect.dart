import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' as cup;
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/receiver_address_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'action.dart';
import 'state.dart';

Effect<ReceiverAddressState> buildEffect() {
  return combineEffects(<Object, Effect<ReceiverAddressState>>{
    Lifecycle.initState: _onAction,
    Lifecycle.deactivate:_onAction,
    ReceiverAddressAction.select_address_item:_onSelectAddressItem,
  });
}

void _onAction(Action action, Context<ReceiverAddressState> ctx) {
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.getReceiverAddressList(userModel.userid,
      netSuccess: (data) {
        ctx.dispatch(ReceiverAddressActionCreator.onUpdateAddressList(
            (data as List)
                .map((e) => ReceiverAddressModel.fromJson(e))
                .toList()));
      },
      netFail: (code, msg) {},
      netError: (e) {});
}
void _onSelectAddressItem(Action action, Context<ReceiverAddressState> ctx) {
  if(!BaseTools.isEmpty(ctx.state.type)&&ctx.state.type=="1"){
    cup.Navigator.pop(ctx.context,action.payload);
  }
}
