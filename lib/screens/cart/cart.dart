import 'package:flutter/material.dart';
import 'package:karkarapp/components/custom_card.dart';
import 'package:karkarapp/components/divider.dart';
import 'package:karkarapp/components/round_button.dart';
import 'package:karkarapp/constaints.dart';
import 'package:karkarapp/models/products.dart';
import 'package:karkarapp/providers/cart_provider.dart';
import 'package:karkarapp/screens/details_screen/detail.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var _shoppingCart = context.watch<ShoppingCart>();
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CartList(shoppingCart: _shoppingCart),
          const SizedBox(
            height: 10,
          ),
          const XDivider(text: "SUMMARY"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Total price: ',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Consumer<ShoppingCart>(
                  builder: (context, cart, child) => Text(
                    '\$${cart.totalPrice}',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: cFontColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          RoundedButton(
            text: 'BUY NOW',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Buying not supported yet.')));
            },
          ),
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
    required ShoppingCart shoppingCart,
  })  : _shoppingCart = shoppingCart,
        super(key: key);

  final ShoppingCart _shoppingCart;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: List.generate(
        _shoppingCart.cart.length,
        (index) => CardForCartItem(
          product: _shoppingCart.cart[index].item,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(product: _shoppingCart.cart[index].item),
              ),
            );
          },
        ),
      )),
    );
  }
}
