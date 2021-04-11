import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomProgressBarWidget extends StatefulWidget {
  double width;
  double height;
  double progrssWidth;
  Color backgroundColor;
  List<Color> fillColors;
  CustomProgressBarWidget(this.width, this.height,this.progrssWidth,this
      .fillColors,this.backgroundColor);

  @override
  _CustomProgressBarState createState() =>
      _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBarWidget> {

  _CustomProgressBarState();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(widget.height/2)),
            ),
          ),
          Container(
            height: widget.height,
            width: widget.progrssWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(widget.height/2)),
              gradient: LinearGradient(colors: widget.fillColors),
            ),
          )
        ],
      ),
    );
  }
}
