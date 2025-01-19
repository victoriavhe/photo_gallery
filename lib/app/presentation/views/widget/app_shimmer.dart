import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({
    super.key,
    this.width = 300,
    this.height = 300,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withAlpha(40),
      highlightColor: Colors.white.withAlpha(20),
      child: Container(
        height: height,
        width: width,
        color: Colors.black,
      ),
    );
  }
}
