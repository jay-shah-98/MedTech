import 'package:dartz/dartz.dart';
import 'package:medtech/data/datasources/local_data_source.dart';
import 'package:medtech/domain/entities/cart_entity.dart';

import '../../core/error/exception.dart';
import '../../core/network/network_info.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/brand_entity.dart';
import '../../domain/entities/category_listing_entity.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/sub_category_entity.dart';
import '../../domain/repositories/medtech_repository.dart';
import '../datasources/remote_data_source.dart';
import '../models/brand_model.dart';
import '../models/category_model.dart';
import '../models/sub_category_model.dart';
import '../models/product_model.dart';

class MedTechRepositoryImpl implements MedTechRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;

  MedTechRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, HomeEntity>> getHomeData() async {
    if (await networkInfo.isConnected) {
      try {
        final futureData = await Future.wait([
          remoteDataSource.getCategories(),
          remoteDataSource.getBrands(),
          remoteDataSource.getDealsOfTheDay(),
        ]);
        List<CategoryModel> categoryList = futureData[0] as List<CategoryModel>;
        List<BrandModel> brandList = futureData[1] as List<BrandModel>;
        List<ProductModel> productList = futureData[2] as List<ProductModel>;

        List<BrandEntity> brandEntity =
            brandList.map((e) => e.toEntity()).toList();

        List<CategoryEntity> categoryEntity =
            categoryList.map((e) => e.toCategoryEntity()).toList();

        List<ProductEntity> productEntity =
            productList.map((e) => e.toProductEntity()).toList();

        HomeEntity homeEntity = HomeEntity(
          brands: brandEntity,
          categories: categoryEntity,
          products: productEntity,
        );

        return Right(homeEntity);
      } on ServerException catch (e) {
        if (e.message.isNotEmpty) {
          return Left(ServerFailure(message: e.message));
        } else {
          return const Left(ServerFailure());
        }
      } catch (e) {
        return const Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryListingEntity>> getCategoryListing(
      {required String categoryId}) async {
    if (await networkInfo.isConnected) {
      try {
        final futureData = await Future.wait([
          remoteDataSource.getSubCategories(categoryId: categoryId),
          remoteDataSource.getDealsOfTheDay(),
        ]);
        List<SubCategoryModel> subCategoryList =
            futureData[0] as List<SubCategoryModel>;
        List<ProductModel> productList = futureData[1] as List<ProductModel>;

        List<SubCategoryEntity> subCategoryEntity =
            subCategoryList.map((e) => e.toSubCategoryEntity()).toList();

        List<ProductEntity> productEntity =
            productList.map((e) => e.toProductEntity()).toList();

        CategoryListingEntity categoryListingEntity = CategoryListingEntity(
          subCategories: subCategoryEntity,
          products: productEntity,
        );

        return Right(categoryListingEntity);
      } on ServerException catch (e) {
        if (e.message.isNotEmpty) {
          return Left(ServerFailure(message: e.message));
        } else {
          return const Left(ServerFailure());
        }
      } catch (e) {
        return const Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, CartEntity>> addToCart(
      {required ProductEntity productEntity}) async {
    try {
      return Right(
          await localDataSource.addToCart(productEntity: productEntity));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      return Right(await localDataSource.getCart());
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CartEntity>> removeFromCart(
      {required ProductEntity productEntity,
      required bool removeProduct}) async {
    try {
      return Right(
          await localDataSource.removeFromCart(productEntity: productEntity, removeProduct: removeProduct));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
