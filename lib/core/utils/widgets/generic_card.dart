import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';

class GenericCard extends StatelessWidget {
  const GenericCard({
    super.key,
    required this.child,
    this.onTap,
    this.onLongTap,
    this.backgroundColor,
    this.borderRadius = AppSize.s8,
  });

  final Widget child;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongTap;
  final Color? backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: backgroundColor ?? colorBackgroundCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        shadows: [genericBoxShadow],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          onLongPress: onLongTap,
          child: child,
        ),
      ),
    );
  }
}
