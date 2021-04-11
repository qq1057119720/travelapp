import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_alert_widgets.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AddBankState state, Dispatch dispatch, ViewService viewService) {

  showPickerModal(BuildContext context,{Dispatch dispatch}) {
    List<String> list=new List();
    state.bankList.forEach((element) {
      list.add(element.name);
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
          dispatch(AddBankActionCreator.onUpdateBank(state.bankList[value[0]]));

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               CustomAppBarWidget("绑定银行卡",(){
                 BaseTools.closePage(viewService.context);
               }),
                Container(
                  height: 45,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                      left: 15,  right: 15),
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(hintText:"请输入开户名称",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        filled: true,
                        fillColor: ColorUtil.color("#ffffff"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1),
                            borderSide: BorderSide.none
                        )),
                    controller: state.accNameEditController,
                    focusNode: state.accNameFocusNode,
                    keyboardType: TextInputType.text,
                    autofocus: true,
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

                Container(
                  height: 45,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                      left: 15,  right: 15),
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(hintText:"请输入预留手机号码",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        filled: true,
                        fillColor: ColorUtil.color("#ffffff"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1),
                            borderSide: BorderSide.none
                        )),
                    controller: state.accPhoneEditController,
                    focusNode: state.accPhoneFocusNode,
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
                    showPickerModal(viewService.context,dispatch: dispatch);
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: 45,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left:15 ),
                        child: Text(BaseTools.isEmpty(state.bankModel)
                            ?"选择开户行":state.bankModel.name,style: TextStyle
                          (color: ColorUtil.color("#ACAEBC"),fontSize: 16),),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            showPickerModal(viewService.context,dispatch: dispatch);
                          },
                          child:  Container(
                            color: Colors.white,
                            height: 45,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right:15 ),
                            child: Text("选择开户行",style: TextStyle(color: ColorUtil.color("666666"),fontSize: 16),),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Image.asset("assets/bh_sgin_right.png",width: 15,height: 15,),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: ColorUtil.color("f7f7f7"),
                  margin: EdgeInsets.only(left: 15),
                ),

                Container(
                  height: 45,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                      left: 15,  right: 15),
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(hintText:"请输入银行卡号",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        filled: true,
                        fillColor: ColorUtil.color("#ffffff"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1),
                            borderSide: BorderSide.none
                        )),
                    controller: state.bankNumEditController,
                    focusNode: state.bankNumFocusNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp("[0-9.]")),//只允许输入小数
                    ],
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

                Container(
                  height: 45,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                      left: 15,  right: 15),
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(hintText:"请输入开户行支行名称",
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        filled: true,
                        fillColor: ColorUtil.color("#ffffff"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1),
                            borderSide: BorderSide.none
                        )),
                    controller: state.bankSubEditController,
                    focusNode: state.bankSubFocusNode,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    style:  TextStyle(color: ColorUtil.color("333333"), fontSize: 16),
                    onChanged: (account){
//                    dispatch(CheckPhoneActionCreator.onAccountChange());
                    },
                  ),
                ),

               GestureDetector(
                 onTap: (){
                   dispatch(AddBankActionCreator.onToAddBank());
                 },
                 child:  Container(
                   margin: EdgeInsets.only(left: 84,right: 84,top: 40),
                   height: 44.5,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     gradient: LinearGradient(colors: [
                       ColorUtil.color("#5992FE"),
                       ColorUtil.color("#5992FE"),
                     ]),
                     borderRadius: BorderRadius.circular(44.5/2),
                   ),
                   child: Text(
                     "确定",style: TextStyle(
                       fontSize: 17,color: ColorUtil.color("#ffffff"),
                       fontWeight: FontWeight.bold
                   ),
                   ),
                 ),
               ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
