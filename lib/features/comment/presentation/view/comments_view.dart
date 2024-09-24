import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/font_manager.dart';
import 'package:socially_app/core/utils/resource/language_manager.dart';
import 'package:socially_app/core/utils/resource/string_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/widgets/custom_scaffold.dart';
import 'package:socially_app/features/comment/domain/use_cases/get_comments_use_case.dart';
import 'package:socially_app/features/comment/presentation/bloc/comments_bloc.dart';

import 'widgets/comments_view_body.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentsBloc(GetCommentsUseCase())..add(GetCommentsEvent()),
      child: CustomScaffold(
        backgroundColor: colorBackgroundCard,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: colorOnBackgroundCard,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            AppStrings.strComments.tr(context),
            style: StyleManager.getBoldStyle(
              color: colorOnBackgroundCard,
              fontSize: FontSize.s20,
            ),
          ),
        ),
        body: const CommentsViewBody(),
      ),
    );
  }
}
