import 'package:travelapp/constants/unified_theme_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

///网络图片占位样式
class CustomNetImagePlaceholder extends StatefulWidget {
 final double width;
 final double height;

  CustomNetImagePlaceholder({this.width, this.height});

  @override
  _CustomNetImagePlaceholderState createState() =>
      _CustomNetImagePlaceholderState();
}

class _CustomNetImagePlaceholderState extends State<CustomNetImagePlaceholder> {
  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Shimmer.fromColors(
          baseColor: UnifiedThemeStyles.PLACEHOLDER_GRAY,
          highlightColor: UnifiedThemeStyles.WHITE,
          child: Container(
            width: widget.width,
            height: widget.height,
            color: UnifiedThemeStyles.PLACEHOLDER_GRAY,
          ),
        ),
      );
}
