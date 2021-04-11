import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/system_info_model.dart';

//TODO replace with your own action
enum SystemInfoListAction { action,update_system_info }

class SystemInfoListActionCreator {
  static Action onAction() {
    return const Action(SystemInfoListAction.action);
  }
  static Action updateSystemInfo(List<SystemInfoModel> list) {
    return Action(SystemInfoListAction.update_system_info,payload: list);
  }
}
