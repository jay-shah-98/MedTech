part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartSuccess extends CartState {
  final CartEntity cartEntity;

  const CartSuccess({required this.cartEntity});

  CartSuccess copyWith({
    required CartEntity cartEntity,
  }) {
    return CartSuccess(cartEntity: cartEntity);
  }

  @override
  List<Object?> get props => [];
}

class CartAlteration extends CartState {
  @override
  List<Object?> get props => [];
}

class CartFailure extends CartState {
  final String message;

  const CartFailure({required this.message});

  @override
  List<Object?> get props => [];
}
