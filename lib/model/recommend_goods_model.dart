import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class RecommendGoodsModel {
  RecommendGoodsModel({
    this.goodsdes,
    this.createtime,
    this.province,
    this.city,
    this.goodsid,
    this.price,
    this.goodsmessage,
    this.goodsname,
    this.remark,
    this.salesvolume,
    this.pictureList,
  });

  factory RecommendGoodsModel.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<PictureList> pictureList =
    jsonRes['pictureList'] is List ? <PictureList>[] : null;
    if (pictureList != null) {
      for (final dynamic item in jsonRes['pictureList']) {
        if (item != null) {
          pictureList
              .add(PictureList.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return RecommendGoodsModel(
      goodsdes: asT<Object>(jsonRes['goodsdes']),
      createtime: asT<int>(jsonRes['createtime']),
      province: asT<String>(jsonRes['province']),
      city: asT<String>(jsonRes['city']),
      goodsid: asT<String>(jsonRes['goodsid']),
      price: asT<double>(jsonRes['price']),
      goodsmessage: asT<String>(jsonRes['goodsmessage']),
      goodsname: asT<String>(jsonRes['goodsname']),
      remark: asT<String>(jsonRes['remark']),
      salesvolume: asT<int>(jsonRes['salesvolume']),
      pictureList: pictureList,
    );
  }

  Object goodsdes;
  int createtime;
  String province;
  String city;
  String goodsid;
  double price;
  String goodsmessage;
  String goodsname;
  String remark;
  int salesvolume;
  List<PictureList> pictureList;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'goodsdes': goodsdes,
    'createtime': createtime,
    'province': province,
    'city': city,
    'goodsid': goodsid,
    'price': price,
    'goodsmessage': goodsmessage,
    'goodsname': goodsname,
    'remark': remark,
    'salesvolume': salesvolume,
    'pictureList': pictureList,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class PictureList {
  PictureList({
    this.pictureid,
    this.pictureurl,
    this.fromid,
    this.createtime,
  });

  factory PictureList.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : PictureList(
    pictureid: asT<String>(jsonRes['pictureid']),
    pictureurl: asT<String>(jsonRes['pictureurl']),
    fromid: asT<String>(jsonRes['fromid']),
    createtime: asT<int>(jsonRes['createtime']),
  );

  String pictureid;
  String pictureurl;
  String fromid;
  int createtime;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'pictureid': pictureid,
    'pictureurl': pictureurl,
    'fromid': fromid,
    'createtime': createtime,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
