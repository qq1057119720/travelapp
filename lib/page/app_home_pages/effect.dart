import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AppHomeState> buildEffect() {
  return combineEffects(<Object, Effect<AppHomeState>>{
    AppHomeAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AppHomeState> ctx) {
}
