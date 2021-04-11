import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PhoneLoginPage extends Page<PhoneLoginState, Map<String, dynamic>> {
  PhoneLoginPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PhoneLoginState>(
                adapter: null,
                slots: <String, Dependent<PhoneLoginState>>{
                }),
            middleware: <Middleware<PhoneLoginState>>[
            ],);

}
