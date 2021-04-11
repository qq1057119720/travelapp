import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/utils/log_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void OnMainBottomButtonClick(int index);
typedef void OnMainMallButtonClick(int index);
typedef void OnMainBottomButtonDoubleClick(int index);

///主界面底部button按钮样式.
class MainBottomButtonWidgets extends StatefulWidget {
  final OnMainBottomButtonClick mainBottomButtonClick;
  final OnMainMallButtonClick mainBottomButtonDoubleClick;
  final OnMainBottomButtonDoubleClick mainMallButtonClick;
  final _MainBottomButtonWidgetsState mainBottomButtonWidgetsState =
      _MainBottomButtonWidgetsState();

  MainBottomButtonWidgets(
      {this.mainBottomButtonClick,
      this.mainBottomButtonDoubleClick,
      this.mainMallButtonClick});

  @override
  _MainBottomButtonWidgetsState createState() => mainBottomButtonWidgetsState;
}

class _MainBottomButtonWidgetsState extends State<MainBottomButtonWidgets> {
  ///选中高度
  final double _bootomSelectHelght = 180.0;

  ///bottom默认高度
  final double _bootomDefultHeight = 115.0;

  ///bottom溢出高度
  final double _bottomOverflowHeight = 200.0;

  ///圆形icon
  final double _iconRadius = 100.0;

  ///icon大小
  final double _iconHeight = 40.0;
  final double _iconWidth = 40.0;

  Map<String, dynamic> _mainBottomResources;
  int _selectIndex = 0;
  List<Widget> _widgets;
  List<String> _mainBottomResourcesKeys;

  void _listen() {

  }

  Widget _homeButton(
      int index, double height, bool isHome, bool isSelect, String mapKey) {
    return GestureDetector(
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              _buildIcon(isHome, isSelect, mapKey),
              _buildTxt(isHome, isSelect, mapKey),
            ],
          ),
          height: height,
        ),
        onTap: () => clickButton(index));
  }


  Widget _homeAddButton(
      int index, double height, bool isHome, bool isSelect, String mapKey) {
    return GestureDetector(
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
//              _buildIcon(isHome, isSelect, mapKey),
              Image.asset(
                "assets/bh_home_fabu.png",
//          color: isSelect ? UnifiedThemeStyles.themeColor : null,
              )
            ],
          ),
          height: height,
        ),
        onTap: () => clickButton(index));
  }

  Widget _otherButton(
      int index, double height, bool isHome, bool isSelect, String mapKey) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => clickButton(index),
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              _buildIcon(isHome, isSelect, mapKey),
              _buildTxt(isHome, isSelect, mapKey),
            ],
          ),
          height: height,
        ),
      ),
    );
  }

  Widget _buildButton(int index, BuildContext context) {
    ///是否是主页
//    bool isHome = index == 0;
    bool isHome = false;
    bool _isSelect = _selectIndex == index;

    String _mapKey = _mainBottomResourcesKeys[index];
    double _height = isHome
        ? UnifiedThemeStyles.heightFromPx(_bootomSelectHelght)
        : UnifiedThemeStyles.heightFromPx(_bootomDefultHeight);
    return Expanded(
      flex: 1,
      child: isHome
          ? _homeButton(index, _height, isHome, _isSelect, _mapKey)
          : _otherButton(index, _height, isHome, _isSelect, _mapKey),
    );
  }

  Widget _buildAddButton(int index, BuildContext context) {
    ///是否是主页
//    bool isHome = index == 0;
    bool isHome = false;
    bool _isSelect = _selectIndex == index;
    LogUtil.v("_buildAddButton");
    String _mapKey = _mainBottomResourcesKeys[index];
    double _height = isHome
        ? UnifiedThemeStyles.heightFromPx(_bootomSelectHelght)
        : UnifiedThemeStyles.heightFromPx(_bootomDefultHeight);
    return Expanded(
      flex: 1,
      child: _homeAddButton(index, _height, isHome, _isSelect, _mapKey),
    );
  }

  ///设置底部数据
  void initData(BuildContext context) {
    initDataResources();
    _widgets = List();
    _widgets.add(_buildButton(0, context));
    _widgets.add(_buildButton(1, context));
    _widgets.add(_buildAddButton(2, context));
    _widgets.add(_buildButton(3, context));
    _widgets.add(_buildButton(4, context));
  }

  ///创建资源数据
  void initDataResources() {
    _mainBottomResources = Map();
    _mainBottomResources = {
      "首页": [
        "assets/bh_home_shouye.png",
        "assets/bh_home_shouye_x.png"
      ],
      "视频": [
        "assets/bh_home_shipin.png",
        "assets/bh_home_shipin_x.png"
      ],
      "": [
        "assets/bh_home_fabu.png",
        "assets/bh_home_fabu.png"
      ],
      "游戏": [
        "assets/bh_home_youxi.png",
        "assets/bh_home_youxi_x.png",
      ],
      "我的": [
        "assets/bh_home_my.png",
        "assets/bh_home_my_x.png"
      ]
    };
    _mainBottomResourcesKeys = _mainBottomResources.keys.toList();
  }

  ///图片
  Widget _buildIcon(bool isHome, bool isSelect, String mapKey) {
    List<String> _mapValue = _mainBottomResources[mapKey];
    return Container(
      decoration: isHome
          ? BoxDecoration(
              boxShadow: [
                  BoxShadow(
                      color: UnifiedThemeStyles.VIOLET_THIN,
                      blurRadius: 8,
                      spreadRadius: 1)
                ],
              color: UnifiedThemeStyles.WHITE,
              border: Border.all(
                  color: UnifiedThemeStyles.backGrayColor, width: 1.0),
              borderRadius: BorderRadius.circular(_iconRadius))
          : null,
      child: Container(
        child: Image.asset(
          isSelect ? _mapValue[1].toString() : _mapValue[0].toString(),
          width: UnifiedThemeStyles.widthFromPx(_iconWidth),
          height: UnifiedThemeStyles.heightFromPx(_iconHeight),
//          color: isSelect ? UnifiedThemeStyles.themeColor : null,
        ),
        margin: isHome
            ? EdgeInsets.all(UnifiedThemeStyles.widthFromPx(20.0))
            : EdgeInsets.only(top: UnifiedThemeStyles.heightFromPx(15.0)),
      ),
    );
  }

  ///文字
  Widget _buildTxt(bool isHome, bool isSelect, String mapKey) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        mapKey,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
//            fontSize: isSelect
//                ? UnifiedThemeStyles.NORMAL_FONT_SIZE
//                : UnifiedThemeStyles.SMALL_FONT_SIZE,
            fontSize: UnifiedThemeStyles.smallFontSize,
            fontWeight: isSelect ? FontWeight.bold : null,
            color: isSelect
                ? Color(0xFF68129A)
                : UnifiedThemeStyles.fondGrayColor),
      ),
      margin: isHome
          ? EdgeInsets.only(top: UnifiedThemeStyles.heightFromPx(15.0))
          : EdgeInsets.only(top: UnifiedThemeStyles.heightFromPx(6.0)),
    );
  }

  void updBottomIndex(int index) {
    setState(() {
      _selectIndex = index;
    });
    widget.mainBottomButtonClick(index);
  }

  void clickButton(int index) {
    if (index == 2 ) {
      widget.mainMallButtonClick(index);
      var duration = new Duration(milliseconds: 300);
      new Future.delayed(duration, () {
        updBottomIndex(0);
      });
      return;
    }else {
      updBottomIndex(index);
    }
  }

  Widget _buildContentButton(BuildContext context) {
    initData(context);
    return OverflowBox(
      maxHeight: UnifiedThemeStyles.heightFromPx(_bottomOverflowHeight),
      child: Flex(
        direction: Axis.horizontal,
        children: _widgets,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _listen();
    return Container(
      decoration: BoxDecoration(
        color: UnifiedThemeStyles.WHITE,
        border: Border.all(color: UnifiedThemeStyles.backGrayColor, width: 1.0),
      ),
      child: _buildContentButton(context),
      height: UnifiedThemeStyles.heightFromPx(_bootomDefultHeight),
    );
  }
}
