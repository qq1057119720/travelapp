import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GoodsAddReplyPage extends Page<GoodsAddReplyState, Map<String, dynamic>> {
  GoodsAddReplyPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GoodsAddReplyState>(
                adapter: null,
                slots: <String, Dependent<GoodsAddReplyState>>{
                }),
            middleware: <Middleware<GoodsAddReplyState>>[
            ],);

}
