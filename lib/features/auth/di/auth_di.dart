import 'package:socially_app/core/app/di.dart';
import 'package:socially_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:socially_app/features/auth/presentation/login/bloc/login_bloc.dart';

void initLoginModule() {
  instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  instance.registerFactory<LoginBloc>(() => LoginBloc(instance()));
}
