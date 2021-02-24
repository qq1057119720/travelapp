import 'dart:ui';

import 'package:event_bus/event_bus.dart';

/// The global [EventBus] object.
EventBus eventBus = EventBus();

/// Event A.
class StringEvent {
  String message;
  String orderid;
  String accid;
  String toUserId;
  StringEvent(this.message,{this.orderid,this.accid,this.toUserId});
}

/// Event B.
class CurrencyEvent {
  var text;

  CurrencyEvent(this.text);
}

class GlobalColor {
  int colorIndex;

  GlobalColor(this.colorIndex);
}

class GlobalLanguage {
  String language;

  GlobalLanguage(this.language);
}

///h5回调之后查询订单
class WebOrderQuery {
  String orderid;
  String accid;
  WebOrderQuery(this.orderid,this.accid);
}

class StartIm{
  String toUserId;
  StartIm(this.toUserId);
}

///eventbus tags.
class EventTags {
  ///资产界面
  static const ASSETS_EVENT_BUS = "资产界面";

  ///聊天界面
  static const FRIENDS_PAGE = "聊天界面";

  ///登陆成功
  static const LOGIN_EVENT_BUS = "登陆成功";

  ///退出登陆
  static const LOGIN_OUT_EVENT_BUS = "退出登陆";

  ///修改了个人信息
  static const MODIFY_USER_INFO = "修改个人信息成功";

  static const ORDER_QUERT="order_query";

  static const OPEN_IM="open_im";
  ///添加校园吧信息成功
  static const ADD_INFO_SUCCESS="add_info_success";
}
