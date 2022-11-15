import 'product_entity.dart';
import 'sub_category_entity.dart';

class CategoryListingEntity {
  final List<SubCategoryEntity> subCategories;
  final List<ProductEntity> products;

  CategoryListingEntity({
    required this.subCategories,
    required this.products,
  });
}
