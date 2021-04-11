import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AppHomePage extends Page<AppHomeState, Map<String, dynamic>> {
  AppHomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AppHomeState>(
                adapter: null,
                slots: <String, Dependent<AppHomeState>>{
                }),
            middleware: <Middleware<AppHomeState>>[
            ],);

}
