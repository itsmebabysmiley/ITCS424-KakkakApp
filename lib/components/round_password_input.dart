import 'package:flutter/material.dart';
import 'package:karkarapp/constaints.dart';

class PasswordInput extends StatefulWidget {
  
  final TextEditingController passwordController;
  final String text;
  const PasswordInput({Key? key, required this.passwordController, required this.text}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {

  bool _passwordVisible = true;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _passwordController = widget.passwordController;
    return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: cPrimary2Color,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      onChanged: (value){},
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: cPrimaryColor,
                        ),
                        labelText: widget.text,
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        suffixIcon: IconButton(onPressed: (){ setState(() {
                          _passwordVisible = !_passwordVisible;
                        });}, icon: Icon(_passwordVisible? Icons.visibility: Icons.visibility_off,), color: cPrimaryColor,)
                      ),
                    ),
                  );
  }
}