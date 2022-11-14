import 'package:dartz/dartz.dart';
import 'package:medtech/core/error/exception.dart';
import 'package:medtech/core/network/network_info.dart';
import 'package:medtech/data/datasources/remote_data_source.dart';
import 'package:medtech/data/models/brand_model.dart';
import 'package:medtech/data/models/category_model.dart';
import 'package:medtech/domain/entities/brand_entity.dart';
import 'package:medtech/domain/entities/category_entity.dart';
import 'package:medtech/domain/entities/home_entity.dart';
import 'package:medtech/domain/entities/product_entity.dart';
import 'package:medtech/domain/repositories/mdetech_repository.dart';

import '../../core/error/failure.dart';
import '../models/product_model.dart';

class MedTechRepositoryImpl implements MedTechRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MedTechRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
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
}
