import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelapp/cache/sp_util.dart';
import 'package:travelapp/config/config.dart';
import 'package:travelapp/constants/net_url_constant.dart';
import 'package:travelapp/utils/toast_tools.dart';

///常用工具类
class BaseTools {
  ///获取随机数
  static String getNonceStr() {
    //定义随机的字符
    String alphabet =
        'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890';
    // 生成的字符串固定长度
    int strlenght = 16;
    String left = '';
    for (var i = 0; i < strlenght; i++) {
      left = left + alphabet[Random().nextInt(alphabet.length)];
    }
    return left;
  }

  ///生成签名
  static String getHeaderSgin(Map<String, dynamic> map, String appSecret) {
    //对map的key进行排序
    List<dynamic> keys = map.keys.toList();
    // key排序
    keys.sort((a, b) {
      List<int> al = a.codeUnits;
      List<int> bl = b.codeUnits;
      for (int i = 0; i < al.length; i++) {
        if (bl.length <= i) return 1;
        if (al[i] > bl[i]) {
          return 1;
        } else if (al[i] < bl[i]) return -1;
      }
      return 0;
    });
    //拼接需要加密的字符串
    String jointStr = "";
    for (int i = 0; i < keys.length; i++) {
      jointStr = jointStr + keys[i] + "=" + map[keys[i]] + "&";
    }
    jointStr = jointStr + appSecret;

    var content = new Utf8Encoder().convert(jointStr);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  ///验证手机号码格式
  static bool isPhone(String phonenumber) {
    return new RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(phonenumber);
  }

  static bool isEmail(String emailNum) {
    return new RegExp('\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*')
        .hasMatch(emailNum);
  }

  ///判空
  static bool isEmpty(Object object) {
    if (object == null) return true;
    if (object is String && object.isEmpty) {
      return true;
    } else if (object is List && object.isEmpty) {
      return true;
    } else if (object is Map && object.isEmpty) {
      return true;
    }
    return false;
  }

  ///获取屏幕宽度
  static double getWidth(BuildContext ctx) {
    return MediaQuery.of(ctx).size.width;
  }

  ///获取屏幕高度
  static double getHeight(BuildContext ctx) {
    return MediaQuery.of(ctx).size.height;
  }

  ///判空字符串并返回安全数据
  static String checkString(String txt, {bool isImg = false}) => isImg
      ? (isEmpty(txt) ? NetUrlConstant.IMAGE_EMPTY : txt)
      : (isEmpty(txt) ? "" : txt);

  ///文本复制到剪贴板
  static void copyToClipboard(
      GlobalKey<ScaffoldState> scaffoldState, String copyContent,
      {String msg = "已复制到剪切板"}) {
    Clipboard.setData(ClipboardData(text: copyContent));
    scaffoldState.currentState.showSnackBar(ToastTools.showSnackBar(Text(msg)));
  }
  ///登录密码
  static bool isLoginPassword(String input) {
    RegExp mobile = new RegExp(r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$");
    return mobile.hasMatch(input);
  }
  ///数字密码
  static bool isValidateCaptcha(String input) {
    RegExp mobile = new RegExp(r"\d{6}$");
    return mobile.hasMatch(input);
  }
  ///拆分url
  /// xxx=xxx&xxx=xxx
  static Map<String,dynamic> resolutionUrl(String url){
    Map<String,dynamic> map=new Map();
    List<String> list=url.split("&");
    for(String string in list){
      List<String> list2=string.split("=");
      map[list2[0]]=list2[1];
    }
    return map;
  }

 static String requestGetParams(Map<String, String> params) {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      return paramStr;
    }
    return "";
  }

  /*
  * 通过图片路径将图片转换成Base64字符串
  */
  static Future image2Base64(String path) async {
    File file = new File(path);
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }
  static Future byteImage2Base64(ByteData byteData) async {
    Uint8List pngBytes = byteData.buffer.asUint8List();
    return base64Encode(pngBytes);
  }
  ///判断是否可以加载更多
  static bool checkMore(List<dynamic> list) {
    if (list != null) {
      if (list.length >= 8) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }


  static String getTimeImageName(String timeName){
    String imageName="";
    switch(timeName){
      case "1":
        imageName="assets/cp_user_curr_1.png";
        break;
      case "2":
        imageName="assets/cp_user_curr_2.png";
        break;
      case "3":
        imageName="assets/cp_user_curr_3.png";
        break;
      case "4":
        imageName="assets/cp_user_curr_4.png";
        break;
      case "5":
        imageName="assets/curr5.png";
        break;
      case "6":
        imageName="assets/curr6.png";
        break;
      case "7":
        imageName="assets/curr7.png";
        break;
      case "8":
        imageName="assets/curr8.png";
        break;
      case "9":
        imageName="assets/curr9.png";
        break;
      case "0":
        imageName="assets/cp_user_curr_0.png";
        break;
      case "-":
        imageName="assets/cp_user_curr_gang.png";
        break;
      case ":":
        imageName="assets/cp_user_curr_mh.png";
        break;
    }
    return imageName;
  }

  static String getIssueTimeImageName(String timeName){
    String imageName="";
    switch(timeName){
      case "1":
        imageName="assets/issue_1.png";
        break;
      case "2":
        imageName="assets/issue_2.png";
        break;
      case "3":
        imageName="assets/issue_3.png";
        break;
      case "4":
        imageName="assets/issue_4.png";
        break;
      case "5":
        imageName="assets/issue_5.png";
        break;
      case "6":
        imageName="assets/issue_6.png";
        break;
      case "7":
        imageName="assets/issue_7.png";
        break;
      case "8":
        imageName="assets/issue_8.png";
        break;
      case "9":
        imageName="assets/issue_9.png";
        break;
      case "0":
        imageName="assets/issue_0.png";
        break;
      case "-":
        imageName="assets/issue_gang.png";
        break;
      case "/":
        imageName="assets/issue_xiegang.png";
        break;
    }
    return imageName;
  }


  static String getTimeTableName(String timeName){
    String imageName="";
    switch(timeName){
      case "00:00am":
        imageName="assets/cp_time_00.png";
        break;
      case "01:00am":
        imageName="assets/cp_time_01.png";
        break;
      case "02:00am":
        imageName="assets/cp_time_02.png";
        break;
      case "03:00am":
        imageName="assets/cp_time_03.png";
        break;
      case "04:00am":
        imageName="assets/cp_time_04.png";
        break;
      case "05:00am":
        imageName="assets/cp_time_05.png";
        break;
      case "06:00am":
        imageName="assets/cp_time_06.png";
        break;
      case "07:00am":
        imageName="assets/cp_time_07.png";
        break;
      case "08:00am":
        imageName="assets/cp_time_08.png";
        break;
      case "09:00am":
        imageName="assets/cp_time_09.png";
        break;
      case "10:00am":
        imageName="assets/cp_time_10.png";
        break;
      case "11:00am":
        imageName="assets/cp_time_11.png";
        break;
      case "12:00pm":
        imageName="assets/cp_time_12.png";
        break;
      case "01:00pm":
        imageName="assets/cp_time_13.png";
        break;
      case "02:00pm":
        imageName="assets/cp_time_14.png";
        break;
      case "03:00pm":
        imageName="assets/cp_time_15.png";
        break;
      case "04:00pm":
        imageName="assets/cp_time_16.png";
        break;
      case "05:00pm":
        imageName="assets/cp_time_17.png";
        break;
      case "06:00pm":
        imageName="assets/cp_time_18.png";
        break;
      case "07:00pm":
        imageName="assets/cp_time_19.png";
        break;
      case "08:00pm":
        imageName="assets/cp_time_20.png";
        break;
      case "09:00pm":
        imageName="assets/cp_time_21.png";
        break;
      case "10:00pm":
        imageName="assets/cp_time_22.png";
        break;
      case "11:00pm":
        imageName="assets/cp_time_23.png";
        break;




    }
    return imageName;
  }


  static closePage(BuildContext context){
    Navigator.pop(context);
  }


  static String randomBit(int len) {
    String scopeF = '123456789'; //首位
    String scopeC = '0123456789'; //中间
    String result = '';
    for (int i = 0; i < len; i++) {
      if (i == 0) {
        result = scopeF[Random().nextInt(scopeF.length)];
      } else {
        result = result + scopeC[Random().nextInt(scopeC.length)];
      }
    }  return result;
  }

  static String randomBit1(int len) {
    String scopeF = '123456'; //首位
    String scopeC = '123456'; //中间
    String result = '';
    for (int i = 0; i < len; i++) {
      if (i == 0) {
        result = scopeF[Random().nextInt(scopeF.length)];
      } else {
        result = result + scopeC[Random().nextInt(scopeC.length)];
      }
    }  return result;
  }
  static String getFontFamily(){
    String _localThemeLocale =
    SpUtil.getString(Config.LOCAL_THEME_LOCALE_KEY);
    if (!BaseTools.isEmpty(_localThemeLocale)) {
      if(_localThemeLocale=="en"){
        return "hyxkf";
      }else{
        return "hyjxk";
      }
    }else{
      return "hyjxk";
    }
  }
  static Future unitListImage2Base64(Uint8List pngBytes) async {
    return base64Encode(pngBytes);
  }

  static String getVipLevel(int level){
    if(level==2){
      return "会员";
    }else if(level==3){
      return "代理";
    }else if(level==4){
      return "高级代理";
    }else if(level==5){
      return "总代理";
    }else{
      return "游客";
    }
  }
}
