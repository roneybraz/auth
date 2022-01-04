import 'package:app_auth/core/shared/constants.dart';
import 'package:dio/dio.dart';

class CustomDio {
  late Dio _dio;

  CustomDio() {
    _dio = Dio();

    _dio.options.baseUrl = BASE_URL;

    _dio.options.receiveTimeout = 100000;
    _dio.options.connectTimeout = 100000;
  }

  Dio get instace => _dio;
}
