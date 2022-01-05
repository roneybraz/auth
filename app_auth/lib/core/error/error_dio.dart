import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String? message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Verifique sua conexão e tente novamente";
        break;
      case DioErrorType.connectTimeout:
        message = "Verifique sua conexão e tente novamente";
        break;
      case DioErrorType.other:
        message = "Verifique sua conexão e tente novamente";
        break;
      case DioErrorType.receiveTimeout:
        message = "Verifique sua conexão e tente novamente";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Verifique sua conexão e tente novamente";
        break;
      default:
        message = "Ops, algo deu errado, tente novamente";
        break;
    }
  }
  String _handleError(int? statusCode, dynamic error) {
    return error["error"] ?? "Ops, algo deu errado, tente novamente";
  }

  @override
  String toString() => message!;
}
