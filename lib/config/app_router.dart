import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopify/models/models.dart';
import 'package:shopify/screens/cart/cart_screen.dart';
import 'package:shopify/screens/catalog/catalog_screen.dart';
import 'package:shopify/screens/checkout/checkout_screen.dart';
import 'package:shopify/screens/home/home_screen.dart';
import 'package:shopify/screens/product/product_screen.dart';
import 'package:shopify/screens/splash/splash_screen.dart';
import 'package:shopify/screens/wishlist/wishlist_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    log("This is route: ${settings.name}");

    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishListScreen.routeName:
        return WishListScreen.route();
       case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
