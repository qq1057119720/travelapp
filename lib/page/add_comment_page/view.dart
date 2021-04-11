
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_right_widget.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';
import 'package:travelapp/widgets/ff_stars.dart';
import 'package:travelapp/widgets/images_gridview_widget.dart';
import 'package:travelapp/widgets/my_iamge.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AddCommentState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildGoodsInfo() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 10),
      decoration: BoxDecoration(
        color: GlobalThemeStyles.WHITE,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: CustomCachedImageWidget(
                        state.goodsModel.pictureList[0].pictureurl),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 14),
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            state.goodsModel.goodsname,
                            style: TextStyle(
                                fontSize: 14,
                                color: GlobalThemeStyles.instance
                                    .getMainTitleColor(),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "￥",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorUtil.color("#FF4F4F"),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "${state.goodsModel.price}",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: ColorUtil.color("#FF4F4F"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  return Scaffold(
    body: SafeArea(
      top: false,
      child: Flex(
          direction: Axis.vertical,
      children: <Widget>[
        CustomAppBarRightWidget(
          "发表评价",(){
            BaseTools.closePage(viewService.context);
        },rightWidget:  GestureDetector(
          onTap: (){
            dispatch(AddCommentActionCreator.onAddNewsInfo());
          },
          child: Container(
            margin: EdgeInsets.only(top: 30),
            width: 60,
            height: 40,
            alignment: Alignment.center,
            child: Text(
              "发布",style: TextStyle(fontSize: 14,color:
            GlobalThemeStyles
                .instance.getThemeColor()),
            ),
          ),
        )
        ),
        Expanded(
          flex: 1,
          child: ListView(
            children: <Widget>[
              _buildGoodsInfo(),

              Container(
                margin: EdgeInsets.only(left: 15,top: 15),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "描述相符",
                        style: TextStyle(
                          fontSize: 14,color: Colors.black,fontWeight:
                        FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      child: FFStars(
                        normalStar: Image.asset("assets/bh_xing_weixuan.png"),
                        selectedStar: Image.asset("assets/bh_xing_xuanzhong.png"),
                        starsChanged: (realStars, choosedStars) {
                          print("实际选择: ${choosedStars}, 最终得分: ${realStars}");
                        },
                        step: 0.01,/// 用于设置半星(0.5), 整星(1.0), 任意星(0.01), 可在0.01 - 1.0之间自定义, 默认值为0.01
                        currenStars: 0,/// 默认有几颗星星, 默认值为0
                        // starCount: 5,/// 一共有几颗星, 默认值5
                        // starHeight: 40,/// 星星的高度, 默认30
                        // starWidth: 40,/// 星星的宽度,默认30
                        starMargin: 1,/// 星星间的间距, 默认10
                        // justShow: true,/// 是否仅做展示, 默认false
                        // rounded: true,/// 四舍五入-取最近值, 默认false(进一法)
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15,top: 10),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "服务态度",
                        style: TextStyle(
                            fontSize: 14,color: Colors.black,fontWeight:
                        FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      child: FFStars(
                        normalStar: Image.asset("assets/bh_xing_weixuan.png"),
                        selectedStar: Image.asset("assets/bh_xing_xuanzhong.png"),
                        starsChanged: (realStars, choosedStars) {
                          print("实际选择: ${choosedStars}, 最终得分: ${realStars}");
                        },
                        step: 0.01,/// 用于设置半星(0.5), 整星(1.0), 任意星(0.01), 可在0.01 - 1.0之间自定义, 默认值为0.01
                        currenStars: 0,/// 默认有几颗星星, 默认值为0
                        // starCount: 5,/// 一共有几颗星, 默认值5
                        // starHeight: 40,/// 星星的高度, 默认30
                        // starWidth: 40,/// 星星的宽度,默认30
                        starMargin: 1,/// 星星间的间距, 默认10
                        // justShow: true,/// 是否仅做展示, 默认false
                        // rounded: true,/// 四舍五入-取最近值, 默认false(进一法)
                      ),
                    )
                  ],
                ),
              ),

              Container(
                height: 100,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                    left: 15, top: 20, bottom: 0, right: 30),
                child: TextField(
                  textAlign: TextAlign.start,
                  maxLines: 6,
                  decoration: InputDecoration(
                      hintText: "从多个角度评价，可以帮助更多想买的人",
                      hintStyle:TextStyle(
                          color: ColorUtil.color("333333"),
                          fontSize: UnifiedThemeStyles.normalFontSize),
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      filled: true,
                      fillColor: ColorUtil.color("#00ffffff"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none)),
                  controller: state.infoEditController,
                  focusNode: state.infoFocusNode,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  style: TextStyle(
                      color: ColorUtil.color("333333"),
                      fontSize: UnifiedThemeStyles.normalFontSize),
                  onChanged: (account) {
//                    dispatch(CheckPhoneActionCreator.onAccountChange());
                  },
                ),
              ),
              ImagesGridviewWidget((List<MyImage> images){
                List<Asset> list=new List();
                for(int i=0;i<images.length;i++){
                  list.add(images[i].asset);
                }
                dispatch(AddCommentActionCreator.onUpdateImages(list));
              }),
            ],
          ),
        )

      ],
      ),
    ),
  );
}
