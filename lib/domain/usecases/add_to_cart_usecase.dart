import 'package:dartz/dartz.dart';

import '../entities/cart_entity.dart';
import '../entities/product_entity.dart';
import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/medtech_repository.dart';

class AddToCartUsecase implements UseCase<dynamic, ProductEntity> {
  final MedTechRepository medTechRepository;

  AddToCartUsecase({required this.medTechRepository});

  @override
  Future<Either<Failure, CartEntity>> call(ProductEntity productEntity) async {
    return await medTechRepository.addToCart(productEntity: productEntity);
  }
}
