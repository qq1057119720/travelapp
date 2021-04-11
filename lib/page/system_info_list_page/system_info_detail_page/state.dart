import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/system_info_model.dart';

class SystemInfoDetailState implements Cloneable<SystemInfoDetailState> {
  SystemInfoModel model;
  @override
  SystemInfoDetailState clone() {
    return SystemInfoDetailState()..model=model;
  }
}

SystemInfoDetailState initState(Map<String, dynamic> args) {
  SystemInfoDetailState state=new SystemInfoDetailState();
  state.model=args["model"];
  return state;
}
