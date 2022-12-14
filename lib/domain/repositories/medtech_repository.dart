import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/cart_entity.dart';
import '../entities/category_listing_entity.dart';
import '../entities/home_entity.dart';
import '../entities/product_entity.dart';

abstract class MedTechRepository {
  Future<Either<Failure, HomeEntity>> getHomeData();

  Future<Either<Failure, CategoryListingEntity>> getCategoryListing({required String categoryId});

  Future<Either<Failure, CartEntity>> addToCart({required ProductEntity productEntity});

  Future<Either<Failure, CartEntity>> removeFromCart({required ProductEntity productEntity, required bool removeProduct});

  Future<Either<Failure, CartEntity>> getCart();

  Future<Either<Failure, void>> clearCart();
}
