class UserModel {
  String birthday;
  String invitationcode;
  int createtime;
  String city;
  String latitude;
  String sex;
  String userid;
  String nickspell;
  String realname;
  String userlogin;
  String userpassword;
  String imtoken;
  String province;
  int userlevel;
  String phone;
  String zone;
  String userimage;
  String nickname;
  String email;
  String longitude;
  bool loginout;
  UserModel(
      {this.birthday,
        this.invitationcode,
        this.createtime,
        this.city,
        this.latitude,
        this.sex,
        this.userid,
        this.nickspell,
        this.realname,
        this.userlogin,
        this.userpassword,
        this.imtoken,
        this.province,
        this.userlevel,
        this.phone,
        this.zone,
        this.userimage,
        this.nickname,this.loginout,
        this.email,
        this.longitude});

  UserModel.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    invitationcode = json['invitationcode'];
    createtime = json['createtime'];
    city = json['city'];
    latitude = json['latitude'];
    sex = json['sex'];
    userid = json['userid'];
    nickspell = json['nickspell'];
    realname = json['realname'];
    userlogin = json['userlogin'];
    userpassword = json['userpassword'];
    imtoken = json['imtoken'];
    province = json['province'];
    userlevel = json['userlevel'];
    phone = json['phone'];
    zone = json['zone'];
    userimage = json['userimage'];
    nickname = json['nickname'];
    loginout = json['loginout'];
    email = json['email'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthday'] = this.birthday;
    data['invitationcode'] = this.invitationcode;
    data['createtime'] = this.createtime;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['sex'] = this.sex;
    data['userid'] = this.userid;
    data['nickspell'] = this.nickspell;
    data['realname'] = this.realname;
    data['userlogin'] = this.userlogin;
    data['userpassword'] = this.userpassword;
    data['imtoken'] = this.imtoken;
    data['province'] = this.province;
    data['userlevel'] = this.userlevel;
    data['phone'] = this.phone;
    data['zone'] = this.zone;
    data['userimage'] = this.userimage;
    data['nickname'] = this.nickname;
    data['email'] = this.email;
    data['loginout'] = this.loginout;
    data['longitude'] = this.longitude;
    return data;
  }
}

