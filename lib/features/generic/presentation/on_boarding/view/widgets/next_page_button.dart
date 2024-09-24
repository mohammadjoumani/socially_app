import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(AppPadding.p16),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: Theme.of(context).primaryColor,
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_forward,
        color: colorOnPrimary,
        size: AppSize.s28,
      ),
    );
  }
}
