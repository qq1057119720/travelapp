import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class UserIntegralModel {
  UserIntegralModel({
    this.integralid,
    this.userid,
    this.integralcount,
    this.integraltype,
    this.integralremark,
    this.createtime,
  });

  factory UserIntegralModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : UserIntegralModel(
    integralid: asT<String>(jsonRes['integralid']),
    userid: asT<String>(jsonRes['userid']),
    integralcount: asT<int>(jsonRes['integralcount']),
    integraltype: asT<int>(jsonRes['integraltype']),
    integralremark: asT<String>(jsonRes['integralremark']),
    createtime: asT<int>(jsonRes['createtime']),
  );

  String integralid;
  String userid;
  int integralcount;
  int integraltype;
  String integralremark;
  int createtime;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'integralid': integralid,
    'userid': userid,
    'integralcount': integralcount,
    'integraltype': integraltype,
    'integralremark': integralremark,
    'createtime': createtime,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
