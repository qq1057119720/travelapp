import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/widgets/custom_appbar_right_widget.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(FeedBackState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildLine(){
    return Container(
      height: 0.5,
      color: ColorUtil.color("#F0F0F0"),
      margin: EdgeInsets.only(left: 24,right: 24,top: 5),
    );
  }
  Widget _selectImageWidget() {
    int girdLength = 1;
    double imageHeight=150;
    if (state.images != null && state.images.length > 0) {
      girdLength = state.images.length + 1;
      if(state.images.length>=3){
        imageHeight=150;
      }
      if(state.images.length>=6){
        imageHeight=430;
      }
    }
    return Container(
      height: imageHeight,
      margin: EdgeInsets.only(left: 31.5, right: 31.5),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: List.generate(girdLength, (index) {
          if (index == (girdLength - 1)) {
            return GestureDetector(
              onTap: () {
                dispatch(FeedBackActionCreator.onSelectImg());
              },
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    color: ColorUtil.color("#ffffff"),
                    borderRadius: BorderRadius.circular(5.0)),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/bh_task_pushimage.png"),
                  ],
                ),
              ),
            );
          } else {
            Asset asset = state.images[index];

            return Stack(
              children: <Widget>[
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: AssetThumb(
                    asset: asset,
                    width: 90,
                    height: 90,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      dispatch(FeedBackActionCreator.onDeleteImg(index));
                    },
                    child: Image.asset("assets/cgm_iss_delete.png"),
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }


  Widget _buildItem(int index){
    if(index==0){
      return Container(
        padding: EdgeInsets.only(top: 16,left: 24,right: 24),
        alignment: Alignment.centerLeft,
        child: TextField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              hintText: "请输入反馈内容～",
              contentPadding:
              EdgeInsets.symmetric(vertical: 0),
              filled: true,
              fillColor: GlobalThemeStyles.WHITE,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none)),
          controller: state.contentEditController,
          focusNode: state.contentFocusNode,
          keyboardType: TextInputType.text,
          autofocus: false,
          maxLines: 15,
          minLines: 8,
          style: TextStyle(
              color: GlobalThemeStyles.instance
                  .getMainTitleColor(),
              fontSize: 14),
        ),
      );
    }else if(index==1){
      return _selectImageWidget();
    }
  }

  Widget _buildListView() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemBuilder: (c, i) => _buildItem(i),
        itemCount: 2);
  }

  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      top: false,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          CustomAppBarWidget("意见反馈", (){
            Navigator.pop(viewService.context);

          }),


          Expanded(
            flex: 1,
            child: _buildListView(),
          ),


          GestureDetector(
            onTap: (){
              dispatch(FeedBackActionCreator.toFeedBack());
            },
            child:  Container(
              margin: EdgeInsets.only(top: 3,bottom: 40,left: 68,right: 68),
              width: GlobalThemeStyles.instance.widthFromPx(478),
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:   GlobalThemeStyles.instance.getThemeColor(),

                borderRadius:BorderRadius.all(Radius
                    .circular(24)),
              ),
              child: Text(
                "提交",style: TextStyle(fontSize: 14,color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
