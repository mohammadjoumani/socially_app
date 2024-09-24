import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/utils/extension/widget_extension.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/language_manager.dart';
import 'package:socially_app/core/utils/resource/routes_manager.dart';
import 'package:socially_app/core/utils/resource/string_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/core/utils/state_render/generic_data_state.dart';
import 'package:socially_app/core/utils/widgets/custom_button.dart';
import 'package:socially_app/core/utils/widgets/custom_text_field.dart';
import 'package:socially_app/core/utils/widgets/show_message.dart';
import 'package:socially_app/features/auth/presentation/login/bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // EmailField
        Text(
          AppStrings.strUserName.tr(context),
          style: StyleManager.getRegularStyle(
            color: colorPrimary,
          ),
        ).marginOnly(bottom: AppPadding.p8),

        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) => previous.emailValidationMessage != current.emailValidationMessage,
          builder: (context, state) {
            return CustomTextField(
              hintText: AppStrings.strTypeYourUserName.tr(context),
              helperText: '',
              errorText: state.emailValidationMessage.isNotEmpty ? state.emailValidationMessage : null,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (value) => context.read<LoginBloc>().add(ChangeUserNameEvent(value)),
            );
          },
        ),

        // PasswordField
        Text(
          AppStrings.strPassword.tr(context),
          style: StyleManager.getRegularStyle(
            color: colorPrimary,
          ),
        ).marginOnly(bottom: AppPadding.p8),

        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) => previous.passwordValidatedMessage != current.passwordValidatedMessage || previous.isPasswordVisible != current.isPasswordVisible,
          builder: (context, state) {
            return CustomTextField(
              hintText: AppStrings.strTypeYourPassword.tr(context),
              helperText: '',
              errorText: state.passwordValidatedMessage.isNotEmpty ? state.passwordValidatedMessage : null,
              suffixIcon: IconButton(
                onPressed: () => context.read<LoginBloc>().add(ChangePasswordVisibilityEvent()),
                icon: Icon(
                  state.isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: Theme.of(context).hintColor,
                ),
              ),
              obscureText: !state.isPasswordVisible,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => context.read<LoginBloc>().add(ChangePasswordEvent(value)),
            );
          },
        ).marginOnly(bottom: AppPadding.p28),

        BlocConsumer<LoginBloc, LoginState>(
          buildWhen: (previous, current) => previous.submitLoginDataState != current.submitLoginDataState,
          listenWhen: (previous, current) => previous.submitLoginDataState != current.submitLoginDataState,
          listener: (context, state) {
            if (state.submitLoginDataState == GenericDataState.success) {
              Navigator.pushNamedAndRemoveUntil(context, Routes.navBarRoute, (Route<dynamic> route) => false);
            } else if (state.submitLoginDataState == GenericDataState.failure) {
              context.showMessage(state.failure?.message ?? '');
            }
          },
          builder: (context, state) {
            return CustomButton(
              label: AppStrings.strLogin.tr(context),
              onPressed: () => _onPressedSubmitLogin(context),
              isLoading: state.submitLoginDataState == GenericDataState.loading,
              // isLoading: ,
            );
          },
        ),
      ],
    );
  }

  _onPressedSubmitLogin(BuildContext context) {
    context.read<LoginBloc>().add(SubmitLoginEvent());
  }
}
