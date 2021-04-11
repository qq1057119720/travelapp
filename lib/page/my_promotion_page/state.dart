import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class MyPromotionState implements Cloneable<MyPromotionState> {
  GlobalKey repaintWidgetKey = GlobalKey(); // 绘图key值

  GlobalKey repaintWidgetKey2 = GlobalKey(); // 绘图key值
  @override
  MyPromotionState clone() {
    return MyPromotionState()..repaintWidgetKey=repaintWidgetKey
      ..repaintWidgetKey2=repaintWidgetKey2;
  }
}

MyPromotionState initState(Map<String, dynamic> args) {
  return MyPromotionState();
}
