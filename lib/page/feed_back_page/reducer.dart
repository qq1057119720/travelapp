import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FeedBackState> buildReducer() {
  return asReducer(
    <Object, Reducer<FeedBackState>>{
      FeedBackAction.action: _onAction,
      FeedBackAction.update_images: _updateImages,
      FeedBackAction.delete_img: _deleteImg,
      FeedBackAction.update_web_image: _onUpdateWebImage,
    },
  );
}

FeedBackState _onAction(FeedBackState state, Action action) {
  final FeedBackState newState = state.clone();
  return newState;
}
FeedBackState _updateImages(FeedBackState state, Action action) {
  final FeedBackState newState = state.clone();
  newState.images=action.payload;
  return newState;
}
FeedBackState _deleteImg(FeedBackState state, Action action) {
  final FeedBackState newState = state.clone();
  int index=action.payload;
  newState.images.removeAt(index);
  return newState;
}
FeedBackState _onUpdateWebImage(FeedBackState state, Action action) {
  final FeedBackState newState = state.clone();
  newState.webImageList.add(action.payload);
  return newState;
}