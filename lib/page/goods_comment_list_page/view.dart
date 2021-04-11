import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/model/goods_detail_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GoodsCommentListState state, Dispatch dispatch, ViewService viewService) {

  Widget _imageWidgets(List<PictureList> picList) {
    List<Widget> widgetList = new List();
    for (int j = 0; j < picList.length; j++) {
      widgetList.add(new GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1),
          child: CustomCachedImageWidget(
            picList[j].pictureurl,
            width: 75,
            height:75,
          ),
        ),
        onTap: () {
          dispatch(GoodsCommentListActionCreator.onShowImage(picList, j));
        },
      ));
    }

    return Container(
      alignment: Alignment.topLeft,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 9, // 主轴(水平)方向间距
        runSpacing: 9, // 纵轴（垂直）方向间距
        children: widgetList,
      ),
    );
  }

  Widget _buildItemView(int index){
    Commentlist commentlist=state.commentlist[index];
    return Container(
      margin: EdgeInsets.only(left: 23,right: 19,top:15 ),
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 39,
                  height: 39,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(39/2),
                    child: CustomCachedImageWidget(
                      commentlist.userimage,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 11),
                  child: Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          commentlist.nickname,style: TextStyle(
                          fontSize: 13,color: ColorUtil.color("#2C2C2C")
                        ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          DateUtil.formatDateMs(commentlist.addtime,format: "yyyy-MM-dd"),style: TextStyle(
                            fontSize: 11,color: ColorUtil.color("#A0A0A0")
                        ),
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 14),
            child: Text(
              commentlist.commentcontent,
              style: TextStyle(
                fontSize: 15,color: Colors.black
              ),
            ),
          ),
          _imageWidgets(commentlist.pictureList),
          Container(
            margin: EdgeInsets.only(top: 14.5),
            height: 1,
            color: ColorUtil.color("#D8D8D8"),
          )
        ],
      ),
    );
  }
  Widget _buildListView() {
    return EasyRefresh(
      header: MaterialHeader(),
      footer: BezierBounceFooter(
          backgroundColor: GlobalThemeStyles.instance.getThemeColor()),
      child: ListView.builder(
          padding: EdgeInsets.only(top: 0),
          itemBuilder: (c, i) => _buildItemView(i),
          itemCount:state.commentlist!=null&&state.commentlist.length>0?state
              .commentlist.length:0),
      onRefresh: () async {
        await dispatch(GoodsCommentListActionCreator.onRefresh());
      },
      onLoad: () async {
        await dispatch(GoodsCommentListActionCreator.onLoadMore());

      },
    );
  }
  return Scaffold(
    backgroundColor: ColorUtil.color("#F8F8F8"),
    body: SafeArea(
      top: false,
      child: Container(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            CustomAppBarWidget(
              "用户点评",(){
                BaseTools.closePage(viewService.context);
            }
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: _buildListView(),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
