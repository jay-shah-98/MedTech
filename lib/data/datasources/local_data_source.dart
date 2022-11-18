import 'package:medtech/domain/entities/cart_entity.dart';
import 'package:medtech/domain/entities/product_entity.dart';

abstract class LocalDataSource {
  Future<CartEntity> addToCart({required ProductEntity productEntity});

  Future<CartEntity> removeFromCart(
      {required ProductEntity productEntity, required bool removeProduct});

  Future<CartEntity> getCart();
}

class LocalDataSourceImpl extends LocalDataSource {
  CartEntity cartEntity = CartEntity();

  @override
  Future<CartEntity> addToCart({required ProductEntity productEntity}) async {
    bool isProductPresent = false;
    if (cartEntity.products.isEmpty) {
      productEntity.quantity = 1;
      cartEntity.products.add(productEntity);
    } else {
      for (var product in cartEntity.products) {
        if (product.id == productEntity.id) {
          product.quantity += 1;
          isProductPresent = true;
        }
      }
      if (!isProductPresent) {
        productEntity.quantity = 1;
        cartEntity.products.add(productEntity);
      }
    }
    print(cartEntity.products.length);
    print(cartEntity.products.first.quantity);
    print(cartEntity.orderTotal);
    return cartEntity;
  }

  @override
  Future<CartEntity> getCart() async {
    return cartEntity;
  }

  @override
  Future<CartEntity> removeFromCart(
      {required ProductEntity productEntity,
      required bool removeProduct}) async {
    if (removeProduct) {
      cartEntity.products
          .removeWhere((element) => element.id == productEntity.id);
      return cartEntity;
    } else {
      for (var product in cartEntity.products) {
        if (product.id == productEntity.id) {
          product.quantity -= 1;
          if(product.quantity == 0){
            cartEntity.products.remove(product);
          }
          break;
        }
      }
      return cartEntity;
    }
  }
}
