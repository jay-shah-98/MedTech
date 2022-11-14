import 'package:medtech/domain/entities/category_entity.dart';

class CategoryModel {
  final String image;
  final String name;
  final String id;

  CategoryModel({
    required this.image,
    required this.name,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json,String id) {
    return CategoryModel(
      image: json['image'],
      name: json['name'],
      id: id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'id': id,
    };
  }
}

extension CategoryModelToEntity on CategoryModel {
  CategoryEntity toCategoryEntity() => CategoryEntity(id: id, name: name, image: image);
}