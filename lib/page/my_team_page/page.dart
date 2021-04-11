import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyTeamPage extends Page<MyTeamState, Map<String, dynamic>> {
  MyTeamPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyTeamState>(
                adapter: null,
                slots: <String, Dependent<MyTeamState>>{
                }),
            middleware: <Middleware<MyTeamState>>[
            ],);

}
