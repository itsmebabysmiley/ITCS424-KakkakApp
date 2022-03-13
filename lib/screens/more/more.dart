import 'package:flutter/material.dart';

import 'components/sections.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: const <Widget>[
          SectionNameWithBorderColor(title: 'Settings',),
          SubSection(title: 'Profile',),
          SubSection(title: 'Address',),
          SubSection(title: 'Bank Account/Credit card',),
          SectionNameWithBorderColor(title: 'Helps',),
          SubSection(title: 'Help Center',),
          SubSection(title: 'Rules',),
          SubSection(title: 'Privacy of KarKar',),
          SubSection(title: 'About Us',),
        ],
      ),
    );
  }
}




