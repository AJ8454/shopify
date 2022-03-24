import 'package:equatable/equatable.dart';
import 'package:shopify/models/product_model.dart';

class Cart extends Equatable {
  const Cart();

  double get subTotal =>
      products.fold(0, (total, current) => total + current.price!);

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

  final List<Product> products = const [
    Product(
      name: "Coca Cola",
      category: "Soft Drinks",
      imageUrl:
          "https://www.conchovalleyhomepage.com/wp-content/uploads/sites/83/2021/12/GettyImages-1005364128.jpg?w=900",
      price: 62.05,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: "Sprite",
      category: "Soft Drinks",
      imageUrl: "https://m.media-amazon.com/images/I/51AniJpRujL._SX522_.jpg",
      price: 40.00,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: "Coca Cola",
      category: "Soft Drinks",
      imageUrl:
          "https://www.conchovalleyhomepage.com/wp-content/uploads/sites/83/2021/12/GettyImages-1005364128.jpg?w=900",
      price: 62.05,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: "Sprite",
      category: "Soft Drinks",
      imageUrl: "https://m.media-amazon.com/images/I/51AniJpRujL._SX522_.jpg",
      price: 40.00,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      name: "Lady Finger",
      category: "Vegetables",
      imageUrl:
          "https://images.indianexpress.com/2021/08/bhindi_1200_getty.jpg",
      price: 999.99,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: "Broccoli",
      category: "Vegetables",
      imageUrl:
          "https://miro.medium.com/max/1400/1*0h19diyBx5Ni3LaS2UifCA.jpeg",
      price: 40.00,
      isRecommended: true,
      isPopular: false,
    ),
    // Product(
    //   name: " Vest+Short Pants Women Clothes Set",
    //   category: "Clothes",
    //   imageUrl:
    //       "https://i5.walmartimages.com/asr/59bd9054-19cb-471c-8759-1845bc28c296.6d837e9a218778a97b097f011109cbca.jpeg",
    //   price: 650.99,
    //   isRecommended: true,
    //   isPopular: true,
    // ),
    // Product(
    //   name: "Jeans & suits",
    //   category: "Clothes",
    //   imageUrl:
    //       "https://www.suitsexpert.com/wp-content/uploads/2020/02/mens-dress-code-types-guide-scaled.jpg",
    //   price: 5500.40,
    //   isRecommended: true,
    //   isPopular: false,
    // ),
  ];

  @override
  List<Object?> get props => [];
}
