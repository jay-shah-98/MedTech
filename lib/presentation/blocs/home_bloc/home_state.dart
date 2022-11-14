part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  final HomeEntity homeEntity;

  const HomeSuccess({required this.homeEntity});

  @override
  List<Object?> get props => [];
}

class HomeFailure extends HomeState {
  final String message;

  const HomeFailure({required this.message});
  @override
  List<Object?> get props => [];
}
