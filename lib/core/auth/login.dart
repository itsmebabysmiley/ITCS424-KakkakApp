import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:karkarapp/screens/home/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login {
  Future singInWithEmail(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      _isLoginFailed(context, e);
    } on Exception {
      _isErrorOccured(context);
    }
  }

  Future signInWithFacebook(BuildContext context) async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Sign in into Firebase
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      final userData = await FacebookAuth.instance.getUserData();


      // Update user photoURL, since it's Facebook, not Google. 
      final User user = FirebaseAuth.instance.currentUser!;
      await user.updatePhotoURL(userData['picture']['data']['url']);

      // If success log in, route to homepage.
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      _isLoginFailed(context, e);
    } on Exception {
      _isErrorOccured(context);
    }
  }

  Future signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Sign in into Firebase
      await FirebaseAuth.instance.signInWithCredential(credential);


      // If success log in, route to homepage.
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      _isLoginFailed(context, e);
    } on Exception {
      _isErrorOccured(context);
    }
  }

  Future<dynamic> _isLoginFailed(
      BuildContext context, FirebaseAuthException e) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log in failed'),
          content: Text(e.message.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'))
          ],
        );
      },
    );
  }

  Future<dynamic> _isErrorOccured(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error Occurred'),
          content: const Text('Please contact develop.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'))
          ],
        );
      },
    );
  }
}
