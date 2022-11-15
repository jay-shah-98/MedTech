import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/category_listing_entity.dart';
import '../../../domain/usecases/category_listing_usecase.dart';

import '../../../core/usecase/usecase.dart';

part 'category_listing_event.dart';

part 'category_listing_state.dart';

class CategoryListingBloc
    extends Bloc<CategoryListingEvent, CategoryListingState> {
  final CategoryListingUsecase categoryListingUsecase;

  CategoryListingBloc({
    required this.categoryListingUsecase,
  }) : super(CategoryListingInitial()) {
    on<GetCategoryBasedData>((event, emit) async {
      final failureOrHomeEntity = await categoryListingUsecase(event.categoryId);

      failureOrHomeEntity.fold(
        (failure) {
          emit(
            CategoryListingFailure(message: failure.toString()),
          );
        },
        (categoryListingEntity) {
          emit(
            CategoryListingSuccess(
                categoryListingEntity: categoryListingEntity),
          );
        },
      );
    });
  }
}
