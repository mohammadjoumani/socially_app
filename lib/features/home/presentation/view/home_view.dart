import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/utils/resource/assets_manager.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/font_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/core/utils/widgets/change_language_button.dart';
import 'package:socially_app/core/utils/widgets/custom_scaffold.dart';
import 'package:socially_app/core/utils/widgets/custom_svg_picture.dart';
import 'package:socially_app/features/home/domain/use_cases/get_posts_use_case.dart';
import 'package:socially_app/features/home/domain/use_cases/get_stories_use_case.dart';
import 'package:socially_app/features/home/presentation/bloc/home_bloc.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        GetPostsUseCase(),
        GetStoriesUseCase(),
      )
        ..add(GetPostsEvent())
        ..add(GetStoriesEvent()),
      child: CustomScaffold(
        appBar: AppBar(
          title: Text(
            'Socially'.toUpperCase(),
            style: StyleManager.getBoldStyle(
              color: colorOnBackgroundScaffold,
              fontSize: FontSize.s30,
            ).copyWith(letterSpacing: 2.5),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: CustomSvgPicture(
              assetName: AssetsManager.icNotification,
              color: colorOnBackgroundScaffold,
              width: AppSize.s24,
              height: AppSize.s24,
            ),
          ),
          actions: [
            ChangeLanguageButton(
              color: colorOnBackgroundScaffold,
            )
          ],
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
