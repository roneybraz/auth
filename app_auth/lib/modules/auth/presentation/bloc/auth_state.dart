part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

class AuthLoadedState extends AuthState {
  final ResponseAuthEntity responseAuthEntity;

  const AuthLoadedState({required this.responseAuthEntity});

  @override
  List<Object> get props => [responseAuthEntity];
}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
