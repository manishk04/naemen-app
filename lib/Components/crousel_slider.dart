import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/utils/color_constant.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomePageSlider extends StatefulWidget { 
  const HomePageSlider({
    super.key,
    required this.pageController1,
    required this.tradingimages,
  });

  final PageController pageController1;
  final List tradingimages;

  @override
  State<HomePageSlider> createState() =>
      _HomePageSliderState();
}

class _HomePageSliderState extends State<HomePageSlider> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 200.h,
            child: PageView.builder(
                controller: widget.pageController1,
                itemCount: widget.tradingimages.length,
                onPageChanged: (value) {
                  currentindex = value;
                  setState(() {
                    currentindex;
                  });
                },
                itemBuilder: (context, index) => Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/crouselImage.png"),
                              fit: BoxFit.cover)),
                     
                    ))),
        SizedBox(
          height: 5.h,
        ),
        Center(
          child: SmoothPageIndicator(
            controller: widget.pageController1,
            count: widget.tradingimages.length,
            effect: WormEffect(
                activeDotColor: AppColors.primarycolor,
                dotColor: Colors.grey,dotHeight: 5.h, dotWidth: 5.w),
          ),
        ),
      ],
    );
  }
}