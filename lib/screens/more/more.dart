import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../welcome/welcome.dart';
import 'components/sections.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  _futureUsed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text('Sorry .·´¯`(>▂<)´¯`·.  Facebook login is under developing'),
      ),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          const SectionNameWithBorderColor(
            title: 'Settings',
          ),
          SubSection(title: 'Profile', onTap: _futureUsed),
          SubSection(
            title: 'Address',
            onTap: _futureUsed,
          ),
          SubSection(
            title: 'Bank Account/Credit card',
            onTap: _futureUsed,
          ),
          const SectionNameWithBorderColor(
            title: 'Helps',
          ),
          SubSection(
            title: 'Help Center',
            onTap: _futureUsed,
          ),
          SubSection(
            title: 'Rules',
            onTap: _futureUsed,
          ),
          SubSection(
            title: 'Privacy of KarKar',
            onTap: _futureUsed,
          ),
          SubSection(
            title: 'About Us',
            onTap: _futureUsed,
          ),
          const SectionNameWithBorderColor(
            title: ' ',
          ),
          SubSection(
            title: 'Sign out',
            onTap: () {
              _signOut();
              Navigator.popUntil(
                    context,
                    ModalRoute.withName('/'),
              );
            },
          ),
        ],
      ),
    );
  }
}
