import 'package:fish_redux/fish_redux.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

//TODO replace with your own action
enum FeedBackAction {
  action,
  select_img,
  delete_img,
  update_web_image,
  to_feed_back,
  update_images,
}

class FeedBackActionCreator {
  static Action onAction() {
    return const Action(FeedBackAction.action);
  }
  static Action toFeedBack() {
    return const Action(FeedBackAction.to_feed_back);
  }
  static Action onSelectImg() {
    return const Action(FeedBackAction.select_img);
  }

  static Action onDeleteImg(int index) {
    return Action(FeedBackAction.delete_img, payload: index);
  }

  static Action onUpdateWebImage(String imageUrl) {
    return Action(FeedBackAction.update_web_image, payload: imageUrl);
  }
  static Action onUpdateImages(List<Asset> images) {
    return Action(FeedBackAction.update_images, payload: images);
  }
}
