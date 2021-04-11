import 'dart:typed_data';

import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/net/http_proxy.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:photo_view/photo_view_gallery.dart';

///图片详情浏览界面
class CustomBrowseImagesWidget extends StatefulWidget {
  final List<String> imgUrl;
  int initialPage;
  CustomBrowseImagesWidget(this.imgUrl,{this.initialPage=0});

  @override
  _CustomBrowseImagesWidgetState createState() =>
      _CustomBrowseImagesWidgetState(initialPage: initialPage);
}

class _CustomBrowseImagesWidgetState extends State<CustomBrowseImagesWidget> {
  PageController pageController;
  int nowPosition;
  int initialPage;
  List<Widget> dotWidgets;
  _CustomBrowseImagesWidgetState({this.initialPage=0});
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
    if (widget.imgUrl.length > 1) {
      for (int i = 0; i < widget.imgUrl.length; i++) {
        dotWidgets.add(_buildDots(i));
      }
    }
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
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PhotoViewGallery.builder(
            onPageChanged: (index) {
              setState(() {
                nowPosition = index;
                _initData();
              });
            },
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(widget.imgUrl[index].contains("http")?widget.imgUrl[index]:HttpProxy.HTTP_URL+widget.imgUrl[index]),
//          initialScale: PhotoViewComputedScale.contained * 0.8,
//          heroTag: galleryItems[index].id,
              );
            },
            itemCount: widget.imgUrl.length,
//          loadingChild: widget.loadingChild,
//          backgroundDecoration: widget.backgroundDecoration,
            pageController: pageController,
          ),
          Container(
            margin: EdgeInsets.only(bottom: UnifiedThemeStyles.widthFromPx(35)),
            child: Wrap(
              children: dotWidgets,
            ),
          ),
          
          Positioned(
            bottom: 100,
            right: 20,
            child: GestureDetector(
              onTap: (){
                _saveImage(widget.imgUrl[nowPosition].contains("http")?widget.imgUrl[nowPosition]:HttpProxy.HTTP_URL+widget.imgUrl[nowPosition]);
              },
              child: Container(
                color: UnifiedThemeStyles.TRANSPARENT,
                child: Image.asset("assets/cp_download_image.png",width: 25,height: 25,),
              ),
            ),
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