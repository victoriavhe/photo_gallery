import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.imageBuilder,
    this.plhHeight,
    this.plhWidth,
  });

  final String imageUrl;
  final double? height;
  final double? width;

  /// placeholder height and width
  final double? plhHeight;
  final double? plhWidth;

  final BoxFit? fit;
  final ImageWidgetBuilder? imageBuilder;

  Widget errorWidget() {
    return Center(
      child: Text(
        'Unable to load images at the moment. Try again later.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      imageBuilder: imageBuilder,
      placeholder: (context, url) => Center(
        child:  Shimmer.fromColors(
          baseColor: Colors.grey.withAlpha(40),
          highlightColor: Colors.white.withAlpha(20),
          child: Container(
            height: plhHeight ?? height,
            width: plhWidth ?? width,
            color: Colors.black,
          ),
        ),
      ),
      errorWidget: (context, url, error) => errorWidget(),
    );
  }
}
