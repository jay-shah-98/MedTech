import 'package:medtech/domain/entities/category_entity.dart';
import 'package:medtech/domain/entities/product_entity.dart';

import 'brand_entity.dart';

class HomeEntity {
  final List<BrandEntity> brands;
  final List<CategoryEntity> categories;
  final List<ProductEntity> products;

  HomeEntity({
    required this.brands,
    required this.categories,
    required this.products,
  });
}
