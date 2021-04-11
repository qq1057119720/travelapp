import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SginInPage extends Page<SginInState, Map<String, dynamic>> {
  SginInPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SginInState>(
                adapter: null,
                slots: <String, Dependent<SginInState>>{
                }),
            middleware: <Middleware<SginInState>>[
            ],);

}
