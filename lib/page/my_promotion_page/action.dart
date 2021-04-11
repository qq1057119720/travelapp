import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MyPromotionAction { action ,save_image,save_erweima}

class MyPromotionActionCreator {
  static Action onAction() {
    return const Action(MyPromotionAction.action);
  }
  static Action saveImage() {
    return const Action(MyPromotionAction.save_image);
  }
  static Action saveErweima() {
    return const Action(MyPromotionAction.save_erweima);
  }
}
