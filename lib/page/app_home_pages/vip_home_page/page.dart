import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class VipHomePage extends Page<VipHomeState, Map<String, dynamic>> {
  VipHomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<VipHomeState>(
                adapter: null,
                slots: <String, Dependent<VipHomeState>>{
                }),
            middleware: <Middleware<VipHomeState>>[
            ],);

}
