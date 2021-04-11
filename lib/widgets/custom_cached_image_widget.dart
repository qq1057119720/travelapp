import 'package:travelapp/net/http_proxy.dart';
import 'package:travelapp/utils/base_tools.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'custom_net_image_error.dart';
import 'custom_net_image_placeholder.dart';

///cacheNetworkIamge统一封装
class CustomCachedImageWidget extends StatefulWidget {
  final String imageUrl;
  final double width;
  final double height;

  CustomCachedImageWidget(this.imageUrl, {this.width, this.height});

  @override
  _CustomCachedImageWidgetState createState() =>
      _CustomCachedImageWidgetState();
}

class _CustomCachedImageWidgetState extends State<CustomCachedImageWidget> {
  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: widget.width,
      height: widget.height,
      imageUrl: BaseTools.isEmpty(widget.imageUrl)?HttpProxy.HTTP_URL:widget.imageUrl.contains("http")?widget.imageUrl:HttpProxy.HTTP_URL+widget.imageUrl,
      placeholder: (context, url) => CustomNetImagePlaceholder(
        width: widget.width,
        height: widget.height,
      ),
      errorWidget: (context, url, error) => CustomNetImageError(
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}
