import 'package:flutter/material.dart';
import 'package:karkarapp/constaints.dart';

class ProductName extends StatelessWidget {
  const ProductName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 30,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: name,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ]),
      ),
    );
  }
}