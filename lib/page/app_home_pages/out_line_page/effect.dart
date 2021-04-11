import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<OutLineState> buildEffect() {
  return combineEffects(<Object, Effect<OutLineState>>{
    OutLineAction.action: _onAction,
  });
}

void _onAction(Action action, Context<OutLineState> ctx) {
}
