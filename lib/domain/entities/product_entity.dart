class ProductEntity {
  final String id;
  final String image;
  final String name;
  final num price;
  final num rating;
  final bool isDiscount;

  ProductEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.isDiscount,
  });
}
