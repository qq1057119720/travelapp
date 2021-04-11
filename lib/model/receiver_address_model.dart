class ReceiverAddressModel {
  String receiverid;
  String userid;
  String contacts;
  String contactnumber;
  String detailedaddress;
  String province;
  String city;
  String zone;
  int defaulted;
  int createtime;

  ReceiverAddressModel(
      {this.receiverid,
        this.userid,
        this.contacts,
        this.contactnumber,
        this.detailedaddress,
        this.province,
        this.city,
        this.zone,
        this.defaulted,
        this.createtime});

  ReceiverAddressModel.fromJson(Map<String, dynamic> json) {
    receiverid = json['receiverid'];
    userid = json['userid'];
    contacts = json['contacts'];
    contactnumber = json['contactnumber'];
    detailedaddress = json['detailedaddress'];
    province = json['province'];
    city = json['city'];
    zone = json['zone'];
    defaulted = json['defaulted'];
    createtime = json['createtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receiverid'] = this.receiverid;
    data['userid'] = this.userid;
    data['contacts'] = this.contacts;
    data['contactnumber'] = this.contactnumber;
    data['detailedaddress'] = this.detailedaddress;
    data['province'] = this.province;
    data['city'] = this.city;
    data['zone'] = this.zone;
    data['defaulted'] = this.defaulted;
    data['createtime'] = this.createtime;
    return data;
  }
}

