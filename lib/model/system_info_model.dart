import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class SystemInfoModel {
  SystemInfoModel({
    this.systeminfoid,
    this.infoname,
    this.infocontent,
    this.infotype,
    this.createtime,
  });

  factory SystemInfoModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : SystemInfoModel(
    systeminfoid: asT<String>(jsonRes['systeminfoid']),
    infoname: asT<String>(jsonRes['infoname']),
    infocontent: asT<String>(jsonRes['infocontent']),
    infotype: asT<int>(jsonRes['infotype']),
    createtime: asT<int>(jsonRes['createtime']),
  );

  String systeminfoid;
  String infoname;
  String infocontent;
  int infotype;
  int createtime;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'systeminfoid': systeminfoid,
    'infoname': infoname,
    'infocontent': infocontent,
    'infotype': infotype,
    'createtime': createtime,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
