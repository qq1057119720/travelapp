import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SystemInfoListPage extends Page<SystemInfoListState, Map<String, dynamic>> {
  SystemInfoListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SystemInfoListState>(
                adapter: null,
                slots: <String, Dependent<SystemInfoListState>>{
                }),
            middleware: <Middleware<SystemInfoListState>>[
            ],);

}
