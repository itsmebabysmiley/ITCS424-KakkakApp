import 'package:flutter/material.dart';
import 'package:karkarapp/constaints.dart';

class SocialIcon extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  const SocialIcon({Key? key, required this.iconPath, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: cSecondaryColor,
          ),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          iconPath,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
