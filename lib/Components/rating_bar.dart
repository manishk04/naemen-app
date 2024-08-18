import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';

class BasicExample extends StatefulWidget {
  const BasicExample({Key? key}) : super(key: key);

  @override
  State<BasicExample> createState() => _BasicExampleState();
}

class _BasicExampleState extends State<BasicExample> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PannableRatingBar(
            rate: rating,
            spacing: 5,
            items: List.generate(
              5,
              (index) => const RatingWidget(
                // selectedColor: Colors.yellow,
                unSelectedColor: Colors.yellow,
                child: Icon(
                  Icons.star,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
