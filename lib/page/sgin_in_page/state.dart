import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/sgin_in_modle.dart';
import 'package:travelapp/model/sgin_in_task_model.dart';

class SginInState implements Cloneable<SginInState> {
  List<SginInTaskModel> tasklist = List();
  List<SginInModel> sginList = new List();

  @override
  SginInState clone() {
    return SginInState()
      ..tasklist = tasklist
      ..sginList = sginList;
  }
}

SginInState initState(Map<String, dynamic> args) {
  return SginInState();
}
