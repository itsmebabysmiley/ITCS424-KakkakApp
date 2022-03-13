import 'package:flutter/material.dart';
import 'package:karkarapp/constaints.dart';

class CustomBUText extends StatelessWidget {
  final String text;
  const CustomBUText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline6?.copyWith(color: cPrimaryColor, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 5),
              height: 3,
              color: cPrimaryColor.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

/// If you want to add more field in headline, you can add it in Row() e.g button.
class CustomHeadline extends StatelessWidget {
  final String title;
  const CustomHeadline({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          CustomBUText(text: title),
          //* add more child here.
        ],
      ),
    );
  }
}
