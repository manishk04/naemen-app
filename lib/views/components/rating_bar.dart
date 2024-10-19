import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:naemen/utils/color_constant.dart';

class BasicRevieq extends StatefulWidget {
  const BasicRevieq({Key? key}) : super(key: key);

  @override
  State<BasicRevieq> createState() => _BasicRevieqState();
}

class _BasicRevieqState extends State<BasicRevieq> {
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
                unSelectedColor: AppColors.primaryColor,
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
