import 'dart:typed_data';

import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class CustomPayWidget extends StatefulWidget {
  String payimageurl;
  String alertName;
  String ordernumber;
  String payprice;
  var cancel;
  var affirm;

  CustomPayWidget(
      this.payimageurl, this.alertName, this.ordernumber, this.payprice,
      {this.affirm, this.cancel});

  @override
  CustomPayWidgetState createState() =>
      CustomPayWidgetState(affirm: affirm, cancel: cancel);
}

class CustomPayWidgetState extends State<CustomPayWidget> {
  var cancel;
  var affirm;

  CustomPayWidgetState({this.affirm, this.cancel});

  @override
  Widget build(BuildContext context) {
    List<Widget> _bulidSelectItem() {
      List<Widget> list = new List();
      list.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 15.5),
        child: Text(
          widget.alertName,
          style: TextStyle(fontSize: 16, color: ColorUtil.color("#ACAEBC")),
        ),
      ));

      list.add(GestureDetector(
        onTap: () {},
        onLongPress: () {
          _saveImage(widget.payimageurl);
        },
        child: Container(
          width: 300,
          height: 300,
          child: CustomCachedImageWidget(
            widget.payimageurl,
            width: 250,
            height: 250,
          ),
        ),
      ));

      list.add(GestureDetector(
        onTap: () {
          affirm();
        },
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            "价格：￥" + widget.payprice,
            style: TextStyle(
                fontSize: 16,
                color: ColorUtil.color("ff0000"),
                fontWeight: FontWeight.bold),
          ),
        ),
      ));
      list.add(GestureDetector(
        onTap: () {
          affirm();
        },
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 37),
          child: Text(
            "使用微信扫码,长按二维码可保存",
            style: TextStyle(fontSize: 16, color: ColorUtil.color("ff0000")),
          ),
        ),
      ));

      return list;
    }

    return Scaffold(
      backgroundColor: ColorUtil.color("#22000000"),
      body: Container(
        width: GlobalThemeStyles.instance.widthFromPx(750),
        height: GlobalThemeStyles.instance.heightFromPx(1334),
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.transparent,
                width: GlobalThemeStyles.instance.widthFromPx(750),
                height: GlobalThemeStyles.instance.heightFromPx(1334),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 40,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 90,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(
                  left: GlobalThemeStyles.instance.widthFromPx(93),
                  right: GlobalThemeStyles.instance.widthFromPx(93),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
//                border:new Border.all(color: Color(0xFFFF0000), width: 0.5) ,
                  boxShadow: [
                    BoxShadow(
                        color: ColorUtil.color("#11000000"),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 4.0,
                        spreadRadius: 4.0)
                  ],
                ),
                child: Flex(
                  direction: Axis.vertical,
                  children: _bulidSelectItem(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _saveImage(String url) async {
  var response =
      await Dio().get(url, options: Options(responseType: ResponseType.bytes));
  final result =
      await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
  print('result:$result');

  if (BaseTools.isEmpty(result)) {
    print('保存失败');
    ToastTools.showToast("保存失败");
  } else {
    print('保存成功');
    ToastTools.showToast("保存成功");
  }
}
