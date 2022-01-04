import 'package:app_auth/modules/auth/domain/entities/response_auth_entity.dart';

class ResponseAuthModel extends ResponseAuthEntity {
  ResponseAuthModel({
    String? token,
  }) : super(token: token);

  factory ResponseAuthModel.fromJson(Map<String, dynamic> json) {
    return ResponseAuthModel(
      token: json['token'],
    );
  }
}
