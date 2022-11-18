part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();
}

class AddToCartEvent extends ProductDetailsEvent {
  final ProductEntity productEntity;

  const AddToCartEvent({required this.productEntity});

  @override
  List<Object?> get props => [productEntity];
}
