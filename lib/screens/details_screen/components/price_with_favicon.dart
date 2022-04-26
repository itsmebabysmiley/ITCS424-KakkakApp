import 'package:flutter/material.dart';

import '../../../constaints.dart';

class PriceWithFavIcon extends StatefulWidget {
  final double price;
  const PriceWithFavIcon({
    Key? key, required this.price,
  }) : super(key: key);

  @override
  State<PriceWithFavIcon> createState() => _PriceWithFavIconState();
}

class _PriceWithFavIconState extends State<PriceWithFavIcon> {
  bool _isFav = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                  text: '\$ ',
                  style: TextStyle(
                    color: cFontColor,
                    fontSize: 20,
                  )),
              TextSpan(
                text: '${widget.price.toString()}',
                style: const TextStyle(
                    color: cFontColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: ()=> setState(() {
            _isFav = !_isFav;
          }),
          icon: _isFav? Icon(Icons.favorite, color: Colors.red.shade600,) : const Icon(Icons.favorite_border),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}