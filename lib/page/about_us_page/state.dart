import 'package:fish_redux/fish_redux.dart';

class AboutUsState implements Cloneable<AboutUsState> {

  @override
  AboutUsState clone() {
    return AboutUsState();
  }
}

AboutUsState initState(Map<String, dynamic> args) {
  return AboutUsState();
}
