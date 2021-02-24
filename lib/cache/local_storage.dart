import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp/cache/sp_util.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/global_store/action.dart';
import 'package:travelapp/global_store/store.dart';
import 'package:travelapp/utils/base_tools.dart';

///SharedPreferences 本地存储
class LocalStorage {

  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  ///检查主题是否持久化
  static Future checnLocalThemeResources() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SpUtil.getInstance();
    String _localThemeLocale =
    SpUtil.getString(Config.LOCAL_THEME_LOCALE_KEY);
    // int _localThemeColor = SpUtil.getInt(Config.LOCAL_THEME_COLOR_KEY);
    if (!BaseTools.isEmpty(_localThemeLocale)) {
      if(_localThemeLocale=="en"){
        GlobalThemeStyles.themeLocale = Locale('en', 'US');
      }else{
        GlobalThemeStyles.themeLocale = Locale('zh', 'CN');
      }
      GlobalStore.store.dispatch(GlobalActionCreator.changeLanguage(_localThemeLocale));
    }
    println("主题持久化");
    // try {
    //   if (_localThemeColor != null) {
    //     GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor(_localThemeColor));
    //   }
    // } catch (e) {}
  }
  ///持久化主题资源
  static void saveLocalThemeResources(var resources) async {
    await SpUtil.getInstance();
    if (resources != null) {
      if (resources is String) {
        SpUtil.putString(Config.LOCAL_THEME_LOCALE_KEY, resources);
      } else if (resources is int) {
        SpUtil.putInt(Config.LOCAL_THEME_COLOR_KEY, resources);
      }
    }
  }
}
