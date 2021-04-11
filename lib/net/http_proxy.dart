import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/utils/connectivity_utils.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
class HttpProxy {
  //家里本地地址
 // static const HTTP_URL = "http://192.168.31.77:8080/travelserver/";
  //公司本地地址
 // static const HTTP_URL = "http://192.168.43.65:8080/travelserver/";
  //服务器地址
  static const HTTP_URL = "http://120.78.166.156/travelserver/";

  //连接超时时间
  static const CON_TIMEOUT = 50000;
  //接收超时时间
  static const REC_TIMETOT = 50000;

  static HttpProxy _instance;

  static HttpProxy get instance => _getInstance();

  factory HttpProxy() => _getInstance();
  Dio _dio;

  HttpProxy._internal() {
    //初始化dio
    _dio = new Dio();
    //设置访问地址
    _dio.options.baseUrl = HTTP_URL;
    //设置连接超时时间
    _dio.options.connectTimeout = CON_TIMEOUT;
    //设置接收超时时间
    _dio.options.receiveTimeout = REC_TIMETOT;
    //设置网络状态拦截
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("");
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError error) {
      print("出错"+error.toString());

      if(CommectivityUtils.instance.connectivityResult==ConnectivityResult.none){
        ToastTools.showToast("当前无网络，请检查网络连接");
        print("当前无网络，请检查网络连接");
      }else{

        ToastTools.showToast("请求超时,请重试");
      }

      return error;
    }));
    //添加日志监听,上线后可去除
    _dio.interceptors.add(LogInterceptor(responseBody: true,requestBody: true));
    //设置接收数据格式
    _dio.options.responseType = ResponseType.json;
  }

  static HttpProxy _getInstance() {
    if (_instance == null) {
      _instance = new HttpProxy._internal();
    }
    return _instance;
  }

  //这里通过fromFuture方法接收Future的异步方法，将中间的数据流交给RxDart处理
//  Observable post(String url, Map params) =>
//      Observable.fromFuture(_post(url, params)).asBroadcastStream();

  Observable post(String url, Map params,{bool isUpload=false}) =>
      Observable.fromFuture(_post(url, params,isUpload: isUpload)).asBroadcastStream();

  Observable postParam(String url, Map params,{bool isUpload=false}) =>
      Observable.fromFuture(_post(url, params,isUpload: isUpload)).asBroadcastStream();

//  Future _post(String url, Map params) async {
//    if(UserinfoCacheManager.instance.checkUserLogin()){
//      _dio.options.headers={"token":UserinfoCacheManager.instance.getUserInfo
//    ().token};
//    }
//    var response = await _dio.post(url,data: params);
//    return response.data;
//  }
  Future _post(String url, Map params,{bool isUpload=false}) async {
    // if(UserinfoCacheManager.instance.checkUserLogin()){
    //   _dio.options.headers={"token":UserinfoCacheManager.instance.getUserInfo
    // ().token};
    // }
    if(isUpload){
      var image = await MultipartFile.fromBytes(params["file"],filename: params["name"]);
      FormData formData;
      formData = FormData.fromMap({"file":image,"bath":"bhapp","root":"image"});
      var response = await _dio.post(url,data: formData,onSendProgress: (received,total){
        print((received / total * 100).toStringAsFixed(0) + "%");
      });
      return response.data;
    }else{
      var response = await _dio.post(url,data: params);
      return response.data;
    }
  }

  Future _postParam(String url, Map params,{bool isUpload=false}) async {
    // if(UserinfoCacheManager.instance.checkUserLogin()){
    //   _dio.options.headers={"token":UserinfoCacheManager.instance.getUserInfo
    //     ().token};
    // }
    var response = await _dio.post(url,queryParameters: params);
    return response.data;
  }

  //这里通过fromFuture方法接收Future的异步方法，将中间的数据流交给RxDart处理
  Observable postFile(String url, Map params,{bool isUpload=false}) =>
      Observable.fromFuture(_postFile(url, params)).asBroadcastStream();

  Future _postFile(String url, Map params) async {
//    headerMap["Authorization"] = APP_KET;
    var image = await MultipartFile.fromBytes(params["file"],filename: params["name"]);
    FormData formData;
    formData = FormData.fromMap({"avatar":image});
    var response = await _dio.post(url,data: formData,onSendProgress: (received,total){
      print((received / total * 100).toStringAsFixed(0) + "%");
    });
    return response.data;
  }
}