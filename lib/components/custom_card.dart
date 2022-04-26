import 'package:flutter/material.dart';
import 'package:karkarapp/models/products.dart';
import 'package:karkarapp/providers/cart_provider.dart';
import 'package:karkarapp/components/remove_round_button.dart';
import 'package:karkarapp/screens/cart/components/counter_buttons.dart';
import 'package:provider/provider.dart';
import '../constaints.dart';

class CardItemMedium extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const CardItemMedium({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<ShoppingCart, bool>(
        (cart) => cart.cart.any((element) => element.equals(product)));
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0.1),
                color: Colors.grey,
                blurRadius: 10,
              )
            ]),
        child: SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(product.image),
                    ),
                  ),
                ),
              ),
              Container(
                width: 160,
                height: 100,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          product.name.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            product.city,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const Spacer(),
                          Text(
                            '\$ ${product.price.toString()}',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    color: cFontColor,
                                    fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      AddToCartAndBuyButton(
                        onCartPressed: () {
                          isInCart
                              ? context.read<ShoppingCart>().increment(product)
                              : context.read<ShoppingCart>().addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Added to the cart.'),
                              duration: const Duration(seconds: 1),
                              action: SnackBarAction(
                                label: 'Undo',
                                textColor: Colors.white,
                                onPressed: () {
                                  context
                                      .read<ShoppingCart>()
                                      .removeFromCart(product);
                                },
                              ),
                            ),
                          );
                        },
                        onBuyPressed: () {ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Buying not supported yet.')));},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItemWide extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const CardItemWide({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var isInCart = context.select<ShoppingCart, bool>(
        (cart) => cart.cart.any((element) => element.equals(product)));
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 120,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0.1),
                blurRadius: 20,
                color: Colors.grey.withOpacity(0.9)),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(product.image),
                      ),
                    ),
                  )),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        product.name.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      product.city,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '\$ ${product.price.toString()}',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: cFontColor, fontWeight: FontWeight.bold),
                    ),
                    AddToCartAndBuyButton(
                      onCartPressed: () {
                        isInCart
                              ? context.read<ShoppingCart>().increment(product)
                              : context.read<ShoppingCart>().addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Added to the cart.'),
                              duration: const Duration(seconds: 1),
                              action: SnackBarAction(
                                label: 'Undo',
                                textColor: Colors.white,
                                onPressed: () {
                                  context
                                      .read<ShoppingCart>()
                                      .removeFromCart(product);
                                },
                              ),
                            ),
                          );
                      },
                      onBuyPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class CardForCartItem extends StatelessWidget {
  final Product product;
  //* if you want to make your card can tap, you can wrap the container with any detector you want.
  final VoidCallback onTap;

  const CardForCartItem({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 120,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0.1),
                blurRadius: 20,
                color: Colors.grey.withOpacity(0.9)),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(product.image),
                      ),
                    ),
                  )),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        product.name.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      product.city,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '\$ ${product.price.toString()}',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: cFontColor, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        CouterButton(
                          product: product,
                        ),
                        const Spacer(),
                        RemoveRoundButton(
                          onTap: () {
                            context
                                .read<ShoppingCart>()
                                .removeFromCart(product);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/***
 * Row(
                      children: <Widget>[
                        CouterButton(
                          product: product,
                        ),
                        const Spacer(),
                        RemoveRoundButton(
                          onTap: () {
                            context
                                .read<ShoppingCart>()
                                .removeFromCart(product);
                          },
                        )
                      ],
                    ),
 */

class AddToCartAndBuyButton extends StatelessWidget {
  final VoidCallback onCartPressed;
  final VoidCallback onBuyPressed;
  const AddToCartAndBuyButton({
    Key? key,
    required this.onCartPressed,
    required this.onBuyPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: onCartPressed,
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            )),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          onPressed: onBuyPressed,
          child: Text(
            'BUY',
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}