import 'package:app_auth/core/error/error_dio.dart';
import 'package:app_auth/core/error/failures.dart';
import 'package:app_auth/modules/home/data/data_sources/home_remote_data_source.dart';
import 'package:app_auth/modules/home/data/models/response_home_model.dart';
import 'package:app_auth/modules/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

typedef Future<ResponseHomeModel> _HomeChooser();

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failure, ResponseHomeModel>> getUser() async {
    return await _getUser(() {
      return homeRemoteDataSource.getUser();
    });
  }

  Future<Either<Failure, ResponseHomeModel>> _getUser(
    _HomeChooser HomeChooser,
  ) async {
    try {
      final remoteHome = await HomeChooser();

      return Right(remoteHome);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();

      return Left(ServerFailure(errorMessage));
    }
  }
}
