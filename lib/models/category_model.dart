import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String? name;
  final String? imageUrl;
  const Category({
    this.name,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static Category formSnapShot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = const [
    Category(
      name: "Soft Drinks",
      imageUrl:
          'https://s3.envato.com/files/258387244/SOFT_DRINK_BOTTLE_001.jpg',
    ),
    Category(
      name: "Vegetables",
      imageUrl:
          'https://img.etimg.com/thumb/msid-88726659,width-650,imgsize-490222,,resizemode-4,quality-100/veggies_think.jpg',
    ),
    Category(
      name: "Snacks",
      imageUrl:
          'https://foodro.in/media/category//category-16160702352006.jpeg',
    ),
    Category(
      name: "Clothes",
      imageUrl:
          'https://www.cleveland.com/resizer/NGi80baipeV5iGac8nZ98-_4JuM=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/55U4D5EBFFCGPNCQJEXMBQ7LOM.jpg',
    ),
  ];
}
