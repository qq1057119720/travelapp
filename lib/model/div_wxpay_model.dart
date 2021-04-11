import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class WxPayModel {
  WxPayModel({
    this.package,
    this.appid,
    this.sign,
    this.partnerid,
    this.prepayid,
    this.noncestr,
    this.timestamp,
  });

  factory WxPayModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : WxPayModel(
    package: asT<String>(jsonRes['package']),
    appid: asT<String>(jsonRes['appid']),
    sign: asT<String>(jsonRes['sign']),
    partnerid: asT<String>(jsonRes['partnerid']),
    prepayid: asT<String>(jsonRes['prepayid']),
    noncestr: asT<String>(jsonRes['noncestr']),
    timestamp: asT<String>(jsonRes['timestamp']),
  );

  String package;
  String appid;
  String sign;
  String partnerid;
  String prepayid;
  String noncestr;
  String timestamp;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'package': package,
    'appid': appid,
    'sign': sign,
    'partnerid': partnerid,
    'prepayid': prepayid,
    'noncestr': noncestr,
    'timestamp': timestamp,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
