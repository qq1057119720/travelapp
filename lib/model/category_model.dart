import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class CategoryModel {
  CategoryModel({
    this.categoryimage,
    this.categoryname,
    this.createtime,
    this.categorylevel,
    this.superiorid,
    this.categoryid,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : CategoryModel(
    categoryimage: asT<String>(jsonRes['categoryimage']),
    categoryname: asT<String>(jsonRes['categoryname']),
    createtime: asT<int>(jsonRes['createtime']),
    categorylevel: asT<int>(jsonRes['categorylevel']),
    superiorid: asT<Object>(jsonRes['superiorid']),
    categoryid: asT<String>(jsonRes['categoryid']),
  );

  String categoryimage;
  String categoryname;
  int createtime;
  int categorylevel;
  Object superiorid;
  String categoryid;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'categoryimage': categoryimage,
    'categoryname': categoryname,
    'createtime': createtime,
    'categorylevel': categorylevel,
    'superiorid': superiorid,
    'categoryid': categoryid,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
