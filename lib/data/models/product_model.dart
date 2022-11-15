import '../../domain/entities/product_entity.dart';

class ProductModel {
  final String id;
  final String image;
  final String name;
  final num price;
  final num rating;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json, String id) {
    return ProductModel(
      id: id,
      image: json['image'],
      name: json['name'],
      price: json['price'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'rating': rating,
    };
  }
}

extension ProductModelToEntity on ProductModel {
  ProductEntity toProductEntity() => ProductEntity(
        id: id,
        name: name,
        image: image,
        price: price,
        rating: rating,
        isDiscount: false,
      );
}
