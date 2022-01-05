import 'package:equatable/equatable.dart';

class ResponseHomeEntity extends Equatable {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const ResponseHomeEntity(
      {this.email, this.firstName, this.lastName, this.avatar});

  @override
  List<Object?> get props => [email, firstName, lastName, avatar];
}
