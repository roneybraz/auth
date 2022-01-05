import 'package:app_auth/modules/home/domain/entities/response_home_entity.dart';

class ResponseHomeModel extends ResponseHomeEntity {
  ResponseHomeModel({
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) : super(
            email: email,
            firstName: firstName,
            lastName: lastName,
            avatar: avatar);

  factory ResponseHomeModel.fromJson(Map<String, dynamic> json) {
    return ResponseHomeModel(
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
