import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

abstract class GlobalBaseState<T extends Cloneable<T>> implements Cloneable<T> {


  Locale get languageLocale;

  set languageLocale(Locale languageLocale);


}

class GlobalState implements GlobalBaseState<GlobalState> {

  @override
  Locale languageLocale;



  @override
  GlobalState clone() {
    // TODO: implement clone
    return GlobalState()
      ..languageLocale = languageLocale;
  }
}
