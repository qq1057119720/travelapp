import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/model/user_lower_level_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MyTeamState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildItem(int index) {
    UserLowerLevelModel model = state.goodsList[index];
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(viewService.context, RoutePath.USER_INFO_PAGE,
            arguments: {"data":model});
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 79,
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            ColorUtil.color("#ffffff"),
            ColorUtil.color("#ffffff"),
          ]),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              child: ClipRRect(
                child: CustomCachedImageWidget(
                    BaseTools.isEmpty(model.userimage)?"":model.userimage
                ),
              ),
            ),

            Container(
              width: 40,
              height: 40,
              child: ClipOval(
                child: CustomCachedImageWidget(
                  BaseTools.isEmpty(model.userimage)
                      ? model.userimage
                      : "http://ppic"
                      ".meituba"
                      ".com:84/uploads/allimg/2017/12/30/305_18552.jpg",
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12),
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      model.nickname,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: GlobalThemeStyles.instance.getMainTitleColor()),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      BaseTools.getVipLevel(model.userlevel),
                      style: TextStyle(
                          fontSize: 12,
                          color:
                          GlobalThemeStyles.instance.getExplainTitleColor()),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),

            Container(
              margin: EdgeInsets.only(right: 15),
              child: Text(
                DateUtil.formatDateMs(model.createtime,format: "yyyy"
                    "-MM-dd"),style: TextStyle(
                  fontSize: 12,color: ColorUtil.color("999999")
              ),
              ),
            )


          ],
        ),
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
          itemBuilder: (c, i) => _buildItem(i),
          itemCount: state.goodsList != null && state.goodsList.length > 0
              ? state.goodsList.length
              : 0),
      onRefresh: () async => await dispatch(MyTeamActionCreator.onRefresh()),
      onLoad: () async => await dispatch(MyTeamActionCreator.onLoadMore()),
    );
  }
  Widget _buildNoData(){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
            Navigator.pushNamed(viewService.context, RoutePath.MY_PROMOTION_PAGE);
      },
      child: Container(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 200),
                  child: Image.asset("assets/nodata.png"),
                ),

            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "暂无旅客，点击前去推广",
                style: TextStyle(
                  fontSize: 14,color: UnifiedThemeStyles.themeColor
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  return Scaffold(
    backgroundColor: ColorUtil.color("#F5F5F5"),
    body: SafeArea(
      top: false,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          CustomAppBarWidget("我的旅客", () {
            BaseTools.closePage(viewService.context);
          }),
          Expanded(
            flex: 1,
            child: state.goodsList!=null&&state.goodsList.length>0?MediaQuery.removePadding(
              context: viewService.context,
              child: _buildListView(),
              removeTop: true,
            ):_buildNoData(),
          )
        ],
      ),
    ),
  );
}
