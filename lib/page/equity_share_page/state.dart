import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/equity_share_record_model.dart';

class EquityShareState implements Cloneable<EquityShareState> {
  List<EquityShareRecordModel> recordList = List();

  ///页码.
  int pageIndex = 1;

  ///是否有更多.
  bool isMore = false;

  @override
  EquityShareState clone() {
    return EquityShareState()
      ..recordList = recordList
      ..isMore = isMore
      ..pageIndex = pageIndex;
  }
}

EquityShareState initState(Map<String, dynamic> args) {
  return EquityShareState();
}
