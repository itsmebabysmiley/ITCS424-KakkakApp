import 'package:flutter/material.dart';
import 'package:karkarapp/components/round_button.dart';
import 'package:karkarapp/constaints.dart';
import 'package:karkarapp/screens/login/login.dart';
import 'package:karkarapp/screens/singup/sigup.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              child: Image.asset("assets/images/top_left.png"),
              top: 0,
              left: 0,
              width: size.width * 0.85,
            ),
            Positioned(
              child: Image.asset("assets/images/button_left.png"),
              bottom: 0,
              left: 0,
              width: size.width * 0.85,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'WELCOME TO KARKAR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/logo/karkar_3.png',
                    height: size.height * 0.4,
                  ),
                  RoundedButton(
                      text: 'LOG IN',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInPage()));
                      }),
                  RoundedButton(
                    text: 'SIGN UP',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    color: cPrimary2Color,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
