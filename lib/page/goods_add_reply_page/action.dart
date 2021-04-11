import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GoodsAddReplyAction { action }

class GoodsAddReplyActionCreator {
  static Action onAction() {
    return const Action(GoodsAddReplyAction.action);
  }
}
