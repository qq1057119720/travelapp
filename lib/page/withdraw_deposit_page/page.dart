import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WithdrawDepositPage extends Page<WithdrawDepositState, Map<String, dynamic>> {
  WithdrawDepositPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WithdrawDepositState>(
                adapter: null,
                slots: <String, Dependent<WithdrawDepositState>>{
                }),
            middleware: <Middleware<WithdrawDepositState>>[
            ],);

}
