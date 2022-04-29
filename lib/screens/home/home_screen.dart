import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/bloc/category/category_bloc.dart';
import 'package:shopify/bloc/product/product_bloc.dart';
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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      autoPlay: true,
                    ),
                    items: state.categories
                        .map(
                          (category) => HeroCarouselCard(
                            category: category,
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return const Text('Something is went wrong');
                }
              },
            ),
            const SectionTitle(title: "RECOMMENDED"),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((product) => product.isRecommended!)
                        .toList(),
                  );
                } else {
                  return const Text('Something is went wrong');
                }
              },
            ),
            const SectionTitle(title: "MOST POPULAR"),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products
                        .where((product) => product.isPopular!)
                        .toList(),
                  );
                } else {
                  return const Text('Something is went wrong');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
