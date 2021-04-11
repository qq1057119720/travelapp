import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class SginInTaskModel {
  SginInTaskModel({
    this.sginintaskid,
    this.taskname,
    this.taskcontent,
    this.integralcount,
    this.addtime,
  });

  factory SginInTaskModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : SginInTaskModel(
    sginintaskid: asT<String>(jsonRes['sginintaskid']),
    taskname: asT<String>(jsonRes['taskname']),
    taskcontent: asT<String>(jsonRes['taskcontent']),
    integralcount: asT<int>(jsonRes['integralcount']),
    addtime: asT<int>(jsonRes['addtime']),
  );

  String sginintaskid;
  String taskname;
  String taskcontent;
  int integralcount;
  int addtime;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'sginintaskid': sginintaskid,
    'taskname': taskname,
    'taskcontent': taskcontent,
    'integralcount': integralcount,
    'addtime': addtime,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
