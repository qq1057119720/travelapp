import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

//TODO replace with your own action
enum UpdateUserInfoAction {
  action,
  select_sex,
  update_sex,
  select_city,
  updat_city,
  select_image,
  update_image,
  update_userinfo,
  update_images,
  update_select_date,
  on_select_date,
}

class UpdateUserInfoActionCreator {
  static Action onAction() {
    return const Action(UpdateUserInfoAction.action);
  }
  static Action onUpdateImages(List<Asset> images) {
    return Action(UpdateUserInfoAction.update_images, payload: images);
  }

  static Action onSelectSex() {
    return const Action(UpdateUserInfoAction.select_sex);
  }

  static Action onSelectCity() {
    return const Action(UpdateUserInfoAction.select_city);
  }

  static Action onUpdateUserInfo() {
    return const Action(UpdateUserInfoAction.update_userinfo);
  }

  static Action onSelectImage() {
    return const Action(UpdateUserInfoAction.select_image);
  }

  static Action onUpdateImage(File iconFile) {
    return Action(UpdateUserInfoAction.update_image, payload: iconFile);
  }

  static Action onUpdateSex(String sex) {
    return Action(UpdateUserInfoAction.update_sex, payload: sex);
  }

  static Action onUpdateCity(String province, String city, String zone) {
    return Action(UpdateUserInfoAction.updat_city,
        payload: [province, city, zone]);
  }
  static Action onSelectDate() {
    return const Action(UpdateUserInfoAction.on_select_date);
  }

  static Action updateSelectDate(String time) {
    return Action(UpdateUserInfoAction.update_select_date, payload: time);
  }


}
