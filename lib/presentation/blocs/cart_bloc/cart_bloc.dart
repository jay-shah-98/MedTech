import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medtech/core/usecase/usecase.dart';
import 'package:medtech/domain/entities/cart_entity.dart';
import 'package:medtech/domain/usecases/add_to_cart_usecase.dart';
import 'package:medtech/domain/usecases/remove_from_cart_usecase.dart';

import '../../../domain/entities/product_entity.dart';
import '../../../domain/usecases/get_cart_usecase.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCartUsecase addToCartUsecase;
  final GetCartUsecase getCartUsecase;
  final RemoveFromCartUsecase removeFromCartUsecase;

  CartBloc({
    required this.addToCartUsecase,
    required this.getCartUsecase,
    required this.removeFromCartUsecase,
  }) : super(CartInitial()) {
    on<GetCartEvent>((event, emit) async {
      final successOrFailure = await getCartUsecase(NoParams());

      successOrFailure.fold(
          (failure) => emit(CartFailure(message: failure.toString())),
          (success) => emit(CartSuccess(cartEntity: success)));
    });
    on<AddToCartEvent>((event, emit) async {
      emit(CartAlteration());
      EasyLoading.show();
      final successOrFailure = await addToCartUsecase(event.productEntity);
      EasyLoading.dismiss();
      successOrFailure.fold(
          (failure) => emit(CartFailure(message: failure.toString())),
          (success) => emit(CartSuccess(cartEntity: success)));
    });
    on<RemoveFromCart>((event, emit) async {
      emit(CartAlteration());
      EasyLoading.show();
      final successOrFailure = await removeFromCartUsecase(RemoveFromCartParams(
          productEntity: event.productEntity,
          removeProduct: event.removeProduct));
      EasyLoading.dismiss();
      successOrFailure.fold(
          (failure) => emit(CartFailure(message: failure.toString())),
          (success) => emit(CartSuccess(cartEntity: success)));
    });
  }
}
