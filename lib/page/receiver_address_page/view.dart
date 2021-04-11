import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/model/receiver_address_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_right_widget.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ReceiverAddressState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildItem(int index){
    ReceiverAddressModel model=state.addressList[index];
    return GestureDetector(
      onTap: (){
        dispatch(ReceiverAddressActionCreator.onSelectAddressItem(model));
      },
      child: Container(
        margin: EdgeInsets.only(left:15,right: 15,top: 5 ),
        decoration: BoxDecoration(
          color: ColorUtil.color("ffffff"),
          borderRadius: BorderRadius.circular(5),
        ),

        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10,top: 15,right: 10),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text(
                        model.province+model.city+model.zone+model.detailedaddress,
                        style: TextStyle(
                            fontSize: 16,color: GlobalThemeStyles.instance
                            .getMainTitleColor()
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "编辑",style: TextStyle(
                        fontSize: 14,color: ColorUtil.color("bbbbbb")
                    ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 14,bottom: 15),
              child: Text(
                model.contacts+" "+model.contactnumber,
                style: TextStyle(
                    fontSize: 14,color: ColorUtil.color("#666666")
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemBuilder: (c, i) => _buildItem(i),
        itemCount: state.addressList!=null&&state.addressList.length>0?state
            .addressList.length:0);
  }

  return Scaffold(
    backgroundColor: ColorUtil.color("#F7F7F7"),
    body: SafeArea(
      top: false,
      child: Container(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            CustomAppBarRightWidget(
              "地址管理",(){
              BaseTools.closePage(viewService.context);
            },
              rightWidget: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(viewService.context, RoutePath.ADD_RECEIVER_ADDRESS_PAGE);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30,right: 15),
                  height: 40,
                  width: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "新增地址",
                    style: TextStyle(
                        fontSize: 14,
                        color: GlobalThemeStyles.instance.getThemeColor()),
                  ),
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            Expanded(
              flex: 1,
              child: _buildListView(),
            ),

          ],
        ),
      ),
    ),
  );
}
