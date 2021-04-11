class UserBankModel {
  String banimg;
  String bankcardid;
  String addtime;
  String ownername;
  String brankname;
  String owneridnumber;
  String ownerphone;
  String cardnumber;
  String isdefault;
  String userid;
  String openingbranch;

  UserBankModel(
      {this.banimg,
        this.bankcardid,
        this.addtime,
        this.ownername,
        this.brankname,
        this.owneridnumber,
        this.ownerphone,
        this.cardnumber,
        this.isdefault,
        this.userid,
        this.openingbranch});

  UserBankModel.fromJson(Map<String, dynamic> json) {
    banimg = json['banimg'];
    bankcardid = json['bankcardid'];
    addtime = json['addtime'];
    ownername = json['ownername'];
    brankname = json['brankname'];
    owneridnumber = json['owneridnumber'];
    ownerphone = json['ownerphone'];
    cardnumber = json['cardnumber'];
    isdefault = json['isdefault'];
    userid = json['userid'];
    openingbranch = json['openingbranch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banimg'] = this.banimg;
    data['bankcardid'] = this.bankcardid;
    data['addtime'] = this.addtime;
    data['ownername'] = this.ownername;
    data['brankname'] = this.brankname;
    data['owneridnumber'] = this.owneridnumber;
    data['ownerphone'] = this.ownerphone;
    data['cardnumber'] = this.cardnumber;
    data['isdefault'] = this.isdefault;
    data['userid'] = this.userid;
    data['openingbranch'] = this.openingbranch;
    return data;
  }
}

