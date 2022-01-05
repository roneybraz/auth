import 'package:app_auth/core/error/failures.dart';
import 'package:app_auth/modules/auth/domain/entities/response_auth_entity.dart';
import 'package:app_auth/modules/auth/domain/uses_cases/auth_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthUseCase authUseCase;
  AuthBloc({required this.authUseCase}) : super(AuthInitial()) {
    on<AuthLoginEvent>(_onAuthLogin);
  }

  void _onAuthLogin(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());
    final failureOrSuccess = await authUseCase(
        ParamsAuth(email: event.email, password: event.password));

    failureOrSuccess.fold(
        (failure) =>
            emit(AuthErrorState(message: _mapFailureToMessage(failure))),
        (success) => emit(AuthLoadedState(responseAuthEntity: success)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.message;

      default:
        return 'Erro desconhecido';
    }
  }
}
