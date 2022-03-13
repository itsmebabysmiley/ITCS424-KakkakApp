import 'package:flutter/material.dart';

class SectionNameWithBorderColor extends StatelessWidget {
  final String title;
  const SectionNameWithBorderColor({
    Key? key, required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 30,
      width: size.width,
      padding: const EdgeInsets.only(left: 10, bottom: 5, top: 5),
      decoration:  BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}

class SubSection extends StatelessWidget {
  final String title;
  const SubSection({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('This feature is under developing'),
                          ),
                        );},
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 10),
            decoration:  BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey.shade300))
            ),
            child: Row(
              children: <Widget>[
                Text(title),
                const Spacer(),
                const Icon(Icons.navigate_next)
              ],
            ),
          ),
        ),
      ],
    );
  }
}