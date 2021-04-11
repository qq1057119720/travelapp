import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class UserWalletModel {
  UserWalletModel({
    this.walletid,
    this.userid,
    this.totalmoney,
    this.freezemoney,
    this.walletstatus,
    this.createtime,
  });

  factory UserWalletModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : UserWalletModel(
    walletid: asT<String>(jsonRes['walletid']),
    userid: asT<String>(jsonRes['userid']),
    totalmoney: asT<double>(jsonRes['totalmoney']),
    freezemoney: asT<double>(jsonRes['freezemoney']),
    walletstatus: asT<int>(jsonRes['walletstatus']),
    createtime: asT<int>(jsonRes['createtime']),
  );

  String walletid;
  String userid;
  double totalmoney;
  double freezemoney;
  int walletstatus;
  int createtime;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'walletid': walletid,
    'userid': userid,
    'totalmoney': totalmoney,
    'freezemoney': freezemoney,
    'walletstatus': walletstatus,
    'createtime': createtime,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
