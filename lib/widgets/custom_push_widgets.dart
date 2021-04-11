import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/widgets/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class CustomPushWidget extends StatefulWidget {

  var pushTask;
  var pushAd;
  CustomPushWidget({this.pushTask,this.pushAd});

  @override
  CustomPushState createState() =>
      CustomPushState();
}

class CustomPushState extends State<CustomPushWidget> {


  CustomPushState();

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: ColorUtil.color("#22000000"),
      body: Container(
        width: GlobalThemeStyles.instance.widthFromPx(750),
        height: GlobalThemeStyles.instance.heightFromPx(1334),
        child: Stack(
          alignment: Alignment.center,
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
            
            Container(
              margin: EdgeInsets.only(left: GlobalThemeStyles.instance
                  .widthFromPx(48),right: GlobalThemeStyles.instance
                  .widthFromPx(48) ),
              width: GlobalThemeStyles.instance.widthFromPx(654),
              height: 122,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:BorderRadius.all(Radius
                    .circular(16)),
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  CustomWidgets().emptyExpanded(),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      widget.pushTask();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Flex(
                        direction: Axis.vertical,
                        children: <Widget>[
                          Container(
                            child: Image.asset("assets/bh_push_task.png"),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            child: Text("发布任务",style: TextStyle(
                              fontSize: 14,color: GlobalThemeStyles.instance
                                    .getExplainTitleColor()
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                  CustomWidgets().emptyExpanded(),

                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                        widget.pushAd();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Flex(
                        direction: Axis.vertical,
                        children: <Widget>[
                          Container(
                            child: Image.asset("assets/bh_push_ad.png"),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            child: Text("发布广告",style: TextStyle(
                                fontSize: 14,color: GlobalThemeStyles.instance
                                .getExplainTitleColor()
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                  CustomWidgets().emptyExpanded(),
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}