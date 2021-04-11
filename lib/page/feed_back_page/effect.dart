import 'package:fish_redux/fish_redux.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'action.dart';
import 'state.dart';

Effect<FeedBackState> buildEffect() {
  return combineEffects(<Object, Effect<FeedBackState>>{
    FeedBackAction.action: _onAction,
    FeedBackAction.select_img: _selectImg,
    FeedBackAction.to_feed_back: _toFeedBack,
  });
}
void _startDuration(Context<FeedBackState> ctx){
  ///设置倒计时三秒后执行跳转方法
  var duration = new Duration(seconds: 1);
  new Future.delayed(duration, () {
    ToastTools.showToast("反馈提交成功");

  });
}

void _onAction(Action action, Context<FeedBackState> ctx) {
}

void _toFeedBack(Action action, Context<FeedBackState> ctx) {

  if(BaseTools.isEmpty(ctx.state.contentEditController.text)){
    ToastTools.showToast("请输入反馈内容");
    return;
  }
  _startDuration(ctx);
}
void _selectImg(Action action, Context<FeedBackState> ctx) {
  if (ctx.state.images.length >= 8) {
    ToastTools.showToast("最多选择8张图片");
    return;
  }
//  _takeVideo();
  loadAssets(ctx);
}
Future<void> loadAssets(Context<FeedBackState> ctx) async {
  List<Asset> resultList = List<Asset>();
  try {
    resultList = await MultiImagePicker.pickImages(
      maxImages: 9,
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
  ctx.dispatch(FeedBackActionCreator.onUpdateImages(resultList));
}
void _toUploadImage(int picIndex, Context<FeedBackState> ctx) {
  picIndex++;
  if (picIndex < ctx.state.images.length) {
    _addPicture(picIndex, ctx);
  } else {

    ToastTools.showToast("提交成功");
  }
}


void _addPicture(int picIndex, Context<FeedBackState> ctx) {
  // ctx.state.images[picIndex].getByteData().then((byteData) {
  //   println("开始上传图片");
  //   ApiWork.instance.uploadFile(byteData.buffer.asUint8List(), ctx.state.images[picIndex].name,
  //       netSuccess: (data){
  //         println(data);
  //         UploadFileModel fileModel=UploadFileModel.fromJson(data);
  //         ctx.dispatch(FeedBackActionCreator.onUpdateWebImage(fileModel.domain+fileModel
  //             .fileUrl));
  //         _toUploadImage(picIndex, ctx);
  //       },netFail: (code,msg){
  //         _toUploadImage(picIndex, ctx);
  //       },netError: (e){
  //         _toUploadImage(picIndex, ctx);
  //       });
  // });
}