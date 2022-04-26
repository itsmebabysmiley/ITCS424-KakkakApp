import 'package:flutter/material.dart';
import 'package:karkarapp/components/divider.dart';
import 'package:karkarapp/components/round_button.dart';
import 'package:karkarapp/components/round_input.dart';
import 'package:karkarapp/components/round_password_input.dart';
import 'package:karkarapp/core/auth/login.dart';
import 'package:karkarapp/core/auth/signup.dart';
import 'package:karkarapp/screens/login/components/account_check.dart';
import 'package:karkarapp/screens/login/components/social_button.dart';
import 'package:karkarapp/screens/login/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final Signup sigup = Signup();
  final Login login = Login();

  bool _loading = false; //prevent user spam the signup button.
  void isLoading(bool staus) {
    setState(() {
      _loading = staus;
    });
  }

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
              child: Image.asset("assets/images/top_left_2.png"),
              top: 0,
              left: 0,
              width: size.width,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'SIGN UP',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/logo/signup_logo.png',
                    height: size.height * 0.2,
                  ),
                  RoundInput(
                    text: 'Name',
                    controller: _nameController,
                    onChanged: (value) {},
                  ),
                  RoundInput(
                    text: 'Email',
                    icon: Icons.mail,
                    controller: _emailController,
                    onChanged: (value) {},
                  ),
                  PasswordInput(
                      passwordController: _passwordController,
                      text: 'Password'),
                  PasswordInput(
                      passwordController: _confirmPasswordController,
                      text: 'ConfirmPassword'),
                  if (!_loading)
                    RoundedButton(
                      text: 'SIGNUP',
                      onPressed: () async {
                        String? tempText;
                        if (_nameController.text.trim().isEmpty) {
                          tempText = 'Name can\'t be empty.';
                        } else if (_emailController.text.trim().isEmpty) {
                          tempText = 'Email can\'t be empty.';
                        } else if (_passwordController.text.trim().isEmpty) {
                          tempText = 'Password can\'t be empty.';
                        } else if (_confirmPasswordController.text.isNotEmpty) {
                          if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            tempText = 'Password does not match';
                          }
                        }
                        if (tempText != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(tempText),
                            ),
                          );
                          return;
                        } else {
                          isLoading(true);
                          await sigup.signup(
                              _nameController.text,
                              _emailController.text,
                              _passwordController.text,
                              context);
                          isLoading(false);
                        }
                      },
                    ),
                  if (_loading)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  const XDivider(text: 'OR'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        iconPath: "assets/icons/facebook.png",
                        onTap: () async {
                          isLoading(true);
                          await login.signInWithFacebook(context);
                          isLoading(false);
                        },
                      ),
                      SocialIcon(
                        iconPath: "assets/icons/google.png",
                        onTap: () async {
                          isLoading(true);
                          await login.signInWithGoogle(context);
                          isLoading(false);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AccountCheck(
                      loginPage: false,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInPage()));
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
