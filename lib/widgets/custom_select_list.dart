import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:flutter/material.dart';

///选择列表widgt的样式封装.
class CustomSelectList {
  Picker _picker;

  CustomSelectList(
      {PickerAdapter adapter,
      PickerConfirmCallback onConfirm,
      VoidCallback onCancel,
      String confirmText,
      String cancelText}) {
    _picker = Picker(
        itemExtent: 40,
        height: GlobalThemeStyles.instance.heightFromPx(444),
        confirmTextStyle: TextStyle(
            color: GlobalThemeStyles.instance.getThemeColor(),
            fontSize: 14),
        cancelTextStyle: TextStyle(
            color: GlobalThemeStyles.instance.getThemeColor(),
            fontSize: 14),
        confirmText: !BaseTools.isEmpty(confirmText) ? confirmText : "确认",
        cancelText: !BaseTools.isEmpty(cancelText) ? cancelText : "取消",
        textStyle: TextStyle(
            color: ColorUtil.color("666666"),
            fontSize: 14),
        selectedTextStyle: TextStyle(
            color: ColorUtil.color("333333"),
            fontSize: 16),
        adapter: adapter,
        changeToFirst: true,
        hideHeader: false,
        onConfirm: onConfirm,
        onCancel: onCancel); //_
  }

  Picker get picker => _picker;
}
