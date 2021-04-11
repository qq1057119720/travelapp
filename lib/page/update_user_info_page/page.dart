import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UpdateUserInfoPage extends Page<UpdateUserInfoState, Map<String, dynamic>> {
  UpdateUserInfoPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UpdateUserInfoState>(
                adapter: null,
                slots: <String, Dependent<UpdateUserInfoState>>{
                }),
            middleware: <Middleware<UpdateUserInfoState>>[
            ],);

}
