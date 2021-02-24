import 'dart:async';

class CommonCountdownTimer {
  Timer _timer;

  static CommonCountdownTimer _instance;

  static CommonCountdownTimer get instance => _getInstance();

  factory CommonCountdownTimer() => _getInstance();

  CommonCountdownTimer._internal();

  static CommonCountdownTimer _getInstance() {
    if (_instance == null) {
      _instance = new CommonCountdownTimer._internal();
    }
    return _instance;
  }
}