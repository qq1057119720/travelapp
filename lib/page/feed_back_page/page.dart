import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FeedBackPage extends Page<FeedBackState, Map<String, dynamic>> {
  FeedBackPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FeedBackState>(
                adapter: null,
                slots: <String, Dependent<FeedBackState>>{
                }),
            middleware: <Middleware<FeedBackState>>[
            ],);

}
