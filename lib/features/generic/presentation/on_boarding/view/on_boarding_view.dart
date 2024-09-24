import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/widgets/change_language_button.dart';
import 'package:socially_app/core/utils/widgets/custom_scaffold.dart';

import 'widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: colorBackgroundCard,
      appBar: AppBar(
        actions: [
          ChangeLanguageButton(color: colorOnBackgroundCard),
        ],
      ),
      body: const OnBoardingViewBody(),
    );
  }
}
