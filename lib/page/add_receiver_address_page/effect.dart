
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart'as prefix0;
import 'package:flutter_picker/flutter_picker.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/city_pickers/city_pickers.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<AddReceiverAddressState> buildEffect() {
  return combineEffects(<Object, Effect<AddReceiverAddressState>>{
    AddReceiverAddressAction.select_city: _toSlectCity,
    AddReceiverAddressAction.to_add_address: _toAddAddress,
  });
}
void _toAddAddress(Action action, Context<AddReceiverAddressState> ctx) async{
  if(BaseTools.isEmpty(ctx.state.nameEditController.text)){
    ToastTools.showToast("请输入收件人");
    return;
  }
  if(BaseTools.isEmpty(ctx.state.phoneEditController.text)){
    ToastTools.showToast("请输入联系电话");
    return;
  }
  if(BaseTools.isEmpty(ctx.state.addressEditController.text)){
    ToastTools.showToast("请输入详细地址");
    return;
  }
  if(BaseTools.isEmpty(ctx.state.province)){
    ToastTools.showToast("请选择省市区");
    return;
  }
  LoadingDialog.showDialog(ctx.context);
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.addReceiverAddress(userModel.userid,ctx.state.province,
      ctx.state
      .city,
      ctx
      .state.zone, ctx.state.addressEditController.text, ctx.state
      .nameEditController.text, ctx.state.phoneEditController.text,
      netSuccess: (data){
        BaseTools.closePage(ctx.context);
        ToastTools.showToast("保存成功");
        BaseTools.closePage(ctx.context);
      },netFail: (code,msg){
        BaseTools.closePage(ctx.context);
        ToastTools.showToast(msg);
      },netError: (e){
        BaseTools.closePage(ctx.context);
      });

}

void _toSlectCity(Action action, Context<AddReceiverAddressState> ctx) async{
  double customerItemExtent = 40;
  PickerItem themeAttr;
//  PickerItem showTypeAttr = PickerItem(text: '省+市+县', value: ShowType.pca);
  Result resultAttr = new Result();
  Result result = new Result();
  double barrierOpacityAttr = 0.5;
  bool barrierDismissibleAttr = false;
  bool customerMeta = false;

  bool customerButtons = true;
  bool isSort = false;
  Result tempResult = await CityPickers.showCityPicker(
      context: ctx.context,
      theme: themeAttr != null ? themeAttr.value : null,
      locationCode: resultAttr != null
          ? resultAttr.areaId ??
          resultAttr.cityId ??
          resultAttr.provinceId
          : null,
      showType: ShowType.pca,
      isSort: true,
      barrierOpacity: barrierOpacityAttr,
      barrierDismissible: barrierDismissibleAttr,
      citiesData: null,
      provincesData: null,
      height: 250,
      itemExtent: customerItemExtent,
      cancelWidget: customerButtons ? prefix0.Text('取消',style: prefix0
          .TextStyle(fontSize: 18.0,color: GlobalThemeStyles.instance.getExplainTitleColor()),) :
      null,
      confirmWidget: customerButtons ? prefix0.Text('确认',style:prefix0
          .TextStyle(fontSize: 18.0,color: GlobalThemeStyles.instance.getThemeColor()),) :
      null,
      itemBuilder: getItemBuilder());
  if(tempResult!=null){
    String address = tempResult.provinceName+" "+tempResult.cityName+" "+tempResult.areaName;
    ctx.dispatch(AddReceiverAddressActionCreator.onUpdateCity(tempResult.provinceName,tempResult.cityName,
        tempResult.areaName));
  }

}
getItemBuilder() {
  return (item, list, index) {
    return prefix0.Center(
        child: prefix0.Text(item, maxLines: 1, style: prefix0.TextStyle(fontSize: 18.0)));
  };
}