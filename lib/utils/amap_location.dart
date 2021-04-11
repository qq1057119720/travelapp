import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AmapLoaction {
  static const String locationchanel = "locationchanel";

  static const String START_LOCATION = "startLocation";


 static Future<Map> startLocation() async {
   final platform = MethodChannel(locationchanel);
    return await platform.invokeMethod(START_LOCATION);
  }
}
