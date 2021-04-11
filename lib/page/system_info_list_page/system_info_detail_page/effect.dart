import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SystemInfoDetailState> buildEffect() {
  return combineEffects(<Object, Effect<SystemInfoDetailState>>{
    SystemInfoDetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SystemInfoDetailState> ctx) {
}
