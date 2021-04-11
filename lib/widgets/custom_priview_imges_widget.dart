import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';

///图片详情浏览界面
class CustomPriviewImagesWidget extends StatefulWidget {
  final Asset imgUrl;
  int initialPage;
  CustomPriviewImagesWidget(this.imgUrl,{this.initialPage=0});

  @override
  _CustomPriviewImagestState createState() =>
      _CustomPriviewImagestState(initialPage: initialPage);
}

class _CustomPriviewImagestState extends State<CustomPriviewImagesWidget> {
  PageController pageController;
  int nowPosition;
  int initialPage;
  List<Widget> dotWidgets;
  _CustomPriviewImagestState({this.initialPage=0});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nowPosition = initialPage;
    pageController = PageController(initialPage:initialPage);
    _initData();
  }

  void _initData() {
    dotWidgets = [];
    // if (widget.imgUrl.length > 1) {
    //   for (int i = 0; i < widget.imgUrl.length; i++) {
    //     dotWidgets.add(_buildDots(i));
    //   }
    // }
  }

  Widget _buildDots(int index) => Container(
        margin: EdgeInsets.all(UnifiedThemeStyles.widthFromPx(10)),
        child: ClipOval(
          child: Container(
            color: index == nowPosition
                ? UnifiedThemeStyles.themeColor
                : UnifiedThemeStyles.WHITE,
            width: 5.0,
            height: 5.0,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
    final height =size.height;
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AssetThumb(
            asset: widget.imgUrl,
            width: width.toInt(),
            height: height.toInt(),
          )

        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
}
void _saveImage(String url) async {
  var response = await Dio().get(url, options: Options(responseType: ResponseType.bytes));
  final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
  print('result:$result');

  if(BaseTools.isEmpty(result)){
    print('保存失败');
    ToastTools.showToast("保存失败");
  }else{
    print('保存成功');
    ToastTools.showToast("保存成功");
  }
}