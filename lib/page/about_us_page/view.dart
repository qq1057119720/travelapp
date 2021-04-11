import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:travelapp/widgets/custom_appbar_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AboutUsState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: ColorUtil.color("#F8F8F8"),
    body: SafeArea(
      top: false,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          CustomAppBarWidget("关于我们", () {
            BaseTools.closePage(viewService.context);
          }),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                Container(
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 46),
                        child: Image.asset("assets/bh_nanzhidu.png"),
                      ),
                      Container(
                        child: Text(
                          "南之都公司",
                          style: TextStyle(
                              fontSize: 16, color: ColorUtil.color("#767676")),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 17, left: 10, right: 10),
                    height: 72.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15,top: 16.5),
                                child: Text(
                                  "官网",
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "www.nanzhidu.com",
                                  style: TextStyle(fontSize: 15, color:
                                  ColorUtil.color("#A7A7A7")),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 17.5),
                          width: 15,
                          height: 20,
                          child: Image.asset("assets/youjiantou.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 17, left: 10, right: 10),
                    height: 72.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15,top: 16.5),
                                child: Text(
                                  "官网邮箱",
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "nanzhidu.@com",
                                  style: TextStyle(fontSize: 15, color:
                                  ColorUtil.color("#A7A7A7")),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 17.5),
                          child: Text(
                            "点击复制",
                            style: TextStyle(fontSize: 13, color:
                            ColorUtil.color("#4A90E2")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 17, left: 10, right: 10),
                    height: 72.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15,top: 16.5),
                                child: Text(
                                  "客户服务热线",
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "11290",
                                  style: TextStyle(fontSize: 15, color:
                                  ColorUtil.color("#A7A7A7")),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 17.5),
                          width: 15,
                          height: 20,
                          child: Image.asset("assets/youjiantou.png"),
                        ),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 17, left: 10, right: 10),
                    height: 72.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15,top: 16.5),
                                child: Text(
                                  "违法和不良信息举报电话",
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "400-140-2222",
                                  style: TextStyle(fontSize: 15, color:
                                  ColorUtil.color("#A7A7A7")),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 17.5),
                          width: 15,
                          height: 20,
                          child: Image.asset("assets/youjiantou.png"),
                        ),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 17,left: 10,right: 10),
                    height: 72.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all( Radius.circular(10)),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[

                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text("营业执照",style: TextStyle(
                              fontSize: 16,color: Colors.black
                          ),),
                        ),Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 17.5),
                          width: 15,
                          height: 20,
                          child: Image.asset("assets/youjiantou.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
