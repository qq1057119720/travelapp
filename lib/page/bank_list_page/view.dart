import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/global_theme_styles.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/model/user_bank_model.dart';
import 'package:travelapp/net/http_proxy.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_alert_widgets.dart';
import 'package:travelapp/widgets/custom_appbar_right_widget.dart';
import 'package:travelapp/widgets/custom_cached_image_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    BankListState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildItemView(int i) {
    UserBankModel accountBankModel = state.accountList[i];
    return GestureDetector(
      onTap: () {
//        dispatch(MessageActionCreator.toMessageDetail(messageModel));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
//                border:new Border.all(color: Color(0xFFFF0000), width: 0.5) ,
          boxShadow: [
            BoxShadow(
                color: ColorUtil.color("#11000000"),
                offset: Offset(0.0, 0.0),
                blurRadius: 4.0,
                spreadRadius: 4.0)
          ],
        ),
        child: Container(
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 15, left: 10),
                  child: CustomCachedImageWidget(
                    BaseTools.isEmpty(accountBankModel.banimg)
                        ? ""
                        :  accountBankModel.banimg,
                    width: 40,
                    height: 40,
                  )),
              Container(
                child: Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        accountBankModel.brankname,
                        style: TextStyle(
                            fontSize: 14, color: ColorUtil.color("333333")),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        accountBankModel.cardnumber,
                        style: TextStyle(
                            fontSize: 12, color: ColorUtil.color("999999")),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              GestureDetector(
                onTap: (){
                  showGeneralDialog(
                    context: viewService.context,
                    barrierLabel: "",
                    barrierDismissible: true,
                    transitionDuration: Duration(milliseconds: 300),
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return CustomAlertWidget("确定要删除改银行卡？","确定",affirm:
                          (){
                        BaseTools.closePage(viewService.context);
                        dispatch(BankListActionCreator.deleteAccountBank
                          (accountBankModel.bankcardid));

                      },cancel: (){
                        BaseTools.closePage(viewService.context);
                      },);
                    },
                  );
                },
                behavior: HitTestBehavior.translucent,
                child:  Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset("assets/shanchu.png",width: 15,
                    height: 15,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemBuilder: (c, i) => _buildItemView(i),
        itemCount: state.accountList != null ? state.accountList.length : 0);
  }

  ;

  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      top: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(viewService.context).requestFocus(new FocusNode());
        },
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            CustomAppBarRightWidget(
              "银行卡列表",(){
              BaseTools.closePage(viewService.context);
            },
              rightWidget: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(viewService.context, RoutePath.ADD_BANK_PAGE);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30,right: 15),
                  height: 40,
                  width: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "新增",
                    style: TextStyle(
                        fontSize: 14,
                        color: GlobalThemeStyles.instance.getThemeColor()),
                  ),
                ),
              ),
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
