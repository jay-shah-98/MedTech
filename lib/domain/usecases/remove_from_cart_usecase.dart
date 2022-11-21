import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/product_entity.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../entities/cart_entity.dart';
import '../repositories/medtech_repository.dart';

class RemoveFromCartUsecase implements UseCase<dynamic, RemoveFromCartParams> {
  final MedTechRepository medTechRepository;

  RemoveFromCartUsecase({required this.medTechRepository});

  @override
  Future<Either<Failure, CartEntity>> call(
      RemoveFromCartParams removeFromCartParams) async {
    return await medTechRepository.removeFromCart(
      productEntity: removeFromCartParams.productEntity,
      removeProduct: removeFromCartParams.removeProduct,
    );
  }
}

class RemoveFromCartParams extends Equatable {
  final ProductEntity productEntity;
  final bool removeProduct;

  const RemoveFromCartParams({
    required this.productEntity,
    required this.removeProduct,
  });

  @override
  List<Object?> get props => [productEntity, removeProduct];
}
