import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({required this.message});
  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message: message);

  @override
  List<Object> get props => [];
}

class NoAuthorization extends Failure {
  NoAuthorization() : super(message: "");

  @override
  List<Object> get props => [];
}

class DeviceFailure extends Failure {
  DeviceFailure(String message) : super(message: message);

  @override
  List<Object> get props => [];
}

class CacheFailure extends Failure {
  CacheFailure() : super(message: "");

  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {
  NetworkFailure() : super(message: "");

  @override
  List<Object> get props => [];
}
