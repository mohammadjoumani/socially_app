import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/extension/widget_extension.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/font_manager.dart';
import 'package:socially_app/core/utils/resource/language_manager.dart';
import 'package:socially_app/core/utils/resource/string_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';

import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.strWelcomeBack.tr(context),
              style: StyleManager.getBoldStyle(
                fontSize: FontSize.s30,
                color: colorPrimary,
              ),
            ).marginSymmetric(vertical: AppPadding.p16),
            Text(
              AppStrings.strPleaseEnterDataToLogin.tr(context),
              style: StyleManager.getRegularStyle(
                color: colorSecondary,
                fontSize: FontSize.s16,
              ),
            ).marginOnly(bottom: AppPadding.p50),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
