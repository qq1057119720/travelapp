import 'package:date_format/date_format.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluwx/fluwx.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/cache/userinfo_cache_manager.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_browse_imges_widget.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';
import 'package:travelapp/widgets/custom_share_view.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    GoodsDetailState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildBanner() {
    return Container(
      decoration: BoxDecoration(
        color: GlobalThemeStyles.WHITE,
      ),
      height: 215,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if(state.goodsDetailModel.pictureList!=null&&state
                        .goodsDetailModel.pictureList.length>0){
                      List<String> urls = new List();
                      urls.add(
                          state.goodsDetailModel.pictureList[index].pictureurl);
                      Navigator.of(viewService.context).push(PageRouteBuilder(
                          pageBuilder: (c, a, s) => CustomBrowseImagesWidget(
                            urls,
                            initialPage: 0,
                          )));
                    }

                  },
                  child: Container(
                    height: 215,
                    width: GlobalThemeStyles.instance.widthFromPx(750),
                    child: CustomCachedImageWidget(
                      state.goodsDetailModel.pictureList!=null&&state
                          .goodsDetailModel.pictureList.length>0?state
                          .goodsDetailModel.pictureList[index].pictureurl:"",
                    ),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: state.goodsDetailModel.pictureList!=null&&state
            .goodsDetailModel.pictureList.length>0?state
            .goodsDetailModel
        .pictureList.length:1,
        autoplay: true,
        pagination: new SwiperPagination(
            builder: new FractionPaginationBuilder(
                color: GlobalThemeStyles.instance.getThemeColor(),
                activeColor: GlobalThemeStyles.instance.getThemeColor(),
                fontSize: 12,
                activeFontSize: 12),
            alignment: Alignment.bottomRight),
      ),
    );
  }

  Widget _buildCommentView() {
    String image1 = "";
    String image2 = "";
    String image3 = "";

    if (state.goodsDetailModel.commentlist.length < 3) {
      if (state.goodsDetailModel.commentlist[0].pictureList != null) {
        image1 =
            state.goodsDetailModel.commentlist[0].pictureList[0].pictureurl;
      }
      if (state.goodsDetailModel.commentlist[0].pictureList != null) {
        image2 =
            state.goodsDetailModel.commentlist[0].pictureList[0].pictureurl;
      }
      if (state.goodsDetailModel.commentlist[0].pictureList != null) {
        image3 =
            state.goodsDetailModel.commentlist[0].pictureList[0].pictureurl;
      }
    } else {
      if (state.goodsDetailModel.commentlist[0].pictureList != null) {
        image1 =
            state.goodsDetailModel.commentlist[0].pictureList[0].pictureurl;
      }
      if (state.goodsDetailModel.commentlist[1].pictureList != null) {
        image2 =
            state.goodsDetailModel.commentlist[1].pictureList[0].pictureurl;
      }
      if (state.goodsDetailModel.commentlist[2].pictureList != null) {
        image3 =
            state.goodsDetailModel.commentlist[2].pictureList[0].pictureurl;
      }
    }
    return Container(
      margin: EdgeInsets.only(left: 13.5, right: 9.5, top: 8.5),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 208.5,
            height: 152,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CustomCachedImageWidget(image1),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 9.5),
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Container(
                    height: 73,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CustomCachedImageWidget(image2),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 6),
                    height: 73,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CustomCachedImageWidget(image3),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildIssueView() {
    List<Widget> list = new List();
    list.add(Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 11, top: 9.5),
      child: Text(
        "问大家（${state.goodsDetailModel.issuecontentcount}）",
        style: TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ));
    if(state.goodsDetailModel.issuecontentlist!=null&&state.goodsDetailModel
        .issuecontentlist.length>0){
      for (int i = 0; i < state.goodsDetailModel.issuecontentlist.length; i++) {
        list.add(Container(
          margin: EdgeInsets.only(left: 11, right: 11),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 20,
                  child: Text(
                    state.goodsDetailModel.issuecontentlist[i].contentname,
                    maxLines: 1,
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "${state.goodsDetailModel.issuecontentlist[i].replycount}个回答",
                  style:
                  TextStyle(fontSize: 11, color: ColorUtil.color("#848484")),
                ),
              )
            ],
          ),
        ));
      }

    }

    return list;
  }

  Widget _buildItemView(int index) {
    if (index == 0) {
      return Container(
        width: GlobalThemeStyles.instance.widthFromPx(750),
        margin: EdgeInsets.only(top: 129),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, top: 11),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "￥",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorUtil.color("#FF9B85"),
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                      TextSpan(
                          text: state.goodsDetailModel.price.toString(),
                          style: TextStyle(
                              fontSize: 23,
                              color: ColorUtil.color("#FF4F4F"),
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      state.goodsDetailModel.salesvolume.toString() + "人购买",
                      style: TextStyle(
                          fontSize: 12, color: ColorUtil.color("#848484")),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Text(
                      BaseTools.isEmpty(state.goodsDetailModel.goodsstock)
                          ?"":"库存:"+state.goodsDetailModel.goodsstock
                          .toString(),
                      style: TextStyle(
                          fontSize: 12, color: ColorUtil.color("#848484")),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 15, right: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                state.goodsDetailModel.goodsname,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            state.showAll == 0
                ? GestureDetector(
                    onTap: () {
                      dispatch(GoodsDetailActionCreator.updateShowAll(1));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(bottom: 15),
                      color: Colors.transparent,
                      child: Text(
                        state.goodsDetailModel.goodsmessage,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14, color: ColorUtil.color("#4E4E4E")),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      dispatch(GoodsDetailActionCreator.updateShowAll(0));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(bottom: 15),
                      color: Colors.transparent,
                      child: Text(
                        state.goodsDetailModel.goodsmessage,
                        style: TextStyle(
                            fontSize: 14, color: ColorUtil.color("#4E4E4E")),
                      ),
                    ),
                  ),
            Container(
              height: 10,
              color: ColorUtil.color("#F8F8F8"),
            )
          ],
        ),
      );
    } else if (index == 1) {
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(viewService.context, RoutePath
              .GOODS_COMMENT_LIST_PAGE,arguments: {"id":state.goodsid});
        },
        child: Container(
          width: GlobalThemeStyles.instance.widthFromPx(750),
          color: ColorUtil.color("#F8F8F8"),
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 11, top: 9.5),
                  child: Text(
                    "用户相册与点评",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                state.goodsDetailModel.commentlist != null &&
                    state.goodsDetailModel.commentlist.length > 0
                    ? _buildCommentView()
                    : Container()
              ],
            ),
          ),
        ),
      );
    } else if (index == 2) {
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(viewService.context, RoutePath
              .GOODS_ISSUE_LIST_PAGE,arguments: {"id":state.goodsid});
        },
        child: Container(
          width: GlobalThemeStyles.instance.widthFromPx(750),
          color: ColorUtil.color("#F8F8F8"),
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Flex(
              direction: Axis.vertical,
              children: _buildIssueView(),
            ),
          ),
        ),
      );
    }else if(index==3){
      if(!BaseTools.isEmpty(state.goodsDetailModel.goodshtml)){
        return Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          child: Html(
            data: state.goodsDetailModel.goodshtml,
          ),
        );
      }else{
        return Container();
      }

    }
    return Container();
  }

  Widget _buildListView() {
    if (state.goodsDetailModel != null) {
      return Container(
        child: ListView.builder(
            padding: EdgeInsets.only(top: 0),
            itemBuilder: (c, i) => _buildItemView(i),
            itemCount: 4),
      );
    } else {
      return Container();
    }
  }

  Widget _buildTopView() {
    return Container(
      height: 70,
      width: UnifiedThemeStyles.widthFromPx(750),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          ColorUtil.color("#00ffffff"),
          ColorUtil.color("#00ffffff"),
        ]),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: 300,
            margin: EdgeInsets.only(top: 30),
            height: 40,
            alignment: Alignment.center,
            child: Text(
              state.goodsDetailModel.goodsname,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: UnifiedThemeStyles.WHITE, fontSize: 18),
            ),
          ),
          Positioned(
            left: 0,
            child: GestureDetector(
              onTap: () {
                BaseTools.closePage(viewService.context);
              },
              child: Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 30),
                child: Image.asset(
                  "assets/bh_goods_back.png",
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {
                CustomShareView.showShareView(viewService
                    .context,(int value){
                  // dispatch(MyNewTimetableActionCreator.onShareImage(value));
                  if(value==0||value==1){
                    shareToWeChat(WeChatShareWebPageModel("https://www.pgyer.com/dD1j",
                        title: "掌游",description: "我的推广码:"+UserinfoCacheManager
                            .instance.getUserInfo().invitationcode,
                        scene:value==0?WeChatScene.SESSION:WeChatScene.TIMELINE));

                  }
                });
              },
              child: Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 30),
                child: Image.asset(
                  "assets/bh_goods_share.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  return Scaffold(
    body: SafeArea(
      top: false,
      child: Container(
        width: GlobalThemeStyles.instance.widthFromPx(750),
        height: GlobalThemeStyles.instance.heightFromPx(1334),
        child: Stack(
          children: <Widget>[
            // _buildTopView(),
            state.goodsDetailModel != null ? _buildBanner() : Container(),
            state.goodsDetailModel != null ? _buildTopView() : Container(),
            Container(
              margin: EdgeInsets.only(top: 70),
              width: GlobalThemeStyles.instance.widthFromPx(750),
              height: GlobalThemeStyles.instance.heightFromPx(1334) - 70 - 75,
              child: _buildListView(),
            ),

            Positioned(
              bottom: 0,
              child: Container(
                height: 75,
                width: UnifiedThemeStyles.widthFromPx(750),
                child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        println("isshowhsoshsoihs");
                        dispatch(GoodsDetailActionCreator.toChat());
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        margin: EdgeInsets.only(left: 36.5),
                        color: Colors.transparent,
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Image.asset("assets/bh_goods_kefu.png"),
                            ),
                            Container(
                              child: Text(
                                "客服",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: ColorUtil.color("#7D7D7D")),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: 44),
                        color: Colors.transparent,
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 32.5,
                              height: 32.5,
                              child:
                                  Image.asset("assets/bh_goods_shoucang.png"),
                            ),
                            Container(
                              child: Text(
                                "收藏",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: ColorUtil.color("#7D7D7D")),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(viewService.context, RoutePath
                            .GOODS_AFFIRM_PAGE,arguments: {"goods":state
                            .goodsDetailModel});
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 16.5),
                        width: 145,
                        height: 44.5,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ColorUtil.color("#FFB94E"),
                                ColorUtil.color("#FF5D5D"),
                              ]),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "立即预订",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
