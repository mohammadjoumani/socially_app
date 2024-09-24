import 'package:dartz/dartz.dart';
import 'package:socially_app/core/network/error_handler.dart';
import 'package:socially_app/core/network/failure.dart';
import 'package:socially_app/core/services/app_prefs.dart';
import 'package:socially_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:socially_app/features/auth/data/models/dto/request/login_request_dto.dart';
import 'package:socially_app/features/auth/data/models/dto/response/login_response_dto.dart';
import 'package:socially_app/features/auth/data/models/mapper/login_response_mapper.dart';
import 'package:socially_app/features/auth/domain/entities/user.dart';
import 'package:socially_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AppPreferences _appPref;

  AuthRepositoryImpl(this._authRemoteDataSource, this._appPref);

  @override
  Future<Either<Failure, User>> login(LoginRequestDto loginRequestDto) async {
    try {
      final response = await _authRemoteDataSource.login(loginRequestDto);
      final userInfo = LoginResponseDto.fromJson(response);
      _appPref.setUserInfo(userInfo);
      return Right(userInfo.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
