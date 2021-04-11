import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReceiverAddressPage extends Page<ReceiverAddressState, Map<String, dynamic>> {
  ReceiverAddressPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ReceiverAddressState>(
                adapter: null,
                slots: <String, Dependent<ReceiverAddressState>>{
                }),
            middleware: <Middleware<ReceiverAddressState>>[
            ],);

}
