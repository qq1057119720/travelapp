import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GoodsAddissueAction { action }

class GoodsAddissueActionCreator {
  static Action onAction() {
    return const Action(GoodsAddissueAction.action);
  }
}
