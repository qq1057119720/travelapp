
///防止多次点击
class OnMultiClickListener {
 static DateTime lastPopTime;

  ///设置回退到手机桌面
  static bool onMultiClick({int seconds=2})  {

    if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: seconds)){
      lastPopTime = DateTime.now();
      return true;
    }
    return false;
  }
}

