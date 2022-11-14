import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medtech/core/usecase/usecase.dart';
import 'package:medtech/domain/entities/home_entity.dart';
import 'package:medtech/domain/usecases/home_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase homeUsecase;

  HomeBloc({
    required this.homeUsecase,
  }) : super(HomeInitial()) {
    on<GetHomeDataEvent>((event, emit) async {
      final failureOrHomeEntity = await homeUsecase(NoParams());

      failureOrHomeEntity.fold(
        (failure) {
          emit(
            HomeFailure(message: failure.toString()),
          );
        },
        (homeEntity) {
          emit(
            HomeSuccess(homeEntity: homeEntity),
          );
        },
      );
    });
  }
}
