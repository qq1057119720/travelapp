import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyBalanceListPage extends Page<MyBalanceListState, Map<String, dynamic>> {
  MyBalanceListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyBalanceListState>(
                adapter: null,
                slots: <String, Dependent<MyBalanceListState>>{
                }),
            middleware: <Middleware<MyBalanceListState>>[
            ],);

}
