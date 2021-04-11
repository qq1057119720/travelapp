import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PayOrderPage extends Page<PayOrderState, Map<String, dynamic>> {
  PayOrderPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PayOrderState>(
                adapter: null,
                slots: <String, Dependent<PayOrderState>>{
                }),
            middleware: <Middleware<PayOrderState>>[
            ],);

}
