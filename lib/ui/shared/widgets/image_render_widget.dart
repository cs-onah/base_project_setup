import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

/// Renders all types of images
/// see [SvgRenderWidget]
class ImageRenderWidget extends StatelessWidget {
  static const header = <String, String>{};

  const ImageRenderWidget._(
      {Key? key,
      this.imageUrl,
      required this.height,
      required this.width,
      this.imagePath,
      this.fit = BoxFit.cover,
      this.placeholder})
      : assert(imagePath == null || imageUrl == null,
            "You can't pass both image path and image url"),
        super(key: key);
  final String? imageUrl;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final BoxFit fit;
  final String? imagePath;

  factory ImageRenderWidget.asset({
    required String imagePath,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) =>
      ImageRenderWidget._(
        imagePath: imagePath,
        height: height,
        width: width,
        fit: fit,
      );

  factory ImageRenderWidget.network(
          {required String? imageUrl,
          double? height,
          double? width,
          BoxFit fit = BoxFit.cover,
          Widget? placeholder}) =>
      ImageRenderWidget._(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: fit,
        placeholder: placeholder,
      );

  @override
  Widget build(BuildContext context) {
    const defaultPlaceHolder = CupertinoActivityIndicator();
    if (imagePath != null) {
      return Image.asset(
        imagePath!,
        fit: fit,
        width: width,
        height: height,
      );
    }
    if (imageUrl == null) return placeholder ?? defaultPlaceHolder;
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: fit,
      httpHeaders: header,
      placeholder: (_, __) => placeholder ?? defaultPlaceHolder,
      errorWidget: (_, __, ___) => placeholder ?? defaultPlaceHolder,
    );
  }

  static ImageProvider imageProvider(String imageUrl,
          {int? maxHeight, int? maxWidth}) =>
      CachedNetworkImageProvider(
        imageUrl,
        headers: header,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      );
}