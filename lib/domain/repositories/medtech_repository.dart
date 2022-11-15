import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/category_listing_entity.dart';
import '../entities/home_entity.dart';

abstract class MedTechRepository {
  Future<Either<Failure, HomeEntity>> getHomeData();

  Future<Either<Failure, CategoryListingEntity>> getCategoryListing({required String categoryId});
}
