import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PasswordLoginPage extends Page<PasswordLoginState, Map<String, dynamic>> {
  PasswordLoginPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PasswordLoginState>(
                adapter: null,
                slots: <String, Dependent<PasswordLoginState>>{
                }),
            middleware: <Middleware<PasswordLoginState>>[
            ],);

}
