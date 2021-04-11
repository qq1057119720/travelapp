import 'package:flutter/cupertino.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';

class CustomAppBarWidget extends StatefulWidget {
  String titleName;
  var leftClick;

  CustomAppBarWidget(this.titleName, this.leftClick);

  @override
  _CustomAppBarWidgetState createState() =>
      _CustomAppBarWidgetState(this.titleName, this.leftClick);
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  String titleName;
  var leftClick;

  _CustomAppBarWidgetState(this.titleName, this.leftClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: UnifiedThemeStyles.widthFromPx(750),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          ColorUtil.color("#ffffff"),
          ColorUtil.color("#ffffff"),
        ]),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: 300,
            margin: EdgeInsets.only(top: 30),
            height: 40,
            alignment: Alignment.center,
            child: Text(
              titleName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: UnifiedThemeStyles.BLACK,
                  fontSize: 18),
            ),
          ),
          Positioned(
            left: 0,
            child: GestureDetector(
              onTap: leftClick,
              child: Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 30),
                child: Image.asset(
                  "assets/bh_topback_h.png",color: ColorUtil.color("000000"),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: ColorUtil.color("#F4F2F9"),
              width: UnifiedThemeStyles.widthFromPx(750),
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
