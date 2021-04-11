import 'dart:io';

import 'package:travelapp/constants/net_url_constant.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/connectivity_utils.dart';
import 'package:travelapp/utils/toast_tools.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'http_proxy.dart';
import 'package:rxdart/rxdart.dart';

///网络回调
typedef NetSuccess(data);
typedef NetFail(code, msg);
typedef NetError(e);

class ApiWork {
  static ApiWork _instance;

  static ApiWork get instance => _getInstance();

  factory ApiWork() => _getInstance();

  ApiWork._internal();

  static ApiWork _getInstance() {
    if (_instance == null) {
      _instance = new ApiWork._internal();
    }
    return _instance;
  }

  ///处理网络请求
  ///  NetSuccess netSuccess 请求成功
  ///  NetFail netFail 请求失败
  ///  NetError netError 请求出错
  void netObservable(Map<String, dynamic> param, String url,
      {bool isUpload = false,
      NetSuccess netSuccess,
      NetFail netFail,
      NetError netError}) {
//    if(CommectivityUtils.instance.connectivityResult==ConnectivityResult.none){
//      ToastTools.showToast("当前无网络，请检查网络连接");
//      print("当前无网络，请检查网络连接");
//      return;
//    }
    HttpProxy.instance.post(url, param).listen((response) {
      if (response["code"] == "200") {
        netSuccess(response["data"]);
      } else {
        netFail(response["code"], response["msg"]);
      }
    }, onError: (e) {
      if (netError != null) {
        netError(e);
      }
    });
  }
  void netFileObservable(Map<String,dynamic> param,String
  url,{NetSuccess netSuccess,NetFail netFail,NetError netError}){
    HttpProxy.instance.postFile(url, param).listen((response) {
      if(response["code"]=="200"){
        netSuccess(response["data"]);
      }else{
        netFail(response["code"],response["msg"]);
      }
    }, onError: (e) {
      if(netError!=null){
        netError(e);
      }
    });

  }



  ///判断是否可以加载更多
  bool checkIsMore(int dataSize) => dataSize >= 10;

  void getTravelCategoryList({NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, dynamic> param = new Map();
    netObservable(param, NetUrlConstant.GET_TRAVEL_CATEGORY_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }


  ///发送短信
  void sendSmsCode(String phone, String type,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["phone"] = phone;
    param["type"] = type;
    netObservable(param, NetUrlConstant.SEND_SMS_CODE,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  ///注册
  void register(String phone,  String userpassword, String code,String
  invitationcode,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["phone"] = phone;
    param["userpassword"] = userpassword;
    param["code"] = code;
    if(!BaseTools.isEmpty(invitationcode)){
      param["invitationcode"] = invitationcode;
    }
    netObservable(param, NetUrlConstant.REGISTER,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  ///登录
  void userLogin(String account, String password,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["account"] = account;
    param["password"] = password;
    netObservable(param, NetUrlConstant.USER_LOGIN,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void userCodeLogin(String account,  String code,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["account"] = account;
    param["code"] = code;
    netObservable(param, NetUrlConstant.USER_CODE_LOGIN,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getTravelRecommendGoods(String categoryid,String currentPage,String size,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["categoryid"] = categoryid;
    param["currentPage"] = currentPage;
    param["size"] = size;
    netObservable(param, NetUrlConstant.GET_TRAVEL_RECOMMEND_GOODS,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getHomeCommentList(String currentPage,String size,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["currentPage"] = currentPage;
    param["size"] = size;
    netObservable(param, NetUrlConstant.GET_HOME_COMMENT_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getTravelGoodsDetail(String goodsid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["goodsid"] = goodsid;
    netObservable(param, NetUrlConstant.GET_TRAVEL_GOODS_DETAIL,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getTravelGoodsList(String categoryid,String currentPage,String size,
      {String keyword,NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["categoryid"] = categoryid;
    param["currentPage"] = currentPage;
    param["size"] = size;
    if(!BaseTools.isEmpty(keyword)){
      param["keyword"] = keyword;
    }
    netObservable(param, NetUrlConstant.GET_TRAVEL_GOODS_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }


  void addReceiverAddress(String userid,String province, String city, String
  zone,
      String detailedaddress, String contacts, String contactnumber,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["province"] = province;
    param["city"] = city;
    param["zone"] = zone;
    param["detailedaddress"] = detailedaddress;
    param["contacts"] = contacts;
    param["contactnumber"] = contactnumber;
    param["userid"] = userid;
    netObservable(param, NetUrlConstant.ADD_RECEIVER_ADDRESS,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getReceiverAddressList(String userid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    netObservable(param, NetUrlConstant.GET_RECEIVER_ADDRESS_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void createOrder(String userid,String goodscount,String goodsid,String
  allprice,String paytype,String remark,String receiveraddress,String addressee,
      String phone,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    param["goodscount"] = goodscount;
    param["goodsid"] = goodsid;
    param["allprice"] = allprice;
    param["paytype"] = paytype;
    param["remark"] = remark;
    param["receiveraddress"] = receiveraddress;
    param["addressee"] = addressee;
    param["phone"] = phone;
    netObservable(param, NetUrlConstant.CREATE_ORDER,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void alipay(String orderNum,String totalPrice,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, dynamic> param = new Map();
    param["orderNum"] = orderNum;
    param["totalPrice"] = totalPrice;
    netObservable(param, NetUrlConstant.ALIPAY,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void wxpay(String orderNum,String totalPrice,String description,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, dynamic> param = new Map();
    param["orderNum"] = orderNum;
    param["totalPrice"] = totalPrice;
    param["description"] = description;
    netObservable(param, NetUrlConstant.WXPAY,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getGoodsCommentList(String goodsid,String currentPage,String size,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["goodsid"] = goodsid;
    param["currentPage"] = currentPage;
    param["size"] = size;
    netObservable(param, NetUrlConstant.GET_GOODS_COMMENT_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void getIssueContentsByGoods(String goodsid,String currentPage,String size,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["goodsid"] = goodsid;
    param["currentPage"] = currentPage;
    param["size"] = size;
    netObservable(param, NetUrlConstant.GET_ISSUE_CONTENTS_BY_GOODS,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void getIssueReplyByContent(String issuecontentid,String currentPage,String size,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["issuecontentid"] = issuecontentid;
    param["currentPage"] = currentPage;
    param["size"] = size;
    netObservable(param, NetUrlConstant.GET_ISSUE_REPLY_BY_CONTENT,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void addIssueReply(String userid,String replycontent,String issuecontentid,
      String replycount,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    param["replycontent"] = replycontent;
    param["issuecontentid"] = issuecontentid;
    param["replycount"] =replycount;
    netObservable(param, NetUrlConstant.ADD_ISSUE_REPLY,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void addIssueContent(String userid,String goodsid,String contentname,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    param["goodsid"] = goodsid;
    param["contentname"] = contentname;
    netObservable(param, NetUrlConstant.ADD_ISSUE_CONTENT,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void selectWeekSginIn(String userid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    netObservable(param, NetUrlConstant.SELECT_WEEK_SGIN_IN,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void sginIn(String userid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    netObservable(param, NetUrlConstant.SGIN_IN,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }



  void getSginInTaskList(
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    netObservable(param, NetUrlConstant.GET_SGIN_IN_TASK_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }


  void getOrderList(String userid,String currentPage,String size,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    param["currentPage"] = currentPage;
    param["size"] = size;
    netObservable(param, NetUrlConstant.GET_ORDER_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void updateOrder(String goodsorderid,String orderstatus,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["goodsorderid"] = goodsorderid;
    param["orderstatus"] = orderstatus;
    netObservable(param, NetUrlConstant.UPDATE_ORDER,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void addPicture(String file,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["file"] = file;
    netObservable(param, NetUrlConstant.ADD_PICTURE,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }



  void addComment(String userid,String pictureList,String goodsorderid,String
  commentcontent,String goodsid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    param["pictureList"] = pictureList;
    param["goodsorderid"] = goodsorderid;
    param["commentcontent"] = commentcontent;
    param["goodsid"] = goodsid;
    netObservable(param, NetUrlConstant.ADD_COMMENT,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getUserInfo(String userid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    netObservable(param, NetUrlConstant.GET_USER_INFO,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getUserTravelWallet(String userid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    netObservable(param, NetUrlConstant.GET_USER_TRAVEL_WALLET,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void getTravelWalletLogList(String userid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    netObservable(param, NetUrlConstant.GET_TRAVEL_WALLET_LOG_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getUserIntegralCount(String userid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    netObservable(param, NetUrlConstant.GET_USER_INTEGRAL_COUNT,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getUserIntegralList(String userid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    netObservable(param, NetUrlConstant.GET_USER_INTEGRAL_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getTravelSystemInfoList(
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    netObservable(param, NetUrlConstant.GET_TRAVEL_SYSTEM_INFO_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }


  void getUserRelationshipList(String userid,String currentPage,String size,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    param["currentPage"] = currentPage;
    param["size"] = size;
    netObservable(param, NetUrlConstant.GET_USER_RELATIONSHIP_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void updateUser(String userid,String userimage,String nickname,String sex,
  String birthday,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    param["userimage"] = userimage;
    param["nickname"] = nickname;
    param["sex"] = sex;
    param["birthday"] = birthday;
    netObservable(param, NetUrlConstant.UPDATE_USER,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void getCustomerServiceList(String type,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["type"] = type;
    netObservable(param, NetUrlConstant.GET_CUSTOMER_SERVICE_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void findPassword(String account,String password,String code,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["account"] = account;
    param["password"] = password;
    param["code"] = code;
    netObservable(param, NetUrlConstant.FIND_PASSWORD,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  //

  void uploadImage(var files,String name,{NetSuccess
  netSuccess,NetFail netFail,netError})async {
    //构造请求基类数据
    Map<String, dynamic> param = new Map();
    param["file"]=files;
    param["name"]=name;
    netFileObservable(param,NetUrlConstant.UPLOAD_IMAGE,netSuccess: netSuccess,
        netError: netError,netFail: netFail);
  }



  void getUserEquityShares(String userid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    netObservable(param, NetUrlConstant.GET_USER_EQUITY_SHARES,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void getEquityShareRecordList(String userid,String currentPage,String size,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    param["currentPage"] = currentPage;
    param["size"] = size;
    netObservable(param, NetUrlConstant.GET_EQUITY_SHARE_RECORD_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getuserbanklist(String userid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    netObservable(param, NetUrlConstant.getuserbanklist,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void getBankList(
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    netObservable(param, NetUrlConstant.GET_BANK_LIST,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void bindbankcard(String userid,String brankname,String ownername,String
  ownerphone,String owneridnumber,String openingbranch,String cardnumber,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    param["brankname"] = brankname;
    param["ownername"] = ownername;
    param["ownerphone"] = ownerphone;
    param["owneridnumber"] = owneridnumber;
    param["cardnumber"] = cardnumber;
    param["openingbranch"] = openingbranch;
    netObservable(param, NetUrlConstant.bindbankcard,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void deleteBank(String bankcardid,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["bankcardid"] = bankcardid;
    netObservable(param, NetUrlConstant.DELETE_BANK,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }
  void withdrawDeposit(String userid,String bankcardid,String money,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    param["bankcardid"] = bankcardid;
    param["money"] = money;
    netObservable(param, NetUrlConstant.WITHDRAW_DEPOSIT,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }

  void recharge(String userid,String money,
      {NetSuccess netSuccess, NetFail netFail, netError}) {
    Map<String, String> param = new Map();
    param["userid"] = userid;
    param["money"] = money;
    netObservable(param, NetUrlConstant.recharge,
        netSuccess: netSuccess, netError: netError, netFail: netFail);
  }



}
