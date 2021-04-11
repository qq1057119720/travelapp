class LocationModel {
  String country;
  String address;
  String code;
  String city;
  String province;
  String street;
  double latitude;
  String district;
  double longitude;

  LocationModel(
      {this.code,
      this.country,
      this.address,
      this.district,
      this.street,
      this.city,
      this.latitude,
      this.province,
      this.longitude});

  LocationModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    latitude = json['latitude'];
    province = json['province'];
    longitude = json['longitude'];

    code = json['code'];
    country = json['country'];
    district = json['district'];
    address = json['address'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['country'] = this.country;
    data['district'] = this.district;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['address'] = this.address;
    data['street'] = this.street;
    data['province'] = this.province;
    data['longitude'] = this.longitude;
    return data;
  }
}
