import 'dart:typed_data';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'action.dart';
import 'state.dart';
import 'dart:ui' as ui;
Effect<MyPromotionState> buildEffect() {
  return combineEffects(<Object, Effect<MyPromotionState>>{
    MyPromotionAction.action: _onAction,
    MyPromotionAction.save_image: _shareUiImage,
    MyPromotionAction.save_erweima: _shareErWeima,
  });
}

void _onAction(Action action, Context<MyPromotionState> ctx) {
}

/// 把图片ByteData写入File，并触发微信分享
Future<Null> _shareUiImage(Action action, Context<MyPromotionState> ctx) async {

  ByteData sourceByteData = await _capturePngToByteData(action,ctx);
  Uint8List sourceBytes = sourceByteData.buffer.asUint8List();
  final result = await ImageGallerySaver.saveImage(sourceBytes); //这个是核心的保存图片的插件
  ToastTools.showToast('保存成功');

}
/// 截屏图片生成图片流ByteData
Future<ByteData> _capturePngToByteData(Action action, Context<MyPromotionState> ctx) async {
  try {
    RenderRepaintBoundary boundary = ctx.state.repaintWidgetKey.currentContext
        .findRenderObject();
    double dpr = ui.window.devicePixelRatio; // 获取当前设备的像素比
    ui.Image image = await boundary.toImage(pixelRatio: dpr);
    ByteData _byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return _byteData;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<ByteData> _capturePngToByteData2(Action action,
    Context<MyPromotionState> ctx) async {
  try {
    RenderRepaintBoundary boundary = ctx.state.repaintWidgetKey2.currentContext
        .findRenderObject();
    double dpr = ui.window.devicePixelRatio; // 获取当前设备的像素比
    ui.Image image = await boundary.toImage(pixelRatio: dpr);
    ByteData _byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return _byteData;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<Null> _shareErWeima(Action action, Context<MyPromotionState> ctx) async {

  ByteData sourceByteData = await _capturePngToByteData2(action,ctx);
  Uint8List sourceBytes = sourceByteData.buffer.asUint8List();
  final result = await ImageGallerySaver.saveImage(sourceBytes); //这个是核心的保存图片的插件
  ToastTools.showToast('保存成功');

}

