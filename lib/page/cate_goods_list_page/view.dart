import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/model/recommend_goods_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(CateGoodListState state, Dispatch dispatch, ViewService viewService) {
  int _getItemCount() {
    if (state.recommendList != null &&
        state.recommendList.length > 0) {
      return (state.recommendList.length / 2).round();
    } else {
      return 0;
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
          child:Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Container(
                height: 232,
                child:  Stack(
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
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: commentModel.price.toString(),
                              style: TextStyle(
                                fontSize: 18.6,
                                color: ColorUtil.color("#FF9B85"),
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {}),
                          TextSpan(
                              text: "起",
                              style: TextStyle(
                                fontSize: 10.2,
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
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),

                    Container(
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: commentModel.salesvolume.toString(),
                              style: TextStyle(
                                fontSize: 13.6,
                                color: ColorUtil.color("#4A90E2"),
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {}),
                          TextSpan(
                              text: "人购买",
                              style: TextStyle(
                                fontSize: 10.2,
                                color: ColorUtil.color("#4A90E2"),
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
                  ],
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
  Widget _buildItemView(int index){
    return Container(
      color: ColorUtil.color("#F8F8F8"),
      padding: EdgeInsets.only(left: 15,right: 15),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _buildGoodsGridViewItem((index)*2),
          ),
          Container(
            width:10 ,
          ),
          Expanded(
            flex: 1,
            child: _buildGoodsGridViewItem((index)*2+1),
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
          itemCount: _getItemCount()),
      onRefresh: () async {
        await dispatch(CateGoodListActionCreator.onRefresh());
      },
      onLoad: () async {
        await dispatch(CateGoodListActionCreator.onLoadMore());

      },
    );
  }
  return Scaffold(
    backgroundColor:  ColorUtil.color("#F8F8F8"),
    body: SafeArea(
      top: false,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          CustomAppBarWidget(
            state.categorytitle,(){
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
  );
}
