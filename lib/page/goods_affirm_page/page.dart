import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GoodsAffirmPage extends Page<GoodsAffirmState, Map<String, dynamic>> {
  GoodsAffirmPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GoodsAffirmState>(
                adapter: null,
                slots: <String, Dependent<GoodsAffirmState>>{
                }),
            middleware: <Middleware<GoodsAffirmState>>[
            ],);

}
