import 'package:fish_redux/fish_redux.dart';

class OutLineState implements Cloneable<OutLineState> {

  @override
  OutLineState clone() {
    return OutLineState();
  }
}

OutLineState initState(Map<String, dynamic> args) {
  return OutLineState();
}
