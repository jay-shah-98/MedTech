import '../../domain/entities/sub_category_entity.dart';

class SubCategoryModel {
  final String image;
  final String name;
  final String id;
  final String categoryId;

  SubCategoryModel({
    required this.image,
    required this.name,
    required this.id,
    required this.categoryId,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json, String id) {
    return SubCategoryModel(
      image: json['image'],
      categoryId: json['category_id'],
      name: json['name'],
      id: id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'category_id': categoryId,
      'name': name,
      'id': id,
    };
  }
}

extension SubCategoryModelToEntity on SubCategoryModel {
  SubCategoryEntity toSubCategoryEntity() => SubCategoryEntity(
      id: id, name: name, image: image, categoryId: categoryId);
}
