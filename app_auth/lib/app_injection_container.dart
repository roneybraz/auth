import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/shared/custom_dio.dart';
import 'modules/auth/data/data_sources/auth_remote_data_source.dart';
import 'modules/auth/data/repositories/auth_repository_impl.dart';
import 'modules/auth/domain/repositories/auth_repository.dart';
import 'modules/auth/domain/uses_cases/auth_use_case.dart';
import 'modules/auth/presentation/bloc/auth_bloc.dart';
import 'modules/home/data/data_sources/home_remote_data_source.dart';
import 'modules/home/data/repositories/home_repository_impl.dart';
import 'modules/home/domain/repositories/home_repository.dart';
import 'modules/home/domain/uses_cases/home_use_case.dart';
import 'modules/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;
final Dio dio = CustomDio().instace;

Future<void> init() async {
  // Bloc

  sl.registerFactory(
    () => AuthBloc(
      authUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => HomeBloc(
      homeUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AuthUseCase(sl()));
  sl.registerLazySingleton(() => HomeUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeRemoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      dio: dio,
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      dio: dio,
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
