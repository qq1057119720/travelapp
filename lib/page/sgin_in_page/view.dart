import 'package:common_utils/common_utils.dart';
import 'package:date_format/date_format.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/model/sgin_in_task_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/utils/toast_tools.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(SginInState state, Dispatch dispatch, ViewService viewService) {



Widget _buildNoSgin(String day,String price){
  return GestureDetector(
    onTap: (){
      // if(DateUtil.getWeekday(new DateTime.now(),short: true,languageCode:
      // "zh")==week){
      //   dispatch(SginInActionCreator.onSginIn());
      // }else{
      //   ToastTools.showToast("只能签到当天");
      // }
      dispatch(SginInActionCreator.onSginIn());
    },
    child: Container(
      width: 72.5,
      height: 83,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bh_sgin_no_hong.png"),
          fit: BoxFit.cover,
        ),
      ),
      child:Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            child: Text(
              "${day}",style: TextStyle(
                fontSize: 14.5,color: Colors.white,fontWeight: FontWeight.bold
            ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Image.asset("assets/bh_sgin_hong.png"),
          ),
          Container(
            child: Text(
              "${price}元",style: TextStyle(
                fontSize: 14.5,color: ColorUtil.color("#FF3B02"),fontWeight:
            FontWeight.bold
            ),
            ),
          ),
        ],
      ) ,
    ),
  );

}


Widget _buildYesSgin(String day){
  return Container(
    width: 72.5,
    height: 83,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/bh_sgin_yes_hong.png"),
        fit: BoxFit.cover,
      ),
    ),
    child:Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(
          child: Text(
            "${day}",style: TextStyle(
              fontSize: 14.5,color: Colors.white,fontWeight: FontWeight.bold
          ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          child: Text(
            "已领取",style: TextStyle(
              fontSize: 18.5,color: ColorUtil.color("#ffffff"),fontWeight:
          FontWeight.bold
          ),
          ),
        ),
      ],
    ) ,
  );

}



Widget _buildSginInItemView(String week) {

 bool isSgin=false;
  if(state.sginList!=null&&state.sginList.length>0){
    for(int i=0;i<state.sginList.length;i++){
      String sginWeekDay=DateUtil.getWeekday(DateUtil.getDateTimeByMs(state
          .sginList[i].createtime),short: true,
          languageCode:
          "zh");
      if(sginWeekDay==week){
        isSgin=true;
        break;
      }
    }
  }

  if(isSgin){
    //已签到
    return _buildYesSgin(week);
  }else{
    return GestureDetector(
      onTap: (){
        dispatch(SginInActionCreator.onSginIn());
      },
      child: _buildNoSgin(week, 0.2.toString()),
    );
  }


}

Widget _buildItemView(int index){

  if(index==0){
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,top: 40),
      decoration: BoxDecoration(
          color: ColorUtil.color("#33FFFEF8"),
          borderRadius: BorderRadius.all(Radius.circular
            (10)),
          border: Border.all(color: ColorUtil.color("#262626"),
              width: 0.5)
      ),

      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            width: 244,
            height: 49,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bh_sgin_leiji.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 155,
                ),
                Container(
                  child: Text(
                    state.sginList!=null&&state.sginList.length>0?state
                        .sginList[0].continuous:"0",
                    style: TextStyle(
                        fontSize: 24.3,color: Colors.black
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 27.5),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),

                _buildSginInItemView("周一"),
                Container(
                  width: 9,
                ),
                _buildSginInItemView("周二"),
                Container(
                  width: 9,
                ),
                _buildSginInItemView("周三"),
                Container(
                  width: 9,
                ),
                _buildSginInItemView("周四"),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 27.5),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                _buildSginInItemView("周五"),
                Container(
                  width: 9,
                ),
                _buildSginInItemView("周六"),

                Container(
                  width: 9,
                ),
                _buildSginInItemView("周日"),

                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
          ),
          Container(
            height:25.5 ,
          )
        ],
      ),
    );
  }else{

    SginInTaskModel sginInTaskModel=state.tasklist[index-1];



    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,top: 40),
      decoration: BoxDecoration(
          color: ColorUtil.color("#33FFFEF8"),
          borderRadius: BorderRadius.all(Radius.circular
            (10)),
          border: Border.all(color: ColorUtil.color("#262626"),
              width: 0.5)
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(left: 25.5),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 16.5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    sginInTaskModel.taskname,
                    style: TextStyle(
                      fontSize: 15,color: Colors.black
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 16.5),
                  child: Text(
                    sginInTaskModel.taskcontent,
                    style: TextStyle(
                        fontSize: 14,color: ColorUtil.color("#505050")
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
}

Widget _buildListView() {
  return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      itemBuilder: (c, i) => _buildItemView(i),
      itemCount:state.tasklist!=null&&state.tasklist.length>0?state
          .tasklist.length+1:1);
}


return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/bh_sgin_bg.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        top: false,
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Container(
              height: 70,
              width: UnifiedThemeStyles.widthFromPx(750),
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    width: 300,
                    margin: EdgeInsets.only(top: 30),
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "签到",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: UnifiedThemeStyles.BLACK,fontWeight:
                      FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: GestureDetector(
                      onTap: (){
                        BaseTools.closePage(viewService.context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(top: 30),
                        child: Image.asset(
                          "assets/bh_topback_h.png",color: ColorUtil.color("000000"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        width: 110,
                        height: 35,
                        margin: EdgeInsets.only(top: 32.5),
                        decoration: BoxDecoration(
                          color: ColorUtil.color("#F5ECD9"),
                          borderRadius: BorderRadius.only(topLeft: Radius
                              .circular(35/2),bottomLeft: Radius.circular
                            (35/2)),
                        ),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Text(
                                "积分说明",style: TextStyle(fontSize: 15,color: 
                              ColorUtil.color("#2F2F2F")),
                              ),
                            ),
                            Container(
                              child: Image.asset("assets/bh_sgin_right.png"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: _buildListView(),
            )
          ],
        ),
      ),
    ),
  );
}
