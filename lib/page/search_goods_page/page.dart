import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchGoodsPage extends Page<SearchGoodsState, Map<String, dynamic>> {
  SearchGoodsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchGoodsState>(
                adapter: null,
                slots: <String, Dependent<SearchGoodsState>>{
                }),
            middleware: <Middleware<SearchGoodsState>>[
            ],);

}
