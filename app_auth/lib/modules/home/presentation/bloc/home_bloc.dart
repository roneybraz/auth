import 'package:app_auth/core/error/failures.dart';
import 'package:app_auth/core/usecases/usecases.dart';
import 'package:app_auth/modules/home/domain/entities/response_home_entity.dart';
import 'package:app_auth/modules/home/domain/uses_cases/home_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeUseCase homeUseCase;
  HomeBloc({required this.homeUseCase}) : super(HomeInitial()) {
    on<getUserEvent>(_onGetUser);
  }

  void _onGetUser(
    getUserEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState());
    final failureOrSuccess = await homeUseCase(NoParams());

    failureOrSuccess.fold(
        (failure) =>
            emit(HomeErrorState(message: _mapFailureToMessage(failure))),
        (success) => emit(HomeLoadedState(responseHomeEntity: success)));
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
