import 'package:medtech/domain/entities/brand_entity.dart';

class BrandModel {
  final String image;
  final String name;
  final String id;

  BrandModel({
    required this.image,
    required this.name,
    required this.id,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json, String id) {
    return BrandModel(
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

extension BrandModelToEntity on BrandModel {
  BrandEntity toEntity() => BrandEntity(id: id, name: name, image: image);
}
