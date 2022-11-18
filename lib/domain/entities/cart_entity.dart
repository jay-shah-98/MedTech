import 'package:equatable/equatable.dart';

import 'product_entity.dart';

class CartEntity extends Equatable {
  List<ProductEntity> products = [];

  num itemDiscount = 0;

  num get orderTotal {
    double total = 0;
    for (var item in products) {
      total += item.totalPrice;
    }
    return total;
  }

  num get discount {
    double total = 0;
    for (var item in products) {
      total += item.discount;
    }
    return total;
  }

  num get finalTotal {
    return orderTotal - discount;
  }

  @override
  List<Object?> get props => [];
}
