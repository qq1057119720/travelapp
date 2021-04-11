import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class EquityShareRecordModel {
  EquityShareRecordModel({
    this.equityrecordid,
    this.changestatus,
    this.createtime,
    this.frontcount,
    this.changecount,
    this.logremark,
    this.allcount,
    this.userid,
  });

  factory EquityShareRecordModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : EquityShareRecordModel(
    equityrecordid: asT<String>(jsonRes['equityrecordid']),
    changestatus: asT<int>(jsonRes['changestatus']),
    createtime: asT<int>(jsonRes['createtime']),
    frontcount: asT<double>(jsonRes['frontcount']),
    changecount: asT<double>(jsonRes['changecount']),
    logremark: asT<String>(jsonRes['logremark']),
    allcount: asT<double>(jsonRes['allcount']),
    userid: asT<String>(jsonRes['userid']),
  );

  String equityrecordid;
  int changestatus;
  int createtime;
  double frontcount;
  double changecount;
  String logremark;
  double allcount;
  String userid;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'equityrecordid': equityrecordid,
    'changestatus': changestatus,
    'createtime': createtime,
    'frontcount': frontcount,
    'changecount': changecount,
    'logremark': logremark,
    'allcount': allcount,
    'userid': userid,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
