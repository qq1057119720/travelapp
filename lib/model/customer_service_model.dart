import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class CustomerServiceModel {
  CustomerServiceModel({
    this.customerserviceid,
    this.accid,
    this.servicetype,
    this.serviceimage,
    this.nickname,
    this.imtoken,
    this.createtime,
  });

  factory CustomerServiceModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : CustomerServiceModel(
    customerserviceid: asT<String>(jsonRes['customerserviceid']),
    accid: asT<String>(jsonRes['accid']),
    servicetype: asT<int>(jsonRes['servicetype']),
    serviceimage: asT<String>(jsonRes['serviceimage']),
    nickname: asT<String>(jsonRes['nickname']),
    imtoken: asT<String>(jsonRes['imtoken']),
    createtime: asT<int>(jsonRes['createtime']),
  );

  String customerserviceid;
  String accid;
  int servicetype;
  String serviceimage;
  String nickname;
  String imtoken;
  int createtime;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'customerserviceid': customerserviceid,
    'accid': accid,
    'servicetype': servicetype,
    'serviceimage': serviceimage,
    'nickname': nickname,
    'imtoken': imtoken,
    'createtime': createtime,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
