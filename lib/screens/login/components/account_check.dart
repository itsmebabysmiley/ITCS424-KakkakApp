import 'package:flutter/material.dart';
import 'package:karkarapp/constaints.dart';

// In login sceen, it will show 'Don't have an account? sign up.
// In sigup screen, it will show 'Already have an account? sign in.
class AccountCheck extends StatelessWidget {
  final bool loginPage;
  final VoidCallback onTap;
  const AccountCheck({Key? key, required this.loginPage, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          loginPage? "Don't have an account? " : "Already have an account? ",
          style: const TextStyle(color: cPrimary2Color, fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(loginPage? 'Sign Up' : 'Sign In',
              style: const TextStyle(
                color: cPrimaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              )),
        )
      ],
    );
  }
}
