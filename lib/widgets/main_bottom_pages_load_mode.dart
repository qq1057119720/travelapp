import 'package:flutter/cupertino.dart';

///避免主界面切换时重复加载.
class MainBottomPagesLoadMode extends StatefulWidget {
  final Widget mainPage;
  final String tagName;

  MainBottomPagesLoadMode(this.mainPage, this.tagName);

  @override
  _MainBottomPagesLoadModeState createState() =>
      _MainBottomPagesLoadModeState();
}

class _MainBottomPagesLoadModeState extends State<MainBottomPagesLoadMode>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.mainPage;
  }

  @override
  bool get wantKeepAlive => true;
}
