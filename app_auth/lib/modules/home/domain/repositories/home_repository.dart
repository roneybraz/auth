import 'package:app_auth/core/error/failures.dart';
import 'package:app_auth/modules/home/domain/entities/response_home_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, ResponseHomeEntity>> getUser();
}
