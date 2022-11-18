part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class GetCartEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends CartEvent {
  final ProductEntity productEntity;

  const AddToCartEvent({required this.productEntity});

  @override
  List<Object?> get props => [productEntity];
}

class RemoveFromCart extends CartEvent {
  final ProductEntity productEntity;
  final bool removeProduct;

  const RemoveFromCart({
    required this.productEntity,
    this.removeProduct = false,
  });

  @override
  List<Object?> get props => [productEntity];
}
