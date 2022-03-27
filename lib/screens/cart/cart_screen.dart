import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/bloc/cart/cart_bloc.dart';
import 'package:shopify/widgets/cart_product_card.dart';
import 'package:shopify/widgets/custom_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cart"),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(0, 0, 0, 1),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  "GO TO CHECKOUT",
                  style: Theme.of(context).textTheme.headline3,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  state.cart.freedeliveryString,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: const RoundedRectangleBorder(),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  child: Text(
                                    'Add More Items',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          flex: 5,
                          child: ListView.builder(
                            itemCount: state.cart.products!.length,
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                  product: state.cart.products![index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(thickness: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('SUBTOTAL',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                Text('Rs. ${state.cart.subTotalString}',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('DELIVERY FEE',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                Text('Rs. ${state.cart.deliveryFeeString}',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(50),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            color: Colors.black,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('TOTAL',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.white)),
                                  Text('Rs. ${state.cart.totalString}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}
