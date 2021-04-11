import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/model/system_info_model.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(SystemInfoListState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildItem(int index){
    SystemInfoModel model=state.list[index];
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(viewService.context, RoutePath.SYSTEM_INFO_DETAIL_PAGE,arguments: {"model":model});
      },
      child: Container(
        height: 52,
        margin: EdgeInsets.only(top: 10,right: 10,left: 10),
        decoration: BoxDecoration(
          color: ColorUtil.color("#ffffff"),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 3,
              height: 12,
              color: GlobalThemeStyles.instance.getThemeColor(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 13),
                child: Text(
                  model.infoname,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 14,color: GlobalThemeStyles.instance
                      .getMainTitleColor()
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(right: 12,left: 20),
              child: Image.asset("assets/bh_right_arrow.png"),
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
        itemCount: state.list!=null&&state.list.length>0?state
            .list.length:0);
  }

  return Scaffold(
    backgroundColor: ColorUtil.color("f5f5f5"),
    body: SafeArea(
      top: false,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[

          CustomAppBarWidget(
            "常见问题",
              (){
              BaseTools.closePage(viewService.context);
              },
          ),
          Expanded(
            flex: 1,
            child: _buildListView(),
          )
        ],
      ),
    ),
  );
}
