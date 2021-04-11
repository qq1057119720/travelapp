import 'package:fish_redux/fish_redux.dart';
import 'package:travelapp/model/order_detail_model.dart';

import 'action.dart';
import 'state.dart';

Reducer<AddCommentState> buildReducer() {
  return asReducer(
    <Object, Reducer<AddCommentState>>{
      AddCommentAction.action: _onAction,
      AddCommentAction.update_images: _updateImages,
      AddCommentAction.update_webimage: _onUpdateWebimage,
    },
  );
}

AddCommentState _onAction(AddCommentState state, Action action) {
  final AddCommentState newState = state.clone();
  return newState;
}
AddCommentState _updateImages(AddCommentState state, Action action) {
  final AddCommentState newState = state.clone();
  newState.images=action.payload;
  return newState;
}

AddCommentState _onUpdateWebimage(AddCommentState state, Action action) {
  final AddCommentState newState = state.clone();
  PictureList pictureModel=new PictureList();
  pictureModel.pictureurl=action.payload;
  newState.piclist.add(pictureModel);
  return newState;
}