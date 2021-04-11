
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart' as prefix1;
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/custom_select_list.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<UpdateUserInfoState> buildEffect() {
  return combineEffects(<Object, Effect<UpdateUserInfoState>>{
    Lifecycle.initState: _onAction,
    UpdateUserInfoAction.select_sex: _onSelectSex,
    UpdateUserInfoAction.select_image: _onSelectImage,
    UpdateUserInfoAction.update_userinfo: _onUpdateUserInfo,
    UpdateUserInfoAction.on_select_date: _onSelectDate,
  });
}

void _onAction(Action action, Context<UpdateUserInfoState> ctx) {
  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  if(!BaseTools.isEmpty(userModel.sex)){
    ctx.dispatch(UpdateUserInfoActionCreator.onUpdateSex(userModel.sex));
  }
  if(!BaseTools.isEmpty(userModel.nickname)){
    ctx.state.nicknameEditController.text=userModel.nickname;
  }
  if(!BaseTools.isEmpty(userModel.birthday)){
    ctx.state.briday=userModel.birthday;
  }

}
void _onSelectImage(Action action, Context<UpdateUserInfoState> ctx) async{
  loadAssets(ctx);
//  await prefix1.showModalBottomSheet(
//      context: ctx.context,
//      builder: (c) => prefix0.Container(
//        child: prefix0.Column(
//          mainAxisSize: prefix0.MainAxisSize.min,
//          mainAxisAlignment: prefix0.MainAxisAlignment.center,
//          children: <prefix0.Widget>[
//            _selectIconItem(ImageSource.camera, "相机", ctx),
//            _selectIconItem(ImageSource.gallery, "相册", ctx),
//          ],
//        ),
//      ));
}
void _onSelectSex(Action action, Context<UpdateUserInfoState> ctx) {
  ///手动排序
  List<PickerItem> list = List();
  list.add(PickerItem(value: "男"));
  list.add(PickerItem(value: "女"));

  CustomSelectList(
    adapter: PickerDataAdapter(data: list),
    onConfirm: (Picker picker, List value) {
      ctx.dispatch(UpdateUserInfoActionCreator.onUpdateSex(list[value[0]].value.toString()));
    },
  ).picker.showModal(ctx.context);
}

getItemBuilder() {
  return (item, list, index) {
    return prefix0.Center(
        child: prefix0.Text(item, maxLines: 1, style: prefix0.TextStyle(fontSize: 18.0)));
  };
}


prefix0.Widget _selectIconItem(
    ImageSource source, String txt, Context<UpdateUserInfoState> ctx) =>
    prefix0.SizedBox(
      width: BaseTools.getWidth(ctx.context),
      child: prefix1.FlatButton(
          child: prefix0.Text(txt),
          onPressed: () async {
            prefix0.Navigator.of(ctx.context).pop();
            var iconFile;
            try {
              iconFile = await ImagePicker.pickImage(
                source: source,
              );
            } catch (e) {
//              LogUtil.v(e.toString(), tag: "##ModifyPersonalDataPage##");
            } finally {
              if (iconFile != null && iconFile is File) {
                ctx.dispatch(UpdateUserInfoActionCreator.onUpdateImage(iconFile));
              } else {
//                ToastTools.showToast(
//                    AppLocalizations.of(ctx.context).imgPathNotFind);
              }
            }
          }),
    );

void _addPicture(int picIndex, Context<UpdateUserInfoState> ctx) {


  ctx.state.images[picIndex].getByteData().then((byteData) {
    Uint8List imageUnitLIst=  byteData.buffer.asUint8List();
    int quality = (100* 0.2 * 1024 * 1024/imageUnitLIst.length).round();
    if(quality>100){
      quality=100;
    }
    // File compressedFile =  FlutterNativeImage.compressImage(file.path,
    //     quality: quality, percentage: percentage);

    if(Platform.isIOS){
      FlutterImageCompress.iOScompressImageList(
        imageUnitLIst,
        quality: quality,
      ).then((value){

        ApiWork.instance.uploadImage(value,"image",netSuccess: (data){
          _updateUserInfo(data, ctx);
        },netFail: (code,msg){
          _updateUserInfo("", ctx);
        },netError: (e){
          _updateUserInfo("", ctx);
        });
      });
    }else {
      FlutterImageCompress.compressWithList(
        imageUnitLIst,
        quality: quality,
      ).then((value){
        ApiWork.instance.uploadImage(value,"image",netSuccess: (data){
          _updateUserInfo(data, ctx);
        },netFail: (code,msg){
          _updateUserInfo("", ctx);
        },netError: (e){
          _updateUserInfo("", ctx);
        });
        // BaseTools.unitListImage2Base64(value).then((value) {
        //   ApiWork.instance.addPicture(value,netSuccess: (data){
        //     _updateUserInfo(data["url"], ctx);
        //   },netFail: (code,msg){
        //     _updateUserInfo("", ctx);
        //   },netError: (e){
        //     _updateUserInfo("", ctx);
        //   });
        // });
      });
    }

  });
}
//
void _onUpdateUserInfo(Action action, Context<UpdateUserInfoState> ctx) async{
  LoadingDialog.showDialog(ctx.context);
  if(ctx.state.images.length>0){
    _addPicture(0,ctx);
  }else{
    _updateUserInfo("", ctx);
  }
}
void _updateUserInfo(String userimage,Context<UpdateUserInfoState> ctx) {

  UserModel userModel=UserinfoCacheManager.instance.getUserInfo();

  ApiWork.instance.updateUser(userModel.userid, userimage, ctx.state
      .nicknameEditController.text, ctx.state.userSex,
      ctx.state.briday,netSuccess: (data){
    prefix0.Navigator.of(ctx.context).pop();
    ToastTools.showToast("修改成功");
  },netFail: (code,msg){
  prefix0.Navigator.of(ctx.context).pop();
  ToastTools.showToast(msg);
  },netError: (e){
  prefix0.Navigator.of(ctx.context).pop();
  });

}

Future<void> loadAssets(Context<UpdateUserInfoState> ctx) async {
  List<Asset> resultList = List<Asset>();
  try {
    resultList = await MultiImagePicker.pickImages(
      maxImages: 1,
      enableCamera: true,
      selectedAssets: ctx.state.images,
      cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      materialOptions: MaterialOptions(
        actionBarColor: "#00C569",
        actionBarTitle: "选择图片",
        allViewTitle: "所有图片",
        useDetailsView: false,
        selectCircleStrokeColor: "#00C569",
      ),
    );
  } on Exception catch (e) {}
  ctx.dispatch(UpdateUserInfoActionCreator.onUpdateImages(resultList));
}
void _onSelectDate(Action action, Context<UpdateUserInfoState> ctx) {
  DatePicker.showDatePicker(ctx.context,
      dateFormat: "yyyy-MM-dd",
      initialDateTime: new DateTime.now(),

      locale: DateTimePickerLocale.zh_cn, onConfirm: (date, list) {
        print('confirm $date');
        ctx.dispatch(UpdateUserInfoActionCreator.updateSelectDate(date.year.toString()+"-"+date
            .month
            .toString()+"-"+date
            .day
            .toString()));
      });

}