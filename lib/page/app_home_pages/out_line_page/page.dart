import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class OutLinePage extends Page<OutLineState, Map<String, dynamic>> {
  OutLinePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<OutLineState>(
                adapter: null,
                slots: <String, Dependent<OutLineState>>{
                }),
            middleware: <Middleware<OutLineState>>[
            ],);

}
