import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/model/user_integral_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(UserIntegralListState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildItem(int index){
    UserIntegralModel walletLogModel=state.walletlist[index];
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.only(bottom: 15),
      color: Colors.white,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 13,left: 15),
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    walletLogModel.integralremark,
                    style: TextStyle(
                        fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    DateUtil.formatDateMs(walletLogModel.createtime,format: "yyyy.MM.dd"),
                    style: TextStyle(
                      fontSize: 14,color: ColorUtil.color("#A7A7A7"),
                    ),
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
              walletLogModel.integralcount.toString(),
              style: TextStyle(
                  fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemBuilder: (c, i) => _buildItem(i),
        itemCount: state.walletlist!=null&&state.walletlist.length>0?state
            .walletlist.length:0);
  }


  return Scaffold(
    backgroundColor: ColorUtil.color("#F8F8F8"),
    body: SafeArea(
      top: false,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          CustomAppBarWidget("积分明细",(){
            BaseTools.closePage(viewService.context);
          }),

          Expanded(
            flex: 1,
            child: _buildListView(),
          )
        ],
      ),
    ),
  );
}
