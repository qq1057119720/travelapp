import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GoodsIssueDetailPage extends Page<GoodsIssueDetailState, Map<String, dynamic>> {
  GoodsIssueDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GoodsIssueDetailState>(
                adapter: null,
                slots: <String, Dependent<GoodsIssueDetailState>>{
                }),
            middleware: <Middleware<GoodsIssueDetailState>>[
            ],);

}
