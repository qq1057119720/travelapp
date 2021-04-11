import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/utils/android_back_desktop.dart';
import 'package:travelapp/utils/log_utils.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:travelapp/widgets/ace_bottom_navigation_bar.dart';
import 'package:travelapp/widgets/custom_push_widgets.dart';
import 'package:travelapp/widgets/main_bottom_pages_load_mode.dart';

import 'action.dart';
import 'state.dart';
DateTime lastPopTime;
Widget buildView(AppHomeState state, Dispatch dispatch, ViewService viewService) {
  ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)
    ..init(viewService.context);
  requestPermission();
  Future<bool> _doubleExit() async {
    bool isPop = Navigator.of(viewService.context).canPop();
    if (isPop) {
      Navigator.of(viewService.context).pop();
      return new Future.value(false);
    } else {
      // 点击返回键的操作
      if (lastPopTime == null ||
          DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
        lastPopTime = DateTime.now();
        ToastTools.showToast("再按一次退出");
        return new Future.value(false);
      } else {
        lastPopTime = DateTime.now();
        // 退出app
        return AndroidBackTop.backDesktop();
      }
    }
  }

  return WillPopScope(
    child: Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        top: false,
        child: TabNavigator(),
      ),
//      body: TabNavigator()
    ),
    onWillPop: _doubleExit,
  );
}

class TabNavigator extends StatefulWidget {
  AppHomeState state;
  Dispatch dispatch;

  TabNavigator({this.state, this.dispatch});

  @override
  _TabNavigatorState createState() =>
      _TabNavigatorState(state: state, dispatch: dispatch);
}

class _TabNavigatorState extends State<TabNavigator> {
  PageController _controller;
  List<Widget> _mainPages;
  AppHomeState state;
  Dispatch dispatch;
  var _currentIndex = 0;

  _TabNavigatorState({this.state, this.dispatch});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LogUtil.init(isDebug: true, tag: "###cgm_client###");

    _controller = PageController(
      initialPage: 0,
    );
    initPages();
  }


  void _selectPush(){

    showGeneralDialog(
      context: context,
      barrierLabel: "",
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return CustomPushWidget(
          pushTask: (){
            // Navigator.pushNamed(context, RoutePath.PUSH_TASK_PAGE);
          },
          pushAd: (){
            // Navigator.pushNamed(context, RoutePath.PUSH_SELECT_AD_CATEGORY_PAGE);
            ToastTools.showToast("敬请期待");
          },
        );
      },
    );
  }


  void _pageChange(int index) {
    setState(() {
      if (index == 2) {
        // _selectPush();
        return;
      }
      if (_currentIndex != index) {
        _currentIndex = index;
        _controller.jumpToPage(index);
        LogUtil.v("check" + index.toString());
      }
    });
  }

  void initPages() {
    _mainPages = List()
      ..add(MainBottomPagesLoadMode(
          AppRoute.global.buildPage(RoutePath.HOME_PAGE, null), "首页"))
      ..add(MainBottomPagesLoadMode(
          AppRoute.global.buildPage(RoutePath.OUT_LINE_PAGE, null), "线下"))
      ..add(MainBottomPagesLoadMode( AppRoute.global.buildPage(RoutePath.HOME_PAGE,
          null), "南之都公司"))
      ..add(MainBottomPagesLoadMode(
          AppRoute.global.buildPage(RoutePath.VIP_HOME_PAGE, null), "会员"))
      ..add(MainBottomPagesLoadMode(
          AppRoute.global.buildPage(RoutePath.MINE_PAGE, null), "我的"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: _mainPages,
      ),
      bottomNavigationBar: ACEBottomNavigationBar(
          type: ACEBottomNavigationBarType.protruding,
          textSelectedColor: Colors.white,
          bgColor: Colors.white,
          protrudingColor: Colors.white,
          items: [
            NavigationItemBean(
                textStr: '首页',
                textUnSelectedColor: GlobalThemeStyles.instance.getExplainTitleColor(),
                textSelectedColor: GlobalThemeStyles.instance.getMainTitleColor(),
                image: AssetImage('assets/bh_home_shouye_no.png'),
                imageSelected: AssetImage('assets/bh_home_shouye.png')),
            NavigationItemBean(
                textStr: '线下',
                textUnSelectedColor: GlobalThemeStyles.instance.getExplainTitleColor(),
                textSelectedColor: GlobalThemeStyles.instance.getMainTitleColor(),
                image: AssetImage('assets/bh_home_xianxia.png'),
                imageSelected: AssetImage('assets/bh_home_xianxia_no.png')),
            NavigationItemBean(
                textStr: '南之都公司',
                iconUnSelectedColor: Colors.white,
                iconSelectedColor: Colors.white,
                image: AssetImage('assets/bh_nanzhidu.png')),
            NavigationItemBean(
                textStr: '会员',
                textUnSelectedColor: GlobalThemeStyles.instance.getExplainTitleColor(),
                textSelectedColor: GlobalThemeStyles.instance.getMainTitleColor(),
                image: AssetImage('assets/bh_home_vip_yab.png'),
                imageSelected: AssetImage('assets/bh_home_vip_yab_no.png')),
            NavigationItemBean(
                textStr: '我的',
                textUnSelectedColor: GlobalThemeStyles.instance.getExplainTitleColor(),
                textSelectedColor: GlobalThemeStyles.instance.getMainTitleColor(),
                image: AssetImage('assets/bh_home_my.png'),
                imageSelected: AssetImage('assets/bh_home_my_no.png')),
          ],
          onTabChangedListener: (index) {
            setState(() {
              _pageChange(index);
            });
          }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}

Future requestPermission() async {
  // 申请权限
  Map<PermissionGroup, PermissionStatus> permissions =
  await PermissionHandler().requestPermissions([
    PermissionGroup.phone,
    PermissionGroup.storage,
    PermissionGroup.camera,
    PermissionGroup.mediaLibrary,
    PermissionGroup.location,
  ]);

  // 申请结果

  PermissionStatus permission =
  await PermissionHandler().checkPermissionStatus(PermissionGroup.phone);

  if (permission == PermissionStatus.granted) {
//    Fluttertoast.showToast(msg: "权限申请通过");

  } else {
//    Fluttertoast.showToast(msg: "权限申请被拒绝");
  }
}