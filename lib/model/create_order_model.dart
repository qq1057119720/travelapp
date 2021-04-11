class CreateOrderModel {
  String goodsorderid;
  String userid;
  String ordernumber;
  double allprice;
  int paytype;
  int orderstatus;
  String remark;
  String receiveraddress;
  String addressee;
  String phone;

  CreateOrderModel(
      {this.goodsorderid,
        this.userid,
        this.ordernumber,
        this.allprice,
        this.paytype,
        this.orderstatus,
        this.remark,
        this.receiveraddress,
        this.addressee,
        this.phone});

  CreateOrderModel.fromJson(Map<String, dynamic> json) {
    goodsorderid = json['goodsorderid'];
    userid = json['userid'];
    ordernumber = json['ordernumber'];
    allprice = json['allprice'];
    paytype = json['paytype'];
    orderstatus = json['orderstatus'];
    remark = json['remark'];
    receiveraddress = json['receiveraddress'];
    addressee = json['addressee'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsorderid'] = this.goodsorderid;
    data['userid'] = this.userid;
    data['ordernumber'] = this.ordernumber;
    data['allprice'] = this.allprice;
    data['paytype'] = this.paytype;
    data['orderstatus'] = this.orderstatus;
    data['remark'] = this.remark;
    data['receiveraddress'] = this.receiveraddress;
    data['addressee'] = this.addressee;
    data['phone'] = this.phone;
    return data;
  }
}

