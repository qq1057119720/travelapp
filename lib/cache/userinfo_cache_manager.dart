import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:travelapp/cache/sp_util.dart';
import 'package:travelapp/model/category_model.dart';
import 'package:travelapp/model/location_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/utils/base_tools.dart';

///用户信息缓存管理
class UserinfoCacheManager {
  static const CACHE_USERINFO = "userinfo";

  static const CACHE_CATEINFO = "cateinfo";

  static const CACHE_COUNTINFO = "count_info";
  static const CACHE_PINLVINFO = "pinlv_info";
  static const CACHE_SCHOOLINFO = "schoolinfo";
  static const CACHE_COURSEINFO = "courseinfo";

  static const CACHE_LOCATION = "locationinfo";
  static const LAST_LOGIN = "last_login";

  static const FRIST_USE = "FRIST_USE";
  static const APP_INDEX = "app_index";
  static UserinfoCacheManager _instance;

  static UserinfoCacheManager get instance => _getInstance();

  factory UserinfoCacheManager() => _getInstance();

  static UserinfoCacheManager _getInstance() {
    if (_instance == null) {
      _instance = UserinfoCacheManager._internal();
    }
    return _instance;
  }

  UserinfoCacheManager._internal() {}

  void saveCategoryInfo(String data) {
    SpUtil.putString(CACHE_CATEINFO, data).then((bool) {
      if (bool != null) {
        print("保存用户数据成功");
      } else {
        print("保存用户数据失败");
      }
    });
  }

  bool checkCategoryInfo() {
    String data = SpUtil.getString(CACHE_CATEINFO);
    if (!BaseTools.isEmpty(data)) {
      return true;
    } else {
      return false;
    }
  }

  List<CategoryModel> getCategoryInfo() {
    String schoolInfo = SpUtil.getString(CACHE_CATEINFO);
    List<dynamic> list = json.decode(schoolInfo);
    return list.map((e) => CategoryModel.fromJson(e)).toList();
  }

  ///保存用户登录信息
  void saveUserInfo(String data) {
    SpUtil.putString(CACHE_USERINFO, data).then((bool) {
      if (bool != null) {
        print("保存用户数据成功");
      } else {
        print("保存用户数据失败");
      }
    });
  }

  ///清除用户数据
  void removeUserInfo() {
    SpUtil.remove(CACHE_USERINFO);
  }

  ///获取用户登录信息
  UserModel getUserInfo() {
    String userinfo = SpUtil.getString(CACHE_USERINFO);
    UserModel userAuth = UserModel.fromJson(json.decode(userinfo));
    return userAuth;
  }

  ///验证用户信息是否超时或者不存在
  bool checkUserLogin() {
    String data = SpUtil.getString(CACHE_USERINFO);
    if (!BaseTools.isEmpty(data)) {
      return true;
    } else {
      return false;
    }
  }

  ///保存用户登录信息
  void saveLocation(String data) {
    SpUtil.putString(CACHE_LOCATION, data).then((bool) {
      if (bool != null) {
        print("保存用户数据成功");
      } else {
        print("保存用户数据失败");
      }
    });
  }



  ///获取用户登录信息
  LocationModel getLocation() {
    String userinfo = SpUtil.getString(CACHE_LOCATION);
    LocationModel userAuth = LocationModel.fromJson(json.decode(userinfo));
    return userAuth;
  }

  bool checkLocation() {
    String data = SpUtil.getString(CACHE_LOCATION);
    if (!BaseTools.isEmpty(data)) {
      return true;
    } else {
      return false;
    }
  }

  void saveLoginOut(String data) {
    SpUtil.putString("loginout", data).then((bool) {
      if (bool != null) {
        print("保存用户数据成功");
      } else {
        print("保存用户数据失败");
      }
    });
  }
  bool checkLoginOut() {
    String data = SpUtil.getString("loginout");
    if (!BaseTools.isEmpty(data)) {
      return true;
    } else {
      return false;
    }
  }
  void removeLoginOut() {
    SpUtil.remove("loginout");
  }
}
