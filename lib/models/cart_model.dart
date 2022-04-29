import 'package:equatable/equatable.dart';
import 'package:shopify/models/product_model.dart';

class Cart extends Equatable {
  const Cart({this.products = const <Product>[]});

  final List<Product>? products;

  Map productQuantity(products) {
    var quantity = {};
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  double get subTotal => products!
      .fold(0, (total, current) => total + double.parse(current.price!));

  double deliveryFee(subTotal) {
    if (subTotal >= 500.0) {
      return 0.0;
    } else {
      return 80.0;
    }
  }

  String freeDelivery(subTotal) {
    if (subTotal >= 500.0) {
      return "You have Free Delivery";
    } else {
      double missing = 500.0 - subTotal;
      return 'Add Rs. ${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  double total(subTotal, deliveryFee) {
    return subTotal + deliveryFee(subTotal);
  }

  String get subTotalString => subTotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);
  String get freedeliveryString => freeDelivery(subTotal);
  String get totalString => total(subTotal, deliveryFee).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
