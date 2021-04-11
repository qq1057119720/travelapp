import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyBalancePage extends Page<MyBalanceState, Map<String, dynamic>> {
  MyBalancePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyBalanceState>(
                adapter: null,
                slots: <String, Dependent<MyBalanceState>>{
                }),
            middleware: <Middleware<MyBalanceState>>[
            ],);

}
