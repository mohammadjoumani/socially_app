import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socially_app/core/utils/extension/widget_extension.dart';
import 'package:socially_app/core/utils/resource/assets_manager.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/font_manager.dart';
import 'package:socially_app/core/utils/resource/language_manager.dart';
import 'package:socially_app/core/utils/resource/string_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/core/utils/widgets/margin.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: SvgPicture.asset(AssetsManager.imgOnboarding1),
        ),
      ],
    );
  }
}

class OnBoardingText1 extends StatelessWidget {
  const OnBoardingText1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.strOnBoardingTitle1.tr(context),
          textAlign: TextAlign.center,
          style: StyleManager.getBoldStyle(
            fontSize: FontSize.s20,
            color: colorPrimary,
          ),
        ).marginOnly(bottom: AppPadding.p8),
        Text(
          AppStrings.strOnBoardingBody1.tr(context),
          textAlign: TextAlign.center,
          style: StyleManager.getRegularStyle(
            fontSize: FontSize.s16,
            color: colorSecondary,
          ),
        ),
      ],
    );
  }
}
