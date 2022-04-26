import 'package:flutter/material.dart';
import 'package:karkarapp/constaints.dart';

class XDivider extends StatelessWidget {
  final String text;
  const XDivider({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Divider(
              color: Color(0xFF6B6B6B),
              height: 1,
              thickness: 0.7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: const TextStyle(
                  color: cPrimaryColor, fontWeight: FontWeight.w500),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Color(0xFF6B6B6B),
              height: 1,
              thickness: 0.7,
            ),
          ),
        ],
      ),
    );
  }
}
