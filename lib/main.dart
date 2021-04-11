import 'package:flutter/material.dart';
import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluwx/fluwx.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/cache/local_storage.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/i10n/localization_delegate.dart';

void main() =>LocalStorage.checnLocalThemeResources().then((e) =>runApp(MyApp()));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver{
  _initFluwx() async {

    // AmapLocationFlutterPlugin .setApiKey("73c15e5666b766964ffb0cc789cdbd30", "");

    await FlutterAlipay.setIosUrlSchema('travel');
    await registerWxApi(
        doOnAndroid: true,
        doOnIOS: true,
        appId: "wx035cd1dbe9a7fc25",
        universalLink: "https://www.whldszb.com/");
  }

  @override
  void initState() {
    super.initState();
    _initFluwx();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("--" + state.toString());
    switch (state) {
      case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。
        break;
      case AppLifecycleState.resumed:// 应用程序可见，前台

        break;
      case AppLifecycleState.paused: // 应用程序不可见，后台
        break;
      case AppLifecycleState.detached:
      // TODO: Handle this case.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '掌游',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: GlobalThemeStyles.WHITE),
            textTheme: TextTheme(
                title: TextStyle(
                    fontSize:18,
                    color: GlobalThemeStyles.WHITE))),
      ),
      localizationsDelegates: [
        AppLocalizationsDelegate(), // 我们定义的代理
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: GlobalThemeStyles.themeLocale,
      supportedLocales: <Locale>[
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
      ],
      home: AppRoute.global.buildPage(RoutePath.SPLASH_PAGE, null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return AppRoute.global.buildPage(settings.name, settings.arguments);
        });
      },
    );
  }
}


