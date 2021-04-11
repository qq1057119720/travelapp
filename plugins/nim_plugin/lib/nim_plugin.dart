import 'dart:async';

import 'package:flutter/services.dart';

class Nim {

  static Nim _instance;

  static Nim get instance => _getInstance();

  factory Nim() => _getInstance();

  static Nim _getInstance() {
    if (_instance == null) {
      _instance = Nim._internal();
    }
    return _instance;
  }

  Nim._internal() {}

  static const MethodChannel _channel =
  const MethodChannel('nim_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  ///登录
  Future<Map> initImLogin(String accid,String token) async {
    Map params = <String, dynamic>{
      "accid": accid,
      "token": token,
    };
    return await _channel.invokeMethod('initIMLogin', params);
  }
  ///打开单聊页面
  Future<Map> startChat(Map<String,dynamic> userMap) async {
//    Map params = <String, dynamic>{
//      "accid": accid,
//    };
    return await _channel.invokeMethod('startChat', userMap);
  }
  Future<Map> startTeam(Map<String,dynamic> userMap) async {
//    Map params = <String, dynamic>{
//      "accid": accid,
//    };
    return await _channel.invokeMethod('startTeam', userMap);
  }
  ///登出
  Future<Map> loginOut() async {
    Map params = <String, dynamic>{
    };
    return await _channel.invokeMethod('loginOut', params);
  }
  ///获取会话列表
  Future<Map> queryRecentContacts() async {
    Map params = <String, dynamic>{
    };
    return await _channel.invokeMethod('queryRecentContacts', params);
  }
  ///实时更新会话列表数据
  Future<Map> keepRecent() async {
    Map params = <String, dynamic>{
    };
    return await _channel.invokeMethod('keepRecent', params);
  }

  ///更新用户资料
  Future<Map> updateUserInfo(String nickname,String avatar) async {
    Map params = <String, dynamic>{
      "avatar": avatar,
      "nickname": nickname,
    };
    return await _channel.invokeMethod('updateUserInfo', params);
  }
  /// 设置消息提醒/静音
  Future<Map> setMessageNotify(Map<String,dynamic> userMap) async {
    return await _channel.invokeMethod('setMessageNotify', userMap);
  }
  Future<Map> queryMessageListEx(Map<String,dynamic> userMap) async {
    return await _channel.invokeMethod('queryMessageListEx', userMap);
  }
  Future<Map> deleteServerSession(Map<String,dynamic> userMap) async {
    return await _channel.invokeMethod('delete_contact', userMap);
  }
///获取会话未读数
}
