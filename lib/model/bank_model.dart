class BankModel {
  String bankid;
  String name;
  String banimg;
  int level;

  BankModel({this.bankid, this.name, this.banimg, this.level});

  BankModel.fromJson(Map<String, dynamic> json) {
    bankid = json['bankid'];
    name = json['name'];
    banimg = json['banimg'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankid'] = this.bankid;
    data['name'] = this.name;
    data['banimg'] = this.banimg;
    data['level'] = this.level;
    return data;
  }
}

