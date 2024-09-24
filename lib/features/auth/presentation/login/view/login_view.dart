import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/app/di.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/widgets/change_language_button.dart';
import 'package:socially_app/core/utils/widgets/custom_scaffold.dart';
import 'package:socially_app/features/auth/presentation/login/bloc/login_bloc.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<LoginBloc>(),
      child: CustomScaffold(
        backgroundColor: colorBackgroundCard,
        appBar: AppBar(
          actions: [
            ChangeLanguageButton(color: colorOnBackgroundCard),
          ],
        ),
        body: const LoginViewBody(),
      ),
    );
  }
}
