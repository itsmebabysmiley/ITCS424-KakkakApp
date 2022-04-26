import 'package:flutter/material.dart';
import 'package:karkarapp/components/custom_bold_underline_text.dart';

class Description extends StatelessWidget {
  final String description;
  const Description({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey,
              blurRadius: 30,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const CustomBUText(text: "Description"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              description,
              style: const TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
