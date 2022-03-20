import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopify/models/models.dart';
import 'package:shopify/widgets/custom_appbar.dart';
import 'package:shopify/widgets/custom_navbar.dart';
import 'package:shopify/widgets/hero_carousel_card.dart';
import 'package:shopify/widgets/product_carousel.dart';
import 'package:shopify/widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Shopify"),
      bottomNavigationBar: const CustomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
              ),
              items: Category.categories
                  .map(
                    (category) => HeroCarouselCard(
                      category: category,
                    ),
                  )
                  .toList(),
            ),
            const SectionTitle(title: "RECOMMENDED"),
            ProductCarousel(
              products: Product.products
                  .where((product) => product.isRecommended!)
                  .toList(),
            ),
            const SectionTitle(title: "Most POPULAR"),
            ProductCarousel(
              products: Product.products
                  .where((product) => product.isPopular!)
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
