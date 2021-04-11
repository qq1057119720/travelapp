import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AddBankPage extends Page<AddBankState, Map<String, dynamic>> {
  AddBankPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AddBankState>(
                adapter: null,
                slots: <String, Dependent<AddBankState>>{
                }),
            middleware: <Middleware<AddBankState>>[
            ],);

}
