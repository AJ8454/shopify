import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/bloc/cart/cart_bloc.dart';
import 'package:shopify/bloc/category/category_bloc.dart';
import 'package:shopify/bloc/checkout/checkout_bloc.dart';
import 'package:shopify/bloc/product/product_bloc.dart';
import 'package:shopify/bloc/wishlist/wishlist_bloc.dart';
import 'package:shopify/config/app_router.dart';
import 'package:shopify/config/theme.dart';
import 'package:shopify/repositories/category/category_repository.dart';
import 'package:shopify/repositories/checkout/checkout_repository.dart';
import 'package:shopify/repositories/product/product_repository.dart';
import 'package:shopify/screens/screens.dart';
import 'package:shopify/simple_bloc_observer.dart';

// video no 20
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartBloc()..add(CartStarted())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                  cartBloc: context.read<CartBloc>(),
                  checkoutRepository: CheckoutRepository(),
                )),
        BlocProvider(create: (context) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(
          create: (context) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProduct()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopify',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
