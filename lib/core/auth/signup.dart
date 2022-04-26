import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup {
  signup(String _name, String _email, String _password,
      BuildContext context) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      User? user = result.user;
      user?.updateDisplayName(_name);
      await FirebaseFirestore.instance
          .collection('users')
          .add({'email': _email, 'imageUrl': '', 'name': _name});
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Completed!'),
                content:
                    const Text('Your account was created, now you can log in'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Ok'))
                ],
              ));
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Sign up failed'),
                content: Text(e.message.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Ok'))
                ],
              ));
    } on Exception {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Error Occured'),
                content: const Text('Please contact developer'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Ok'))
                ],
              ));
    }
  }
}
