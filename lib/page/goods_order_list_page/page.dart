import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GoodsOrderListPage extends Page<GoodsOrderListState, Map<String, dynamic>> {
  GoodsOrderListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GoodsOrderListState>(
                adapter: null,
                slots: <String, Dependent<GoodsOrderListState>>{
                }),
            middleware: <Middleware<GoodsOrderListState>>[
            ],);

}
