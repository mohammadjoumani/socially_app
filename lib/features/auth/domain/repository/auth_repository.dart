import 'package:dartz/dartz.dart';
import 'package:socially_app/core/network/failure.dart';
import 'package:socially_app/features/auth/data/models/dto/request/login_request_dto.dart';
import 'package:socially_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(LoginRequestDto loginRequestDto);
}
