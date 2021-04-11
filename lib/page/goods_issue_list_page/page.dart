import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GoodsIssueListPage extends Page<GoodsIssueListState, Map<String, dynamic>> {
  GoodsIssueListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GoodsIssueListState>(
                adapter: null,
                slots: <String, Dependent<GoodsIssueListState>>{
                }),
            middleware: <Middleware<GoodsIssueListState>>[
            ],);

}
