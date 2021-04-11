import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class WalletLogModel {
  WalletLogModel({
    this.walletlogid,
    this.recordnumber,
    this.userid,
    this.changestatus,
    this.changemoney,
    this.money,
    this.frontmoney,
    this.logremark,this.createtime
  });

  factory WalletLogModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : WalletLogModel(
    walletlogid: asT<String>(jsonRes['walletlogid']),
    recordnumber: asT<String>(jsonRes['recordnumber']),
    userid: asT<String>(jsonRes['userid']),
    changestatus: asT<int>(jsonRes['changestatus']),
    createtime: asT<int>(jsonRes['createtime']),
    changemoney: asT<double>(jsonRes['changemoney']),
    money: asT<double>(jsonRes['money']),
    frontmoney: asT<double>(jsonRes['frontmoney']),
    logremark: asT<String>(jsonRes['logremark']),
  );

  String walletlogid;
  String recordnumber;
  String userid;
  int changestatus;
  double changemoney;
  double money;
  double frontmoney;
  String logremark;
  int createtime;
  Map<String, dynamic> toJson() => <String, dynamic>{
    'walletlogid': walletlogid,
    'recordnumber': recordnumber,
    'userid': userid,
    'changestatus': changestatus,
    'changemoney': changemoney,
    'money': money,
    'frontmoney': frontmoney,
    'createtime': createtime,
    'logremark': logremark,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
