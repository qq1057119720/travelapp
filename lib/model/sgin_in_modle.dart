import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class SginInModel {
  SginInModel({
    this.createtime,
    this.sginintime,
    this.sgininid,
    this.userid,
    this.sginintaskid,
    this.continuous,
  });

  factory SginInModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : SginInModel(
    createtime: asT<int>(jsonRes['createtime']),
    sginintime: asT<String>(jsonRes['sginintime']),
    sgininid: asT<String>(jsonRes['sgininid']),
    userid: asT<String>(jsonRes['userid']),
    sginintaskid: asT<String>(jsonRes['sginintaskid']),
    continuous: asT<String>(jsonRes['continuous']),
  );

  int createtime;
  String sginintime;
  String sgininid;
  String userid;
  String sginintaskid;
  String continuous;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'createtime': createtime,
    'sginintime': sginintime,
    'sgininid': sgininid,
    'userid': userid,
    'sginintaskid': sginintaskid,
    'continuous': continuous,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
