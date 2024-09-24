import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture({
    super.key,
    required this.assetName,
    this.height,
    this.width,
    required this.color,
  });

  final String assetName;
  final Color color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    // bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
