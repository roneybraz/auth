import 'package:app_auth/core/shared/constants.dart';
import 'package:app_auth/core/shared/custom_dio.dart';
import 'package:app_auth/modules/auth/data/models/response_auth_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  Future<ResponseAuthModel> authLogin({
    required String email,
    required String password,
  });
  Future<void> toSaveAccessToken(ResponseAuthModel authToCache);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  Dio dio = CustomDio().instace;
  final SharedPreferences sharedPreferences;

  AuthRemoteDataSourceImpl(
      {required this.dio, required this.sharedPreferences});

  @override
  Future<ResponseAuthModel> authLogin({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post('/auth/login', data: {
        "email": email,
        "password": password,
      });

      return ResponseAuthModel.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }

  @override
  Future<void> toSaveAccessToken(ResponseAuthModel authToCache) {
    return sharedPreferences.setString(
      ACCESSTOKEN,
      authToCache.token!,
    );
  }
}
