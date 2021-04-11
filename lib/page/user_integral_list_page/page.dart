import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserIntegralListPage extends Page<UserIntegralListState, Map<String, dynamic>> {
  UserIntegralListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UserIntegralListState>(
                adapter: null,
                slots: <String, Dependent<UserIntegralListState>>{
                }),
            middleware: <Middleware<UserIntegralListState>>[
            ],);

}
