import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AboutUsPage extends Page<AboutUsState, Map<String, dynamic>> {
  AboutUsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AboutUsState>(
                adapter: null,
                slots: <String, Dependent<AboutUsState>>{
                }),
            middleware: <Middleware<AboutUsState>>[
            ],);

}
