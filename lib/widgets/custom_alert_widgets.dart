import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class CustomAlertWidget extends StatefulWidget {
  String title;
  String alertName;
  var cancel;
  var affirm;
  CustomAlertWidget(this.title,this.alertName,{this.affirm,this.cancel});

  @override
  CustomAlertState createState() =>
      CustomAlertState(title,alertName,affirm: affirm,cancel: cancel);
}

class CustomAlertState extends State<CustomAlertWidget> {
  String title;
  String alertName;
  var cancel;
  var affirm;

  CustomAlertState(this.title,this.alertName,{this.affirm,this.cancel});

  @override
  Widget build(BuildContext context) {

    List<Widget> _bulidSelectItem() {
      List<Widget> list = new List();
      list.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 15.5),
        child: Text(
          title,
          style: TextStyle(fontSize: 12.5, color: ColorUtil.color("#ACAEBC")),
        ),
      ));

      list.add(GestureDetector(
        onTap: (){
          affirm();
        },
        child: Container(
          margin: EdgeInsets.only(top: 43,bottom: 37),
          child: Text(alertName,style: TextStyle(fontSize: 16,color: ColorUtil.color("ff0000"),fontWeight: FontWeight.bold),),
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
              onTap: (){
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
              bottom: 40,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  cancel();
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Text(
                    "取消",
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorUtil.color("#69707F"),
                        fontWeight: FontWeight.bold),
                  ),
                ),
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