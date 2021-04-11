import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class EquitySharePage extends Page<EquityShareState, Map<String, dynamic>> {
  EquitySharePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<EquityShareState>(
                adapter: null,
                slots: <String, Dependent<EquityShareState>>{
                }),
            middleware: <Middleware<EquityShareState>>[
            ],);

}
