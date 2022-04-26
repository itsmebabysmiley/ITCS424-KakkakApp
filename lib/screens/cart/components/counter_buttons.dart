import 'package:flutter/material.dart';
import 'package:karkarapp/models/products.dart';
import 'package:karkarapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CouterButton extends StatelessWidget {
  final Product product;
  const CouterButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.read<ShoppingCart>().decrement(product);
            },
            child: const Icon(Icons.remove),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
              '${context.watch<ShoppingCart>().getTotalIemById(product.id)}'),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.read<ShoppingCart>().increment(product);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
