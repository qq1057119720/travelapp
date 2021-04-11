import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:travelapp/app_route.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_alert_widgets.dart';


import 'action.dart';
import 'state.dart';
const PickerData = '''
[
"招商银行","工商银行","农业银行","建设银行","交通银行"
]
''';

Widget buildView(WithdrawDepositState state, Dispatch dispatch, ViewService viewService) {

  showPickerModal(BuildContext context,{Dispatch dispatch}) {
    List<String> list=new List();
    state.accountList.forEach((element) {
      list.add(element.brankname+":"+element.cardnumber);
    });
    Picker(
        adapter: PickerDataAdapter<String>(pickerdata: list),
        changeToFirst: true,
        hideHeader: false,
        cancelTextStyle: TextStyle(fontSize: 14,color: ColorUtil.color("666666")),
        confirmTextStyle: TextStyle(fontSize: 14,color: UnifiedThemeStyles.themeColor),
        cancelText: "取消",
        confirmText: "确定",
        textStyle: TextStyle(color:ColorUtil.color("666666"),fontSize: 15),
        selectedTextStyle: TextStyle(color: UnifiedThemeStyles.themeColor,
            fontSize: 16),
        onConfirm: (Picker picker, List value) {
          print(value[0]);
          dispatch(WithdrawDepositActionCreator.onUpdateBank(state.accountList[value[0]]));

        }
    ).showModal(context);
  }

  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      top: false,
      child: GestureDetector(
        onTap: (){
          FocusScope.of(viewService.context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: new BoxConstraints(),
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  width: BaseTools.getWidth(viewService.context),
                  color: Colors.white,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "余额提现"
                          ,style: TextStyle(fontSize: 18,color: ColorUtil
                            .color("333333")),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 10,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(viewService.context);
                          },
                          child: Container(
                            height: 50,
                            child: Image.asset("assets/bh_topback_h.png",width: 25,height: 25,),

                          ),
                        ),
                      ),

                      Positioned(
                        top: 0,
                        right: 10,
                        child: GestureDetector(
                          onTap: (){
                            dispatch(WithdrawDepositActionCreator.toUserWithdraw());
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: Text("确认",style: TextStyle(color: ColorUtil.color("333333"),
                                fontSize: 16),),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///标题
                Container(
                  height: 45,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                      left: 15,  right: 15),
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(hintText:"请输入提现金额,必须是100的倍数",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        filled: true,
                        fillColor: ColorUtil.color("#ffffff"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none
                        )),
                    controller: state.nameEditController,
                    focusNode: state.nameFocusNode,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    style:  TextStyle(color: ColorUtil.color("333333"), fontSize: 16),
                    onChanged: (account){
//                    dispatch(CheckPhoneActionCreator.onAccountChange());
                    },
                  ),
                ),
                Container(
                  height: 1,
                  color: ColorUtil.color("f7f7f7"),
                  margin: EdgeInsets.only(left: 15),
                ),

                GestureDetector(
                  onTap: (){
                    if(state.accountList!=null&&state.accountList.length>0){
                      showPickerModal(viewService.context,dispatch: dispatch);
                    }else{
                      showGeneralDialog(
                        context: viewService.context,
                        barrierLabel: "",
                        barrierDismissible: true,
                        transitionDuration: Duration(milliseconds: 300),
                        pageBuilder: (BuildContext context, Animation animation,
                            Animation secondaryAnimation) {
                          return CustomAlertWidget("尚未绑定银行卡，是否前去绑定？","确定",
                            affirm: (){
                            Navigator.pop(viewService.context);
                            Navigator.pushNamed(viewService.context, RoutePath.ADD_BANK_PAGE);
                          },cancel: (){
                            Navigator.pop(viewService.context);
                          },);
                        },
                      );
                    }


                  },
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: 45,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left:15 ),
                        child: Text("选择开户银行",style: TextStyle(color: ColorUtil.color("#ACAEBC"),fontSize: 16),),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            if(state.accountList!=null&&state.accountList.length>0){
                              showPickerModal(viewService.context,dispatch: dispatch);
                            }else{
                              showGeneralDialog(
                                context: viewService.context,
                                barrierLabel: "",
                                barrierDismissible: true,
                                transitionDuration: Duration(milliseconds: 300),
                                pageBuilder: (BuildContext context, Animation animation,
                                    Animation secondaryAnimation) {
                                  return CustomAlertWidget("尚未绑定银行卡，是否前去绑定？","确定",affirm: (){
                                    Navigator.pop(viewService.context);
                                    Navigator.pushNamed(viewService.context, RoutePath.ADD_BANK_PAGE);
                                  },cancel: (){
                                    Navigator.pop(viewService.context);
                                  },);
                                },
                              );
                            }

                          },
                          child:  Container(
                            height: 45,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right:15 ),
                            child: Text(BaseTools.isEmpty(state
                                .accountBankModel)?"请选择绑定银行卡":state
                                .accountBankModel.brankname,style: TextStyle(color:
                            ColorUtil.color("666666"),fontSize: 16),),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Image.asset("assets/bh_sgin_right.png",width: 15,height: 15,),
                      )

                    ],
                  ),
                ),

                Container(
                  height: 1,
                  color: ColorUtil.color("f7f7f7"),
                  margin: EdgeInsets.only(left: 15),
                ),


                GestureDetector(
                  onTap: (){

                  },
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: 45,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left:15 ),
                        child: Text("开户名称",style: TextStyle(color: ColorUtil.color("#ACAEBC"),fontSize: 16),),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            showPickerModal(viewService.context,dispatch: dispatch);
                          },
                          child:  Container(
                            height: 45,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right:15 ),
                            child: Text(BaseTools.isEmpty(state
                                .accountBankModel)?"":state.accountBankModel.ownername,style: TextStyle(color: ColorUtil.color("666666"),fontSize: 16),),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Image.asset("",width: 15,height: 15,),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 1,
                  color: ColorUtil.color("f7f7f7"),
                  margin: EdgeInsets.only(left: 15),
                ),

                GestureDetector(
                  onTap: (){
                  },
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: 45,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left:15 ),
                        child: Text("绑定手机号",style: TextStyle(color: ColorUtil.color("#ACAEBC"),fontSize: 16),),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            showPickerModal(viewService.context,dispatch: dispatch);
                          },
                          child:  Container(
                            height: 45,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right:15 ),
                            child: Text(BaseTools.isEmpty(state
                                .accountBankModel)?"":state.accountBankModel
                                .ownerphone,style: TextStyle(color: ColorUtil.color("666666"),fontSize: 16),),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Image.asset("",width: 15,height: 15,),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 1,
                  color: ColorUtil.color("f7f7f7"),
                  margin: EdgeInsets.only(left: 15),
                ),

                GestureDetector(
                  onTap: (){
                  },
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: 45,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left:15 ),
                        child: Text("银行卡号",style: TextStyle(color: ColorUtil.color("#ACAEBC"),fontSize: 16),),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            showPickerModal(viewService.context,dispatch: dispatch);
                          },
                          child:  Container(
                            height: 45,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right:15 ),
                            child: Text(BaseTools.isEmpty(state
                                .accountBankModel)?"":state.accountBankModel.cardnumber,style: TextStyle(color: ColorUtil.color("666666"),fontSize: 16),),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Image.asset("",width: 15,height: 15,),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 1,
                  color: ColorUtil.color("f7f7f7"),
                  margin: EdgeInsets.only(left: 15),
                ),

              ],
            ),

          ),
        ),
      ),
    ),
  );
}
