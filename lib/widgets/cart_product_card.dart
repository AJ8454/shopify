import 'package:flutter/material.dart';
import 'package:shopify/models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product? product;
  const CartProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product!.imageUrl!,
            width: 100,
            height: 80,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product!.name!,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "Rs. ${product!.price!}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () {},
              ),
              Text(
                '1',
                style: Theme.of(context).textTheme.headline5,
              ),
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
