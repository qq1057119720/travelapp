import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/customer_service_model.dart';

//TODO replace with your own action
enum AppSettingAction { action ,  update_kefumodel,
  update_yonghumodel,  to_chat,}

class AppSettingActionCreator {
  static Action onAction() {
    return const Action(AppSettingAction.action);
  }
  static Action updateKefumodel(List<CustomerServiceModel> model) {
    return Action(AppSettingAction.update_kefumodel, payload: model);
  }
  static Action toChat() {
    return const Action(AppSettingAction.to_chat);
  }
  static Action updateYonghumodel(List<CustomerServiceModel> model) {
    return Action(AppSettingAction.update_yonghumodel, payload: model);
  }
}
