import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class CustomShareView extends StatelessWidget {

  final List buttonTitles = ["微信好友","朋友圈","QQ","微博"];
  final List buttonImages = ["assets/share_weixin.png", "assets/share_pengyou"
      ".png","assets/share_qq.png", "assets/share_weibo.png", ];

  static showShareView(BuildContext context,var shareType) {
    showModalBottomSheet(context: context,
        backgroundColor: Colors.white.withAlpha(0),
        elevation: 2,
        builder: (BuildContext context){
          return ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Container(
              height: 250,
              color: ColorUtil.color("#F4F4F4"),
              child: Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 14, left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("分享到", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(51, 51, 51, 1)
                          ),),
                          GestureDetector(
                            onTap: (){
                              CustomShareView()._dismiss(context);
                            },
                            child: Image.asset("assets/cp_push_close_icon"
                                ".png",width: 20,height: 20,),
                          ),
                        ],
                      )
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(CustomShareView().buttonTitles.length, (index){
                        return Container(
                          child: CustomShareView()._buttonWidget(context, CustomShareView().buttonTitles[index],
                              CustomShareView().buttonImages[index], index,shareType),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          );
        });

  }

  _buttonWidget(BuildContext context, String title, String imageName, int
  index,var shareType) {
    return GestureDetector(
      onTap: (){
        switch (index) {
          case 0://微信好友
            print("微信好友");
            _dismiss(context);
            shareType(0);
            break;
          case 1://朋友圈
            print("朋友圈");
            _dismiss(context);
            shareType(1);
            break;
          case 2://新浪微博
            print("qq");
            _dismiss(context);
            shareType(2);
            break;
          case 3://新浪微博
            print("新浪微博");
            _dismiss(context);
            shareType(3);
            break;
          default:
            break;
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("$imageName",width: 55,height: 55,),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(title, style:TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(51, 51, 51, 1)
            )),
          )
        ],
      ),
    );
  }

  _dismiss(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}


