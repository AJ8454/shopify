import 'package:flutter/material.dart';
import 'package:shopify/models/models.dart';
import 'package:shopify/widgets/custom_appbar.dart';
import 'package:shopify/widgets/custom_navbar.dart';
import 'package:shopify/widgets/product_card.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  static const routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((prod) => prod.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: const CustomNavigationBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          childAspectRatio: 1.15,
        ),
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductCard(
              product: categoryProducts[index],
              widthFactor: 2.2,
            ),
          );
        },
      ),
    );
  }
}
