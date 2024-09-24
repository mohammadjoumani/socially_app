import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';

class CustomItemBottomNavigation extends StatelessWidget {
  const CustomItemBottomNavigation({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: SvgPicture.asset(
            icon,
            width: AppSize.s24,
            height: AppSize.s24,
            colorFilter: ColorFilter.mode(
              isSelected ? colorPrimary : colorSecondary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

/*
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        child: SizedBox(
          width: context.getWidth * 0.2,
          // height: context.getWidth * 0.2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                width: AppSize.s24,
                height: AppSize.s24,
                colorFilter: ColorFilter.mode(
                  isSelected ? ColorManager.colorPrimary : ColorManager.colorGray1,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: AppSize.s2),
              Text(
                label,
                style: Styles.getRegularStyle(
                  color: isSelected ? ColorManager.colorPrimary : ColorManager.colorGray1,
                  fontSize: FontSize.s12,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
*
*/
