class GoodsDetailModel {
  int createtime;
  String city;
  String goodsid;
  List<Issuecontentlist> issuecontentlist;
  String goodsname;
  String remark;
  List<Commentlist> commentlist;
  String issuecontentcount;
  String province;
  double price;
  String goodsmessage;
  int salesvolume;
  List<PictureList> pictureList;
  String categoryid;
  int status;
  String goodshtml;
  int goodsstock;
  GoodsDetailModel({this.createtime,
    this.city,
    this.goodsid,
    this.issuecontentlist,
    this.goodsname,
    this.remark,
    this.commentlist,
    this.issuecontentcount,
    this.province,
    this.price,
    this.goodsmessage,
    this.salesvolume,
    this.pictureList,this.goodsstock,
    this.categoryid, this.goodshtml,
    this.status});

  GoodsDetailModel.fromJson(Map<String, dynamic> json) {
    createtime = json['createtime'];
    city = json['city'];
    goodsid = json['goodsid'];
    if (json['issuecontentlist'] != null) {
      issuecontentlist = new List<Issuecontentlist>();
      json['issuecontentlist'].forEach((v) {
        issuecontentlist.add(new Issuecontentlist.fromJson(v));
      });
    }
    goodsname = json['goodsname'];
    remark = json['remark'];
    if (json['commentlist'] != null) {
      commentlist = new List<Commentlist>();
      json['commentlist'].forEach((v) {
        commentlist.add(new Commentlist.fromJson(v));
      });
    }
    issuecontentcount = json['issuecontentcount'];
    province = json['province'];
    price = json['price'];
    goodsmessage = json['goodsmessage'];
    salesvolume = json['salesvolume'];
    if (json['pictureList'] != null) {
      pictureList = new List<PictureList>();
      json['pictureList'].forEach((v) {
        pictureList.add(new PictureList.fromJson(v));
      });
    }
    categoryid = json['categoryid'];
    status = json['status'];
    goodshtml = json['goodshtml'];
    goodsstock = json['goodsstock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createtime'] = this.createtime;
    data['city'] = this.city;
    data['goodsid'] = this.goodsid;
    data['goodsstock'] = this.goodsstock;
    if (this.issuecontentlist != null) {
      data['issuecontentlist'] =
          this.issuecontentlist.map((v) => v.toJson()).toList();
    }
    data['goodsname'] = this.goodsname;
    data['remark'] = this.remark;
    if (this.commentlist != null) {
      data['commentlist'] = this.commentlist.map((v) => v.toJson()).toList();
    }
    data['issuecontentcount'] = this.issuecontentcount;
    data['province'] = this.province;
    data['price'] = this.price;
    data['goodsmessage'] = this.goodsmessage;
    data['salesvolume'] = this.salesvolume;
    if (this.pictureList != null) {
      data['pictureList'] = this.pictureList.map((v) => v.toJson()).toList();
    }
    data['categoryid'] = this.categoryid;
    data['status'] = this.status;
    data['goodshtml'] = this.goodshtml;
    return data;
  }
}

class Issuecontentlist {
  int addtime;
  String goodsid;
  String userimage;
  String issuecontentid;
  String nickname;
  String userid;
  String contentname;
  int replycount;

  Issuecontentlist({this.addtime,
    this.goodsid,
    this.userimage,
    this.issuecontentid,
    this.nickname,
    this.userid,
    this.contentname,
    this.replycount});

  Issuecontentlist.fromJson(Map<String, dynamic> json) {
    addtime = json['addtime'];
    goodsid = json['goodsid'];
    userimage = json['userimage'];
    issuecontentid = json['issuecontentid'];
    nickname = json['nickname'];
    userid = json['userid'];
    contentname = json['contentname'];
    replycount = json['replycount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addtime'] = this.addtime;
    data['goodsid'] = this.goodsid;
    data['userimage'] = this.userimage;
    data['issuecontentid'] = this.issuecontentid;
    data['nickname'] = this.nickname;
    data['userid'] = this.userid;
    data['contentname'] = this.contentname;
    data['replycount'] = this.replycount;
    return data;
  }
}

class Commentlist {
  String commentcontent;
  String goodsid;
  String commenttype;
  String userid;
  int addtime;
  String userimage;
  String nickname;
  String commentid;
  String commentrating;
  List<PictureList> pictureList;

  Commentlist({this.commentcontent,
    this.goodsid,
    this.commenttype,
    this.userid,
    this.addtime, this.pictureList,
    this.userimage,
    this.nickname,
    this.commentid,
    this.commentrating});

  Commentlist.fromJson(Map<String, dynamic> json) {
    commentcontent = json['commentcontent'];
    goodsid = json['goodsid'];
    commenttype = json['commenttype'];
    userid = json['userid'];
    addtime = json['addtime'];
    userimage = json['userimage'];
    nickname = json['nickname'];
    commentid = json['commentid'];
    commentrating = json['commentrating'];
    if (json['pictureList'] != null) {
      pictureList = new List<PictureList>();
      json['pictureList'].forEach((v) {
        pictureList.add(new PictureList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentcontent'] = this.commentcontent;
    data['goodsid'] = this.goodsid;
    data['commenttype'] = this.commenttype;
    data['userid'] = this.userid;
    data['addtime'] = this.addtime;
    data['userimage'] = this.userimage;
    data['nickname'] = this.nickname;
    data['commentid'] = this.commentid;
    data['commentrating'] = this.commentrating;
    if (this.pictureList != null) {
      data['pictureList'] = this.pictureList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PictureList {
  int createtime;
  String fromid;
  String pictureid;
  String pictureurl;

  PictureList({this.createtime, this.fromid, this.pictureid, this.pictureurl});

  PictureList.fromJson(Map<String, dynamic> json) {
    createtime = json['createtime'];
    fromid = json['fromid'];
    pictureid = json['pictureid'];
    pictureurl = json['pictureurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createtime'] = this.createtime;
    data['fromid'] = this.fromid;
    data['pictureid'] = this.pictureid;
    data['pictureurl'] = this.pictureurl;
    return data;
  }
}

