class UserLowerLevelModel {
  String birthday;
  String invitationcode;
  String city;
  String sex;
  double latitude;
  String relationshipid;
  String superiorid;
  String userlevelids;
  String nickspell;
  String userlogin;
  String userpassword;
  String realname;
  String imtoken;
  String province;
  int userlevel;
  String phone;
  String zone;
  String userimage;
  String nickname;
  String email;
  double longitude;
  int createtime;
  String userid;
  UserLowerLevelModel(
      {this.birthday,
        this.invitationcode,
        this.city,
        this.sex,
        this.latitude,
        this.relationshipid,
        this.superiorid,
        this.userlevelids,
        this.nickspell,
        this.userlogin,
        this.userpassword,
        this.realname,
        this.imtoken,
        this.province,
        this.userlevel,
        this.phone,
        this.zone,
        this.userimage,
        this.nickname,
        this.email,this.createtime,this.userid,
        this.longitude});

  UserLowerLevelModel.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    invitationcode = json['invitationcode'];
    city = json['city'];
    sex = json['sex'];
    userid = json['userid'];
    createtime = json['createtime'];
    latitude = json['latitude'];
    relationshipid = json['relationshipid'];
    superiorid = json['superiorid'];
    userlevelids = json['userlevelids'];
    nickspell = json['nickspell'];
    userlogin = json['userlogin'];
    userpassword = json['userpassword'];
    realname = json['realname'];
    imtoken = json['imtoken'];
    province = json['province'];
    userlevel = json['userlevel'];
    phone = json['phone'];
    zone = json['zone'];
    userimage = json['userimage'];
    nickname = json['nickname'];
    email = json['email'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['birthday'] = this.birthday;
    data['invitationcode'] = this.invitationcode;
    data['city'] = this.city;
    data['sex'] = this.sex;
    data['latitude'] = this.latitude;
    data['relationshipid'] = this.relationshipid;
    data['superiorid'] = this.superiorid;
    data['userlevelids'] = this.userlevelids;
    data['nickspell'] = this.nickspell;
    data['userlogin'] = this.userlogin;
    data['userpassword'] = this.userpassword;
    data['realname'] = this.realname;
    data['imtoken'] = this.imtoken;
    data['province'] = this.province;
    data['userlevel'] = this.userlevel;
    data['phone'] = this.phone;
    data['zone'] = this.zone;
    data['userimage'] = this.userimage;
    data['nickname'] = this.nickname;
    data['email'] = this.email;
    data['longitude'] = this.longitude;
    data['createtime'] = this.createtime;
    return data;
  }
}

