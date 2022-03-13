import 'package:flutter/material.dart';
import 'package:karkarapp/constaints.dart';

class RoundInput extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundInput({
    Key? key,
    required this.text,
    this.icon = Icons.person,
    required this.controller,
    required this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return Theme(
      data: themeData.copyWith(
          inputDecorationTheme: themeData.inputDecorationTheme.copyWith(
        prefixIconColor:
            MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return Colors.grey;
          }
          if (states.contains(MaterialState.error)) {
            return Colors.red;
          }
          return cPrimaryColor;
        }),
      )),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: cPrimary2Color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
            ),
            labelText: text,
            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
