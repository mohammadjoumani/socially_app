import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
  });

  final String label;
  final GestureTapCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? colorPrimary,
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: InkWell(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSize.s8),
              onTap: onPressed,
              child: SizedBox(
                height: AppSize.s48,
                width: double.infinity,
                child: Center(
                  child: isLoading
                      ? SizedBox(
                          width: AppSize.s24,
                          height: AppSize.s24,
                          child: CircularProgressIndicator(
                            color: colorOnSecondary,
                          ),
                        )
                      : Text(
                          label,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: textColor ?? colorOnPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
