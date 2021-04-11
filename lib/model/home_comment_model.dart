import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class HomeCommentModel {
  HomeCommentModel({
    this.replyuser,
    this.commentcontent,
    this.goodsid,
    this.commenttype,
    this.likecount,
    this.userid,
    this.addtime,
    this.commenttitle,
    this.commentstate,
    this.replyid,
    this.commentid,
    this.commentrating,
    this.pictureList,
    this.objectid,
    this.replycount,
  });

  factory HomeCommentModel.fromJson(Map<String, dynamic> jsonRes) {
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
    return HomeCommentModel(
      replyuser: asT<String>(jsonRes['replyuser']),
      commentcontent: asT<String>(jsonRes['commentcontent']),
      goodsid: asT<String>(jsonRes['goodsid']),
      commenttype: asT<String>(jsonRes['commenttype']),
      likecount: asT<int>(jsonRes['likecount']),
      userid: asT<String>(jsonRes['userid']),
      addtime: asT<int>(jsonRes['addtime']),
      commenttitle: asT<String>(jsonRes['commenttitle']),
      commentstate: asT<String>(jsonRes['commentstate']),
      replyid: asT<String>(jsonRes['replyid']),
      commentid: asT<String>(jsonRes['commentid']),
      commentrating: asT<String>(jsonRes['commentrating']),
      pictureList: pictureList,
      objectid: asT<String>(jsonRes['objectid']),
      replycount: asT<int>(jsonRes['replycount']),
    );
  }

  String replyuser;
  String commentcontent;
  String goodsid;
  String commenttype;
  int likecount;
  String userid;
  int addtime;
  String commenttitle;
  String commentstate;
  String replyid;
  String commentid;
  String commentrating;
  List<PictureList> pictureList;
  String objectid;
  int replycount;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'replyuser': replyuser,
    'commentcontent': commentcontent,
    'goodsid': goodsid,
    'commenttype': commenttype,
    'likecount': likecount,
    'userid': userid,
    'addtime': addtime,
    'commenttitle': commenttitle,
    'commentstate': commentstate,
    'replyid': replyid,
    'commentid': commentid,
    'commentrating': commentrating,
    'pictureList': pictureList,
    'objectid': objectid,
    'replycount': replycount,
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
