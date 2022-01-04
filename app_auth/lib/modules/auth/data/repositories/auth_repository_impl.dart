import 'package:app_auth/core/error/error_dio.dart';
import 'package:app_auth/core/error/failures.dart';
import 'package:app_auth/modules/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:app_auth/modules/auth/data/models/response_auth_model.dart';
import 'package:app_auth/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

typedef Future<ResponseAuthModel> _AuthLoginChooser();

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
  });

  @override
  Future<Either<Failure, ResponseAuthModel>> authLogin({
    required String email,
    required String password,
  }) async {
    return await _auth(() {
      return authRemoteDataSource.authLogin(email: email, password: password);
    });
  }

  Future<Either<Failure, ResponseAuthModel>> _auth(
    _AuthLoginChooser loginAuthChooser,
  ) async {
    try {
      final remoteLogin = await loginAuthChooser();

      authRemoteDataSource.toSaveAccessToken(remoteLogin);
      return Right(remoteLogin);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();

      return Left(ServerFailure(errorMessage));
    }
  }
}
