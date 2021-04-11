import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyPromotionPage extends Page<MyPromotionState, Map<String, dynamic>> {
  MyPromotionPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyPromotionState>(
                adapter: null,
                slots: <String, Dependent<MyPromotionState>>{
                }),
            middleware: <Middleware<MyPromotionState>>[
            ],);

}
