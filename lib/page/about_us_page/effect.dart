import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AboutUsState> buildEffect() {
  return combineEffects(<Object, Effect<AboutUsState>>{
    AboutUsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AboutUsState> ctx) {
}
