import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constaints.dart';

class Reviews extends StatelessWidget {
  final String name, message;
  final double rating;
  const Reviews({
    Key? key,
    required this.name,
    required this.message,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: cPrimary2Color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0.1),
              color: cSecondaryColor,
              blurRadius: 20,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/man.png',
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$name\n',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '$message',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 35),
            child: Row(
              children: <Widget>[
                RatingBar(
                    initialRating: rating,
                    itemCount: 5,
                    itemSize: 15,
                    ratingWidget: RatingWidget(
                        full: Icon(
                          Icons.star_rate,
                          color: Colors.amber,
                          size: 15,
                        ),
                        half: Icon(
                          Icons.star_half,
                          color: Colors.amber,
                          size: 15,
                        ),
                        empty: Icon(
                          Icons.star_rate,
                          size: 15,
                        )),
                    onRatingUpdate: (_) {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}
