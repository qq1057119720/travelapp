import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:flutter/cupertino.dart';

///网络图片加载失败
class CustomNetImageError extends StatefulWidget {
  final double width;
  final double height;


  CustomNetImageError({this.width, this.height});

  @override
  _CustomNetImageErrorState createState() => _CustomNetImageErrorState();
}

class _CustomNetImageErrorState extends State<CustomNetImageError> {
  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: widget.width,
          height: widget.height,
          color: UnifiedThemeStyles.defultImgError,
               ),
      );
}
