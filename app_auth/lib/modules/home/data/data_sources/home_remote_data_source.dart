import 'package:app_auth/core/shared/custom_dio.dart';
import 'package:app_auth/modules/home/data/models/response_home_model.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<ResponseHomeModel> getUser();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  Dio dio = CustomDio().instace;

  HomeRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<ResponseHomeModel> getUser() async {
    try {
      Response response = await dio.get('/api/users/4');

      return ResponseHomeModel.fromJson(response.data['data']);
    } catch (error) {
      throw error;
    }
  }
}
