import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/net/api_work.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/loading_dialog.dart';
import 'action.dart';
import 'state.dart';

Effect<AddCommentState> buildEffect() {
  return combineEffects(<Object, Effect<AddCommentState>>{
    AddCommentAction.action: _onAction,
    AddCommentAction.upload_image: _onUploadImage,
    AddCommentAction.add_news_info: _onAddNewsInfo,
  });
}

void _onAction(Action action, Context<AddCommentState> ctx) {
}


void _onUploadImage(Action action, Context<AddCommentState> ctx) {
  _addPicture(action.payload, ctx);
}
void _toUploadImage(int picIndex, Context<AddCommentState> ctx) {
  picIndex++;
  if (picIndex < ctx.state.images.length) {
    ctx.dispatch(AddCommentActionCreator.onUploadImage(picIndex));
  } else {
    _addComment(ctx);
  }
}
void _onAddNewsInfo(Action action, Context<AddCommentState> ctx) {
  if (BaseTools.isEmpty(ctx.state.infoEditController.text)) {
    ToastTools.showToast("请输入评价内容");
    return;
  }
  LoadingDialog.showDialog(ctx.context);
  if (ctx.state.images != null && ctx.state.images.length > 0) {
    _addPicture(0, ctx);
  } else {

    _addComment(ctx);
  }
}

void _addComment( Context<AddCommentState> ctx) {
   UserModel userModel=UserinfoCacheManager.instance.getUserInfo();
  ApiWork.instance.addComment(userModel.userid,  json.encode(ctx.state
      .piclist), ctx.state.goodsModel.goodsorderid,
      ctx.state.infoEditController.text,
      ctx.state.goodsModel.goodsid,netSuccess: (data){
        BaseTools.closePage(ctx.context);
        ToastTools.showToast("发布成功");

      },netFail: (code,msg){
    BaseTools.closePage(ctx.context);
        ToastTools.showToast(msg);
      },netError: (e){
        BaseTools.closePage(ctx.context);
      });
}




void _addPicture(int picIndex, Context<AddCommentState> ctx) {

  // ctx.state.images[picIndex].
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
        BaseTools.unitListImage2Base64(value).then((value) {

          ApiWork.instance.addPicture(value,netSuccess: (data){
                ctx.dispatch(
                    AddCommentActionCreator.onUpdateWebimage(data["url"]));
                _toUploadImage(picIndex, ctx);
          },netFail: (code,msg){
            _toUploadImage(picIndex, ctx);
          },netError: (e){
            _toUploadImage(picIndex, ctx);
          });
          // ApiWork.instance.addPicture(value).listen((request) {
          //   if (request["code"] == "200") {
          //     LogUtil.v(request["data"]);
          //
          //     ctx.dispatch(
          //         PushInfoActionCreator.onUpdateWebimage(request["data"]["url"]));
          //
          //     _toUploadImage(picIndex, ctx);
          //   } else {
          //     _toUploadImage(picIndex, ctx);
          //   }
          // }, onError: (e) {
          //   _toUploadImage(picIndex, ctx);
          // });
        });
      });
    }else {
      FlutterImageCompress.compressWithList(
        imageUnitLIst,
        quality: quality,
      ).then((value){
        BaseTools.unitListImage2Base64(value).then((value) {

          ApiWork.instance.addPicture(value,netSuccess: (data){
            ctx.dispatch(
                AddCommentActionCreator.onUpdateWebimage(data["url"]));
            _toUploadImage(picIndex, ctx);
          },netFail: (code,msg){
            _toUploadImage(picIndex, ctx);
          },netError: (e){
            _toUploadImage(picIndex, ctx);
          });
          // ApiWork.instance.addPicture(value).listen((request) {
          //   if (request["code"] == "200") {
          //     LogUtil.v(request["data"]);
          //     ctx.dispatch(
          //         PushInfoActionCreator.onUpdateWebimage(request["data"]["url"]));
          //
          //     _toUploadImage(picIndex, ctx);
          //   } else {
          //     _toUploadImage(picIndex, ctx);
          //   }
          // }, onError: (e) {
          //   _toUploadImage(picIndex, ctx);
          // });
        });
      });
    }

  });
}