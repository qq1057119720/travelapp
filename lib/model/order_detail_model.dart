import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class OrderDetailModel {
  OrderDetailModel({
    this.orderstatus,
    this.city,
    this.goodsid,
    this.paytime,
    this.goodsname,
    this.remark,
    this.userid,
    this.orderremark,
    this.addressee,
    this.province,
    this.phone,
    this.allprice,
    this.price,
    this.goodscount,
    this.ordernumber,
    this.goodsorderid,
    this.receiveraddress,
    this.goodsmessage,
    this.salesvolume,
    this.paytype,
    this.pictureList,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> jsonRes) {
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
    return OrderDetailModel(
      orderstatus: asT<int>(jsonRes['orderstatus']),
      city: asT<String>(jsonRes['city']),
      goodsid: asT<String>(jsonRes['goodsid']),
      paytime: asT<int>(jsonRes['paytime']),
      goodsname: asT<String>(jsonRes['goodsname']),
      remark: asT<String>(jsonRes['remark']),
      userid: asT<String>(jsonRes['userid']),
      orderremark: asT<String>(jsonRes['orderremark']),
      addressee: asT<String>(jsonRes['addressee']),
      province: asT<String>(jsonRes['province']),
      phone: asT<String>(jsonRes['phone']),
      allprice: asT<double>(jsonRes['allprice']),
      price: asT<double>(jsonRes['price']),
      goodscount: asT<int>(jsonRes['goodscount']),
      ordernumber: asT<String>(jsonRes['ordernumber']),
      goodsorderid: asT<String>(jsonRes['goodsorderid']),
      receiveraddress: asT<String>(jsonRes['receiveraddress']),
      goodsmessage: asT<String>(jsonRes['goodsmessage']),
      salesvolume: asT<int>(jsonRes['salesvolume']),
      paytype: asT<int>(jsonRes['paytype']),
      pictureList: pictureList,
    );
  }

  int orderstatus;
  String city;
  String goodsid;
  int paytime;
  String goodsname;
  String remark;
  String userid;
  String orderremark;
  String addressee;
  String province;
  String phone;
  double allprice;
  double price;
  int goodscount;
  String ordernumber;
  String goodsorderid;
  String receiveraddress;
  String goodsmessage;
  int salesvolume;
  int paytype;
  List<PictureList> pictureList;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'orderstatus': orderstatus,
    'city': city,
    'goodsid': goodsid,
    'paytime': paytime,
    'goodsname': goodsname,
    'remark': remark,
    'userid': userid,
    'orderremark': orderremark,
    'addressee': addressee,
    'province': province,
    'phone': phone,
    'allprice': allprice,
    'price': price,
    'goodscount': goodscount,
    'ordernumber': ordernumber,
    'goodsorderid': goodsorderid,
    'receiveraddress': receiveraddress,
    'goodsmessage': goodsmessage,
    'salesvolume': salesvolume,
    'paytype': paytype,
    'pictureList': pictureList,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}

class PictureList {
  PictureList({
    this.createtime,
    this.fromid,
    this.pictureid,
    this.pictureurl,
  });

  factory PictureList.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : PictureList(
    createtime: asT<int>(jsonRes['createtime']),
    fromid: asT<String>(jsonRes['fromid']),
    pictureid: asT<String>(jsonRes['pictureid']),
    pictureurl: asT<String>(jsonRes['pictureurl']),
  );

  int createtime;
  String fromid;
  String pictureid;
  String pictureurl;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'createtime': createtime,
    'fromid': fromid,
    'pictureid': pictureid,
    'pictureurl': pictureurl,
  };
  @override
  String toString() {
    return json.encode(this);
  }
}
