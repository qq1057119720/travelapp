import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/model/goods_detail_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_right_widget.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GoodsIssueListState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildItemView(int index){
    Issuecontentlist issuecontentlist=state.issuelist[index];
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(viewService.context, RoutePath
            .GOODS_ISSUE_DETAIL_PAGE,arguments: {"data":issuecontentlist});
      },
      child: Container(
        height: 65,
        margin: EdgeInsets.only(top: 5),
        color: Colors.white,
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 19),
              child: Image.asset("assets/bh_issue_wen.png"),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 8.5,right: 19),
                child: Text(
                  issuecontentlist.contentname,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold
                  ),
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
          itemBuilder: (c, i) => _buildItemView(i),
          itemCount:state.issuelist!=null&&state.issuelist.length>0?state
              .issuelist.length:0),
      onRefresh: () async {
        await dispatch(GoodsIssueListActionCreator.onRefresh());
      },
      onLoad: () async {
        await dispatch(GoodsIssueListActionCreator.onLoadMore());

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
            CustomAppBarRightWidget(
                "用户提问",(){
              BaseTools.closePage(viewService.context);
            },rightWidget:  GestureDetector(
              onTap: (){
                // dispatch(AddReceiverAddressActionCreator.toAddAddress());
                Navigator.pushNamed(viewService.context, RoutePath
                    .GOODS_ADDISSUE_PAGE,arguments: {"id":state.goodsid});
              },
              child: Container(
                margin: EdgeInsets.only(top: 30),
                width: 60,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  "提问",style: TextStyle(fontSize: 14,color: GlobalThemeStyles
                    .instance.getThemeColor()),
                ),
              ),
            ),
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
