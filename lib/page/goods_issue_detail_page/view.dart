import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/model/issue_reply_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    GoodsIssueDetailState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildItemView(int index) {
    IssueReplyModel commentlist = state.issuelist[index];
    return Container(
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 11.5,left: 15.5),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 39,
                  height: 39,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(39 / 2),
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
                          commentlist.nickname,
                          style: TextStyle(
                              fontSize: 13, color: ColorUtil.color("#2C2C2C")),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          DateUtil.formatDateMs(commentlist.addtime,
                              format: "yyyy-MM-dd"),
                          style: TextStyle(
                              fontSize: 11, color: ColorUtil.color("#A0A0A0")),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 14,right: 15.5,left: 15.5),
            child: Text(
              commentlist.replycontent,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),

         GestureDetector(
           onTap: (){

           },
           child:  Container(
             margin: EdgeInsets.only(left: 25.5,top: 27),
             child: Flex(
               direction: Axis.horizontal,
               children: <Widget>[
                 Container(
                   child: Image.asset("assets/bh_issue_dianzan.png"),
                 ),
                 Container(
                   margin: EdgeInsets.only(left: 3),
                   child: Text(
                     commentlist.stick!=null?commentlist.stick.toString()
                         +"点赞":"0点赞",style: TextStyle(
                       fontSize: 11,color: ColorUtil.color("#AEAEAE")
                   ),
                   ),
                 )
               ],
             ),
           ),
         ),
          Container(
            margin: EdgeInsets.only(top: 14.5),
            height: 10,
            color: ColorUtil.color("#F8F8F8"),
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
          itemCount: state.issuelist != null && state.issuelist.length > 0
              ? state.issuelist.length
              : 0),
      onRefresh: () async {
        await dispatch(GoodsIssueDetailActionCreator.onRefresh());
      },
      onLoad: () async {
        await dispatch(GoodsIssueDetailActionCreator.onLoadMore());
      },
    );
  }

  return Scaffold(
    body: SafeArea(
      top: false,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          CustomAppBarWidget(state.issuecontentlist.nickname + "的提问", () {
            BaseTools.closePage(viewService.context);
          }),
          Container(
            height: 65,
            width: UnifiedThemeStyles.heightFromPx(750),

            margin: EdgeInsets.only(top: 70),
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
                      state.issuecontentlist.contentname,
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

          Container(
            width: UnifiedThemeStyles.widthFromPx(750),
            height: UnifiedThemeStyles.heightFromPx(1334) - 70-65,
            margin: EdgeInsets.only(top: 135),
            color: Colors.white,
            child: _buildListView(),
          ),
          Positioned(
            bottom: 24,
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(viewService.context, RoutePath.GOODS_ADD_REPLY_PAGE,arguments: {"data":state.issuecontentlist});
              },
              child: Container(
                width: 207,
                height: 44.5,
                decoration: BoxDecoration(
                  color: ColorUtil.color("#5992FE"),
                  borderRadius: BorderRadius.all(Radius.circular(44.5/2)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "我要回答",style: TextStyle(
                    fontSize: 17.5,color: ColorUtil.color("#EEE7D0"),fontWeight:
                FontWeight.bold
                ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
