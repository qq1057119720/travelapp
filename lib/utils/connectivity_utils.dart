

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

///网络监听
class CommectivityUtils{

  static CommectivityUtils _instance;

  static CommectivityUtils get instance => _getInstance();

  factory CommectivityUtils() => _getInstance();
  ConnectivityResult connectivityResult;
  CommectivityUtils._internal();

  static CommectivityUtils _getInstance() {
    if (_instance == null) {
      _instance = new CommectivityUtils._internal();
    }
    return _instance;
  }

  //定义变量（网络状态）
  String _connectionStatus = 'Unknown';
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  //网络初始状态
  connectivityInitState(var back){
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
          print(result.toString());
          if(result == ConnectivityResult.none){
            back();
          }
          connectivityResult=result;
        });
  }
  //网络结束监听
  connectivityDispose(){
    _connectivitySubscription.cancel();
  }
  //网络进行监听
  Future<Null> initConnectivity() async {
    String connectionStatus;
    //平台消息可能会失败，因此我们使用Try/Catch PlatformException。
    try {
      connectionStatus = (await Connectivity().checkConnectivity()).toString();

      if (connectionStatus == ConnectivityResult.mobile) {
        // I am connected to a mobile network.
      } else if (connectionStatus == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
      }
    } on PlatformException catch (e) {
      print(e.toString());
      connectionStatus = 'Failed to get connectivity.';
    }
  }

}