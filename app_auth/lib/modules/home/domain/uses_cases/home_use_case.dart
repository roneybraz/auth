import 'package:app_auth/core/error/failures.dart';
import 'package:app_auth/core/usecases/usecases.dart';
import 'package:app_auth/modules/home/domain/entities/response_home_entity.dart';
import 'package:app_auth/modules/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase implements UseCase<ResponseHomeEntity, NoParams> {
  final HomeRepository repository;

  const HomeUseCase(this.repository);

  @override
  Future<Either<Failure, ResponseHomeEntity>> call(NoParams params) async {
    return await repository.getUser();
  }
}
