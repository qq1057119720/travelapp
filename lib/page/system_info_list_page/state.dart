import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/system_info_model.dart';

class SystemInfoListState implements Cloneable<SystemInfoListState> {
  List<SystemInfoModel> list = new List();

  @override
  SystemInfoListState clone() {
    return SystemInfoListState()
      ..list = list;
  }
}

SystemInfoListState initState(Map<String, dynamic> args) {
  SystemInfoListState state = new SystemInfoListState();
  return state;
}
