import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/sgin_in_modle.dart';
import 'package:travelapp/model/sgin_in_task_model.dart';

//TODO replace with your own action
enum SginInAction { action ,sgin_in,update_sginin_list,update_sgin_task_list}

class SginInActionCreator {
  static Action onAction() {
    return const Action(SginInAction.action);
  }

  static Action onSginIn() {
    return const Action(SginInAction.sgin_in);
  }

  static Action updateSgininList(List<SginInModel> list) {
    return  Action(SginInAction.update_sginin_list,payload: list);
  }


  static Action updateSginTaskList(List<SginInTaskModel> list) {
    return  Action(SginInAction.update_sgin_task_list,payload: list);
  }
}
