import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/customer_service_model.dart';

class AppSettingState implements Cloneable<AppSettingState> {
  List<CustomerServiceModel> kefuModel=List();
  List<CustomerServiceModel> yonghuModel=List();
  @override
  AppSettingState clone() {
    return AppSettingState() ..kefuModel = kefuModel
      ..yonghuModel = yonghuModel;
  }
}

AppSettingState initState(Map<String, dynamic> args) {
  return AppSettingState();
}
