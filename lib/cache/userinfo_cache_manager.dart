
import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:divination_app/cache/sp_util.dart';
import 'package:divination_app/model/div_user_vip_model.dart';
import 'package:divination_app/model/newinfo_model.dart';
import 'package:divination_app/model/user_curriculum_model.dart';
import 'package:divination_app/model/user_model.dart';
import 'package:divination_app/utils/base_tools.dart';


///用户信息缓存管理
class UserinfoCacheManager {
  static const CACHE_USERINFO = "userinfo";

  static const CACHE_USERVIPINFO = "uservipinfo";


  static const CACHE_COUNTINFO = "count_info";
  static const CACHE_PINLVINFO = "pinlv_info";
  static const CACHE_SCHOOLINFO = "schoolinfo";
  static const CACHE_COURSEINFO = "courseinfo";
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

  ///保存用户登录信息
  void saveUserInfo(String data) {
    SpUtil.putString(CACHE_USERINFO, data).then((bool) {
      if (bool != null) {
        print("保存用户数据成功");
        saveLastLoginTime(formatDate(DateTime.now(), [yyyy,'-',mm,'-',dd,' ',
          HH,':',mm,':',ss]));
        
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
  bool checkSchoolInfo() {
    String data = SpUtil.getString(CACHE_SCHOOLINFO);
    if (!BaseTools.isEmpty(data)) {
      return true;
    } else {
      return false;
    }
  }

  void saveSchoolInfo(String data) {
    SpUtil.putString(CACHE_SCHOOLINFO, data).then((bool) {
      if (bool != null) {
        print("保存用户数据成功");
      } else {
        print("保存用户数据失败");
      }
    });
  }
  List<NewInfoModel> getSchoolInfo() {
    String schoolInfo = SpUtil.getString(CACHE_SCHOOLINFO);
    List<dynamic> list=json.decode(schoolInfo);
    return list.map((e)=>NewInfoModel.fromJson(e)).toList();
  }


  void saveCourseInfo(String data) {
    SpUtil.putString(CACHE_COURSEINFO, data).then((bool) {
      if (bool != null) {
        print("保存用户数据成功");
      } else {
        print("保存用户数据失败");
      }
    });
  }
  bool checkCourseInfo() {
    String data = SpUtil.getString(CACHE_COURSEINFO);
    if (!BaseTools.isEmpty(data)) {
      return true;
    } else {
      return false;
    }
  }
  List<UserCurriculumModel> getCourseInfo() {
    String schoolInfo = SpUtil.getString(CACHE_COURSEINFO);
    List<dynamic> list=json.decode(schoolInfo);
    return list.map((e)=>UserCurriculumModel.fromJson(e)).toList();
  }




  ///保存用户VIP信息
  void saveUserVipInfo(String data) {
    SpUtil.putString(CACHE_USERVIPINFO, data).then((bool) {
      if (bool != null) {
        print("保存用户数据成功");
      } else {
        print("保存用户数据失败");
      }
    });
  }
  
  

  ///清除用户数据
  void removeUserVipInfo() {
    SpUtil.remove(CACHE_USERVIPINFO);
  }

  ///获取用户登录信息
  DivUserVipModel getUserVipInfo() {
    String userinfo = SpUtil.getString(CACHE_USERVIPINFO);
    DivUserVipModel userAuth = DivUserVipModel.fromJson(json.decode(userinfo));
    return userAuth;
  }

  void saveLastLoginTime(String data) {
    SpUtil.putString(LAST_LOGIN, data).then((bool) {
      if (bool != null) {
        print("保存用户数据成功");
      } else {
        print("保存用户数据失败");
      }
    });
  }
  String getLastLoginTime() {
    String userinfo = SpUtil.getString(LAST_LOGIN);

    if (BaseTools.isEmpty(userinfo)) {
      userinfo="";
    }
    return userinfo;
  }
  
  

  ///验证用户信息是否超时或者不存在
  bool checkUserVip() {
    String data = SpUtil.getString(CACHE_USERVIPINFO);
    if (!BaseTools.isEmpty(data)) {
      return true;
    } else {
      return false;
    }
  }

  void saveCountInfo(int data) {
    SpUtil.putInt(CACHE_COUNTINFO, data).then((bool) {
      if (bool != null) {
      } else {
      }
    });
  }
  int getCountInfo() {
    return SpUtil.getInt(CACHE_COUNTINFO,defValue: 1);
  }

  void savePinlvtInfo(int data) {
    SpUtil.putInt(CACHE_PINLVINFO, data).then((bool) {
      if (bool != null) {
      } else {
      }
    });
  }
  int getPinlvInfo() {
    return SpUtil.getInt(CACHE_PINLVINFO,defValue: 1);
  }

  ///保存柱状图状态
  void saveChartTypeInfo(String key,int data) {
    SpUtil.putInt(key, data).then((bool) {
      if (bool != null) {
      } else {
      }
    });
  }
  int getChartTypeInfo(String key) {
    return SpUtil.getInt(key,defValue: 1);
  }

  void saveFristUse(String data) {
    SpUtil.putString(FRIST_USE, data).then((bool) {
      if (bool != null) {
        print("保存用户数据成功");
      } else {
        print("保存用户数据失败");
      }
    });
  }
  String getFristUse() {
    String userinfo = SpUtil.getString(FRIST_USE);
    if (BaseTools.isEmpty(userinfo)) {
      userinfo="";
    }
    return userinfo;
  }



}
