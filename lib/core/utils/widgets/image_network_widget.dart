import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/resource/assets_manager.dart';

class ImageNetworkWidget extends StatelessWidget {
  const ImageNetworkWidget({
    super.key,
    required this.imageUrl,
    required this.imageSize,
    required this.imageRadius,
    this.borderRadius = 0.0,
  });

  final String? imageUrl;
  final double imageSize;
  final double imageRadius;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageRadius),
      child: Image.asset(
        imageUrl ?? AssetsManager.imgUserPlaceHolder,
        width: imageSize,
        height: imageSize,
      ),
    );
  }
}

class ImagePlaceHolderWidget extends StatelessWidget {
  const ImagePlaceHolderWidget({super.key, required this.imageSize, required this.imageRadius});

  final double imageSize;
  final double imageRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageRadius),
      child: Image.asset(
        AssetsManager.imgUserPlaceHolder,
        width: imageSize,
        height: imageSize,
      ),
    );
  }
}
