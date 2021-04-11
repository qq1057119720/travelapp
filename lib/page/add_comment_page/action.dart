import 'package:fish_redux/fish_redux.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

//TODO replace with your own action
enum AddCommentAction {
  action,
  update_images,
  upload_image,
  update_webimage,
  add_news_info
}

class AddCommentActionCreator {
  static Action onAction() {
    return const Action(AddCommentAction.action);
  }

  static Action onAddNewsInfo() {
    return const Action(AddCommentAction.add_news_info);
  }
  static Action onUpdateImages(List<Asset> images) {
    return Action(AddCommentAction.update_images, payload: images);
  }

  static Action onUploadImage(int picIndex) {
    return Action(AddCommentAction.upload_image, payload: picIndex);
  }

  static Action onUpdateWebimage(String picurl) {
    return Action(AddCommentAction.update_webimage, payload: picurl);
  }
}
