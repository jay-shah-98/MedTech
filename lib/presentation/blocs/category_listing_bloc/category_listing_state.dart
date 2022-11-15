part of 'category_listing_bloc.dart';

abstract class CategoryListingState extends Equatable {
  const CategoryListingState();
}

class CategoryListingInitial extends CategoryListingState {
  @override
  List<Object> get props => [];
}

class CategoryListingSuccess extends CategoryListingState {
  final CategoryListingEntity categoryListingEntity;

  const CategoryListingSuccess({required this.categoryListingEntity});
  @override
  List<Object?> get props => [categoryListingEntity];
}

class CategoryListingFailure extends CategoryListingState {
  final String message;

  const CategoryListingFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
