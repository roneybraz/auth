part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeLoadedState extends HomeState {
  final ResponseHomeEntity responseHomeEntity;

  const HomeLoadedState({required this.responseHomeEntity});

  @override
  List<Object> get props => [responseHomeEntity];
}

class HomeErrorState extends HomeState {
  final String message;
  const HomeErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
