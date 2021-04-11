import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/model/home_comment_model.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';
import 'package:travelapp/widgets/gradient_text_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildTopView() {
    return Container(
      width: GlobalThemeStyles.instance.widthFromPx(750),
      height: 248,
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Container(
            height: 248,
            width: GlobalThemeStyles.instance.widthFromPx(750),
            child: Image.asset(
              "assets/bh_home_topbg.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 89,
            child: Container(
              width: GlobalThemeStyles.instance.widthFromPx(750),
              height: 57,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Container(
                    width: 5.5,
                    margin: EdgeInsets.only(right: 6),
                    height: 5.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.5 / 2),
                      boxShadow: [
                        BoxShadow(
                            color: ColorUtil.color("#11000000"),
                            offset: Offset(0.0, 0.0),
                            blurRadius: 2.0,
                            spreadRadius: 2.0)
                      ],
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      "assets/bh_home_rili.png",
                    ),
                  ),
                  Container(
                    width: 5.5,
                    margin: EdgeInsets.only(left: 6),
                    height: 5.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.5 / 2),
                      boxShadow: [
                        BoxShadow(
                            color: ColorUtil.color("#11000000"),
                            offset: Offset(0.0, 0.0),
                            blurRadius: 2.0,
                            spreadRadius: 2.0)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 35,
            child: Container(
              width: GlobalThemeStyles.instance.widthFromPx(750),
              height: 38.5,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 14.5),
                    height: 38.5,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            state.locationModel!=null?state.locationModel
                                .city:"北京",
                            style: TextStyle(
                                fontSize: 14, color: ColorUtil.color("ffffff")),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.5, right: 10),
                          child: Image.asset(
                            "assets/bh_home_xiala.png",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(viewService.context, RoutePath.SEARCH_GOODS_PAGE);
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        height: 38.5,
                        margin: EdgeInsets.only(right: 12.5, left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(38.5 / 2),
                        ),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 15.5),
                              child: Image.asset("assets/bh_home_search.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15.5),
                              child: Text(
                                "搜索",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: ColorUtil.color("666666")),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15.5),
                              child: Image.asset("assets/bh_home_shanchu.png"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildCateView() {
    List<Widget> list = List();
    for (int i = 0; i < state.cateList.length; i++) {

      if(state
          .cateList[i].categoryid!="63f77a94-6493-4225-940a-e02092320cd7"||state
          .cateList[i].categoryid!="4d434e0c-3c32-41fa-9154-365a020febae"){
        list.add(GestureDetector(
          onTap: () {
            Navigator.pushNamed(viewService.context, RoutePath.CATE_GOOD_LIST_PAGE,
                arguments: {"title":state.cateList[i].categoryname,"id":state
                    .cateList[i].categoryid});
          },
          child: Container(
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Container(
                  child: CustomCachedImageWidget(
                    state.cateList[i].categoryimage,
                    width: 55,
                    height: 55,
                  ),
                ),
                Container(
                  child: Text(
                    state.cateList[i].categoryname,
                    style: TextStyle(
                        fontSize: 13, color: ColorUtil.color("#4A4A4A")),
                  ),
                )
              ],
            ),
          ),
        ));
      }
    }
    return list;
  }

  Widget _buildRecommendView(RecommendGoodsModel goodsModel) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(viewService.context, RoutePath
            .GOODS_DETAIL_PAGE,arguments: {"goodsid":goodsModel.goodsid});
      },
      child: Container(
        height: 78,
        margin: EdgeInsets.only(top: 4),
        child: Stack(
          children: <Widget>[
            Container(
              width: UnifiedThemeStyles.widthFromPx(750)/2,
              child: CustomCachedImageWidget(
                goodsModel.pictureList[0].pictureurl,

              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                margin: EdgeInsets.only(top: 15, left: 8, right: 8),
                child: Text(
                  goodsModel.goodsname,
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.6),
                ),
                padding: EdgeInsets.only(left: 2.5, right: 2.5),
                margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: BaseTools.isEmpty(goodsModel.price)?"":goodsModel.price.toString(),
                        style: TextStyle(
                          fontSize: 9.6,
                          color: ColorUtil.color("#FF9B85"),
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                    TextSpan(
                        text: "起",
                        style: TextStyle(
                          fontSize: 7.2,
                          color: ColorUtil.color("#FF9B85"),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.pushNamed(viewService.context,
                            //     RoutePath
                            //         .USER_AGREEMENT_PAGE);
                          }),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGridViewItem(int index) {
    if(index<state.commentList.length){
      HomeCommentModel commentModel=state.commentList[index];
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(viewService.context, RoutePath
              .GOODS_DETAIL_PAGE,arguments: {"goodsid":commentModel.goodsid});
        },
        child: Container(
          margin: EdgeInsets.only(top: 10),
          height: 232,
          child: Stack(
            children: <Widget>[
              Container(
                height: 232,
                decoration: BoxDecoration(
                  color: ColorUtil.color("99ffffff"),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: CustomCachedImageWidget(
                    commentModel.pictureList!=null&&commentModel
                        .pictureList.length>0?commentModel.pictureList[0]
                        .pictureurl:"",
                ),
              ),
              Positioned(
                bottom: 5,
                left: 5,
                right: 5,

                child: Container(
                  decoration: BoxDecoration(
                    color: ColorUtil.color("99ffffff"),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  padding: EdgeInsets.all(4),
                  child: Text(
                    commentModel.commenttitle,maxLines: 2, overflow: TextOverflow.ellipsis,style:
                  TextStyle
                    (fontSize: 12,
                    color: Colors.black,fontWeight: FontWeight.bold,),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }else{
      return Container();
    }


  }

  Widget _buildGoodsGridViewItem(int index) {
    if(index<state.recommendList.length){
      RecommendGoodsModel commentModel=state.recommendList[index];
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(viewService.context, RoutePath
              .GOODS_DETAIL_PAGE,arguments: {"goodsid":commentModel.goodsid});
        },
        child: Container(
          margin: EdgeInsets.only(top: 10),
          height: 232,
          child: Stack(
            children: <Widget>[
              Container(
                height: 232,
                decoration: BoxDecoration(
                  color: ColorUtil.color("99ffffff"),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: CustomCachedImageWidget(
                  commentModel.pictureList[0].pictureurl,
                ),
              ),
              Positioned(
                bottom: 5,
                left: 5,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorUtil.color("99ffffff"),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  padding: EdgeInsets.all(4),
                  child: Text(
                    commentModel.goodsname,maxLines: 2, overflow: TextOverflow
                      .ellipsis,style:
                  TextStyle
                    (fontSize: 12,
                    color: Colors.black,fontWeight: FontWeight.bold,),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }else{
      return Container();
    }


  }

  Widget _buildTuiJian(){
    if(state.showItem==1){
      return Container(
        margin: EdgeInsets.only(left: 13.5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bh_home_cate.png"),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Text(
          "热门推荐",
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      );
    }else{
      return Container(
        margin: EdgeInsets.only(left: 13.5),
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Text(
          "热门推荐",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,),
        ),
      );
    }
  }

  Widget _buildXiaoXi(){
    if(state.showItem==0){
      return Container(
        margin: EdgeInsets.only(left: 13.5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bh_home_cate.png"),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Text(
          "公布消息",
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      );
    }else{
      return Container(
        margin: EdgeInsets.only(left: 13.5),
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Text(
          "公布消息",
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,),
        ),
      );
    }
  }

  Widget _buildItemView(int index) {
    if (index == 0) {
      return Container(
        width: GlobalThemeStyles.instance.widthFromPx(750),
        margin: EdgeInsets.only(top: 125),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, top: 12, right: 15),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(onTap: (){
                            Navigator.pushNamed(viewService.context, RoutePath.CATE_GOOD_LIST_PAGE,
                                arguments: {"title":"旅游线路","id":"63f77a94-6493-4225-940a-e02092320cd7"});
                          },
                          child: Container(
                            child: GradientText("旅游线路",
                                gradient: LinearGradient(colors: [
                                  ColorUtil.color("#5D9EFF"),
                                  ColorUtil.color("#4EFCFF"),
                                ]),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff000000))),
                          ),),
                          state.recommendOne != null
                              ? _buildRecommendView(state.recommendOne)
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 8.5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(viewService.context, RoutePath.CATE_GOOD_LIST_PAGE,
                                  arguments: {"title":"农特电商","id":"4d434e0c-3c32-41fa-9154-365a020febae"});
                            },
                            child: Container(
                              child: GradientText("农特电商",
                                  gradient: LinearGradient(colors: [
                                    ColorUtil.color("#FFB94E"),
                                    ColorUtil.color("#FF5D5D"),
                                  ]),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff000000))),
                            ),
                          ),
                          state.recommendTwo != null
                              ? _buildRecommendView(state.recommendTwo)
                              : Container()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 10,
              margin: EdgeInsets.only(top: 15),
              color: ColorUtil.color("#F8F8F8"),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.only(bottom: 11),
              child: Wrap(
                spacing: GlobalThemeStyles.instance.widthFromPx(76),
                runSpacing: 8,
                children: _buildCateView(),
              ),
            )
          ],
        ),
      );
    } else if (index == 1) {
      return Container(
        height: 46,
        // margin: EdgeInsets.only(top: 11),
        color: ColorUtil.color("#F8F8F8"),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[



            GestureDetector(
              onTap: (){
                dispatch(HomeActionCreator.updateShowitem(0));
              },
              child: _buildXiaoXi(),
            ),
            GestureDetector(
              onTap: (){

                dispatch(HomeActionCreator.updateShowitem(1));
              },
              child: _buildTuiJian(),
            )
          ],
        ),
      );
    } else {

      if(state.showItem==0){
        return Container(
          color: ColorUtil.color("#F8F8F8"),
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: _buildGridViewItem((index-2)*2),
              ),
              Container(
                width:10 ,
              ),
              Expanded(
                flex: 1,
                child: _buildGridViewItem((index-2)*2+1),
              )
            ],
          ),
        );
      }else{
        return Container(
          color: ColorUtil.color("#F8F8F8"),
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: _buildGoodsGridViewItem((index-2)*2),
              ),
              Container(
                width:10 ,
              ),
              Expanded(
                flex: 1,
                child: _buildGoodsGridViewItem((index-2)*2+1),
              )
            ],
          ),
        );
      }

    }
  }

  int _getItemCount() {

    if(state.showItem==0){
      if (state.cateList != null &&
          state.cateList.length > 0 &&
          state.commentList != null &&
          state.commentList.length > 0) {
        // state.commentList.length
        int count = (state.commentList.length / 2).round();
        // if (state.commentList.length % 2 == 0) {
        //   return 2 + count;
        // } else {
        //   return 3 + count;
        // }
        return 2+count;
      } else {
        return 2;
      }
    }else{
      if (state.cateList != null &&
          state.cateList.length > 0 &&
          state.recommendList != null &&
          state.recommendList.length > 0) {
        // state.commentList.length
        int count = (state.recommendList.length / 2).round();
        println(count.toString()+"--------------BBBBBBBBBBB----------");
        // if (state.recommendList.length % 2 == 0) {
        //   return 2 + count;
        // } else {
        //   return 3 + count;
        // }
        return 2+count;
      } else {
        return 2;
      }
    }

  }

  Widget _buildListView() {
    return EasyRefresh(
      header: MaterialHeader(),
      footer: BezierBounceFooter(
          backgroundColor: GlobalThemeStyles.instance.getThemeColor()),
      child: ListView.builder(
          padding: EdgeInsets.only(top: 0),
          itemBuilder: (c, i) => _buildItemView(i),
          itemCount: _getItemCount()),
      onRefresh: () async {
        if(state.showItem==0){
          await dispatch(HomeActionCreator.onRefresh());
        }else{
          await dispatch(HomeActionCreator.onRefreshGoods());
        }

      },
      onLoad: () async {
        if(state.showItem==0){
          await dispatch(HomeActionCreator.onLoadMore());
        }else{
          await dispatch(HomeActionCreator.onLoadMoreGoods());
        }

      },
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
            _buildTopView(),
            Container(
              margin: EdgeInsets.only(top: 75),
              width: GlobalThemeStyles.instance.widthFromPx(750),
              height: GlobalThemeStyles.instance.heightFromPx(1334) - 75,
              child: _buildListView(),
            )
          ],
        ),
      ),
    ),
  );
}

// const url =
//     'http://www.pptbz.com/pptpic/UploadFiles_6909/201203/2012031220134655.jpg';
//
// class TestPage extends StatefulWidget {
//   @override
//   _TestPageState createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage> {
//   var tabTitle = [
//     '页面1',
//     '页面2',
//     '页面3',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return new DefaultTabController(
//         length: tabTitle.length,
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: new NestedScrollView(
//             headerSliverBuilder: (context, bool) {
//               return [
//                 SliverAppBar(
//                   expandedHeight: 300.0,
//                   floating: true,
//                   pinned: false,
//                   elevation: 0,
//                   backgroundColor: Colors.transparent,
//                   flexibleSpace: Container(
//                     color: Colors.transparent,
//                   ),
//                 ),
//                 new SliverPersistentHeader(
//                   delegate: new SliverTabBarDelegate(
//                     new TabBar(
//                       tabs: tabTitle
//                           .map((f) => Tab(
//                                 text: f,
//                               ))
//                           .toList(),
//                       indicatorColor: Colors.red,
//                       unselectedLabelColor: Colors.black,
//                       labelColor: Colors.red,
//                     ),
//                     color: Colors.white,
//                   ),
//                   pinned: true,
//                 ),
//               ];
//             },
//             body: Container(
//               color: Colors.white,
//               child: TabBarView(
//                 children: tabTitle
//                     .map((s) => ListView.builder(
//                           itemBuilder: (context, int) => Text("123"),
//                           itemCount: 50,
//                         ))
//                     .toList(),
//               ),
//             ),
//           ),
//         ));
//   }
// }
//
// class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar widget;
//   final Color color;
//
//   const SliverTabBarDelegate(this.widget, {this.color})
//       : assert(widget != null);
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return new Container(
//       child: widget,
//       color: color,
//     );
//   }
//
//   @override
//   bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
//     return false;
//   }
//
//   @override
//   double get maxExtent => widget.preferredSize.height;
//
//   @override
//   double get minExtent => widget.preferredSize.height;
// }
//
// class ActPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return new ActState();
//   }
// }
//
// class ActState extends State<ActPage> with SingleTickerProviderStateMixin {
//   List<Choice> tabs = [];
//   TabController mTabController;
//   int mCurrentPosition = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       backgroundColor: Colors.white,
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return [
//             new SliverAppBar(
//               pinned: true,
//               elevation: 0,
//               expandedHeight: 500.0,
//               backgroundColor: Colors.white,
//               bottom: PreferredSize(
//                   child: new Container(
//                     alignment: Alignment.centerLeft,
//                     color: Colors.white,
//                     child: new TabBar(
//                       indicatorSize: TabBarIndicatorSize.label,
//                       indicatorColor: Colors.transparent,
//                       labelColor: Colors.transparent,
//                       unselectedLabelColor: Colors.black45,
//                       tabs: tabs.map((Choice choice) {
//                         return Container(
//                           height: 50,
//                           width: 60,
//                           child: Text(
//                             choice.title,
//                             style: TextStyle(
//                                 fontSize: 14, color: ColorUtil.color("333333")),
//                           ),
//                         );
//                       }).toList(),
//                       controller: mTabController,
//                     ),
//                   ),
//                   preferredSize: new Size(double.infinity, 50.0)),
//               flexibleSpace: new Container(
//                 child: new Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     new Expanded(
//                       child: new Container(
//                         child: Image.asset(
//                           "assets/bh_home_topbg.png",
//                           fit: BoxFit.fitWidth,
//                         ),
//                         width: double.infinity,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ];
//         },
//         body: new TabBarView(
//           children: tabs.map((Choice choice) {
//             return new Padding(
//                 padding: const EdgeInsets.all(0.0),
//                 child: choice.position == 0
//                     ? new Container(
//                         child: new ListView(
//                         children: <Widget>[
//                           new ListTile(
//                             leading: new Icon(Icons.map),
//                             title: new Text('Map'),
//                           ),
//                           new ListTile(
//                             leading: new Icon(Icons.photo),
//                             title: new Text('Album'),
//                           ),
//                           new ListTile(
//                             leading: new Icon(Icons.phone),
//                             title: new Text('Phone'),
//                           ),
//                           new ListTile(
//                             leading: new Icon(Icons.map),
//                             title: new Text('Map'),
//                           ),
//                           new ListTile(
//                             leading: new Icon(Icons.photo),
//                             title: new Text('Album'),
//                           ),
//                           new ListTile(
//                             leading: new Icon(Icons.phone),
//                             title: new Text('Phone'),
//                           ),
//                         ],
//                       ))
//                     : new Container(
//                         child: new Text("ahhhhhhhhhhhhh"),
//                       ));
//           }).toList(),
//           controller: mTabController,
//         ),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     tabs.add(Choice(title: '热门', icon: Icons.hot_tub, position: 0));
//     tabs.add(Choice(title: '最新', icon: Icons.fiber_new, position: 1));
//     mTabController = new TabController(vsync: this, length: tabs.length);
//     //判断TabBar是否切换
//     mTabController.addListener(() {
//       if (mTabController.indexIsChanging) {
//         setState(() {
//           mCurrentPosition = mTabController.index;
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     mTabController.dispose();
//   }
// }
//
// class Choice {
//   const Choice({this.title, this.icon, this.position});
//
//   final String title;
//   final int position;
//   final IconData icon;
// }
