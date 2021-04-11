import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CateGoodListPage extends Page<CateGoodListState, Map<String, dynamic>> {
  CateGoodListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CateGoodListState>(
                adapter: null,
                slots: <String, Dependent<CateGoodListState>>{
                }),
            middleware: <Middleware<CateGoodListState>>[
            ],);

}
