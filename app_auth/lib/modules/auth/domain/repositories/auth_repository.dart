import 'package:app_auth/core/error/failures.dart';
import 'package:app_auth/modules/auth/domain/entities/response_auth_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, ResponseAuthEntity>> authLogin({
    required String email,
    required String password,
  });
}
