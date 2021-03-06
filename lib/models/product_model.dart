import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? name;
  final String? category;
  final String? imageUrl;
  final double? price;
  final bool? isRecommended;
  final bool? isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: double.parse('${snap['price']}'),
      isPopular: snap['isPopular'],
      isRecommended: snap['isRecommended'],
    );

    return product;
  }

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isPopular,
        isRecommended,
      ];

  static List<Product> products = const [];
  //   Product(
  //     name: "Coca Cola",
  //     category: "Soft Drinks",
  //     imageUrl:
  //         "https://www.conchovalleyhomepage.com/wp-content/uploads/sites/83/2021/12/GettyImages-1005364128.jpg?w=900",
  //     price: 62.05,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   Product(
  //     name: "Sprite",
  //     category: "Soft Drinks",
  //     imageUrl: "https://m.media-amazon.com/images/I/51AniJpRujL._SX522_.jpg",
  //     price: 40.00,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   Product(
  //     name: "Coca Cola",
  //     category: "Soft Drinks",
  //     imageUrl:
  //         "https://www.conchovalleyhomepage.com/wp-content/uploads/sites/83/2021/12/GettyImages-1005364128.jpg?w=900",
  //     price: 62.05,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   Product(
  //     name: "Sprite",
  //     category: "Soft Drinks",
  //     imageUrl: "https://m.media-amazon.com/images/I/51AniJpRujL._SX522_.jpg",
  //     price: 40.00,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   Product(
  //     name: "Lady Finger",
  //     category: "Vegetables",
  //     imageUrl:
  //         "https://images.indianexpress.com/2021/08/bhindi_1200_getty.jpg",
  //     price: 999.99,
  //     isRecommended: true,
  //     isPopular: true,
  //   ),
  //   Product(
  //     name: "Broccoli",
  //     category: "Vegetables",
  //     imageUrl:
  //         "https://miro.medium.com/max/1400/1*0h19diyBx5Ni3LaS2UifCA.jpeg",
  //     price: 40.00,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   Product(
  //     name: " Vest+Short Pants Women Clothes Set",
  //     category: "Clothes",
  //     imageUrl:
  //         "https://i5.walmartimages.com/asr/59bd9054-19cb-471c-8759-1845bc28c296.6d837e9a218778a97b097f011109cbca.jpeg",
  //     price: 650.99,
  //     isRecommended: true,
  //     isPopular: true,
  //   ),
  //   Product(
  //     name: "Jeans & suits",
  //     category: "Clothes",
  //     imageUrl:
  //         "https://www.suitsexpert.com/wp-content/uploads/2020/02/mens-dress-code-types-guide-scaled.jpg",
  //     price: 5500.40,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  // ];
}
