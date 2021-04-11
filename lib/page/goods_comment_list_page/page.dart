import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GoodsCommentListPage extends Page<GoodsCommentListState, Map<String, dynamic>> {
  GoodsCommentListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GoodsCommentListState>(
                adapter: null,
                slots: <String, Dependent<GoodsCommentListState>>{
                }),
            middleware: <Middleware<GoodsCommentListState>>[
            ],);

}
