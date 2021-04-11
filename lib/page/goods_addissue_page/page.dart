import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GoodsAddissuePage extends Page<GoodsAddissueState, Map<String, dynamic>> {
  GoodsAddissuePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GoodsAddissueState>(
                adapter: null,
                slots: <String, Dependent<GoodsAddissueState>>{
                }),
            middleware: <Middleware<GoodsAddissueState>>[
            ],);

}
