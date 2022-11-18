import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech/domain/entities/product_entity.dart';
import 'package:medtech/domain/usecases/add_to_cart_usecase.dart';

part 'product_details_event.dart';

part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final AddToCartUsecase addToCartUsecase;

  ProductDetailsBloc({
    required this.addToCartUsecase,
  }) : super(ProductDetailsInitial()) {
    on<AddToCartEvent>((event, emit) async {
      await addToCartUsecase(event.productEntity);
    });
  }
}
