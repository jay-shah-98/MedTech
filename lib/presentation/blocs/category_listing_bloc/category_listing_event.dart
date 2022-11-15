part of 'category_listing_bloc.dart';

abstract class CategoryListingEvent extends Equatable {
  const CategoryListingEvent();
}

class GetCategoryBasedData extends CategoryListingEvent {
  final String categoryId;

  const GetCategoryBasedData({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}
