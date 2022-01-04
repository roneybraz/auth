import 'package:app_auth/core/error/failures.dart';
import 'package:app_auth/core/usecases/usecases.dart';
import 'package:app_auth/modules/auth/domain/entities/response_auth_entity.dart';
import 'package:app_auth/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AuthUseCase implements UseCase<ResponseAuthEntity, ParamsAuth> {
  final AuthRepository repository;

  const AuthUseCase(this.repository);

  @override
  Future<Either<Failure, ResponseAuthEntity>> call(ParamsAuth params) async {
    return await repository.authLogin(
      email: params.email,
      password: params.password,
    );
  }
}

class ParamsAuth extends Equatable {
  final String email;
  final String password;

  const ParamsAuth({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
