import 'package:flutter/material.dart';
import 'package:karkarapp/constaints.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color, textColor;
  const RoundedButton({ Key? key, required this.text, required this.onPressed, this.color = cPrimaryColor, this.textColor = Colors.white }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: size.width*0.6,
                    child : ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: ElevatedButton(
                        onPressed: onPressed,
                        child: Text(
                          text,
                          style: TextStyle(color: textColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: color,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          textStyle: TextStyle(
                            color: textColor, fontSize: 14,
                          )
                        ),
                      ),
                      
                    ),
                  );
  }
}