import 'package:equatable/equatable.dart';

class ResponseAuthEntity extends Equatable {
  final String? token;

  const ResponseAuthEntity({this.token});

  @override
  List<Object?> get props => [token];
}
