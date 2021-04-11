import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class EquityShareModel {
  EquityShareModel({
    this.equityshareid,
    this.userid,
    this.equitycount,
    this.equitystatus,
    this.createtime,
  });

  factory EquityShareModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : EquityShareModel(
    equityshareid: asT<String>(jsonRes['equityshareid']),
    userid: asT<String>(jsonRes['userid']),
    equitycount: asT<double>(jsonRes['equitycount']),
    equitystatus: asT<int>(jsonRes['equitystatus']),
    createtime: asT<int>(jsonRes['createtime']),
  );

  String equityshareid;
  String userid;
  double equitycount;
  int equitystatus;
  int createtime;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'equityshareid': equityshareid,
    'userid': userid,
    'equitycount': equitycount,
    'equitystatus': equitystatus,
    'createtime': createtime,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
