import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SystemInfoDetailPage extends Page<SystemInfoDetailState, Map<String, dynamic>> {
  SystemInfoDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SystemInfoDetailState>(
                adapter: null,
                slots: <String, Dependent<SystemInfoDetailState>>{
                }),
            middleware: <Middleware<SystemInfoDetailState>>[
            ],);

}
