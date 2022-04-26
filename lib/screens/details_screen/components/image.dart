import 'package:flutter/material.dart';
import 'package:karkarapp/models/products.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey,
              blurRadius: 30,
            )
          ]),
      child: FittedBox(
        child: Image.asset(imagePath),
        fit: BoxFit.fill,
      ),
    );
  }
}
