import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:naemen/utils/app_url.dart';
import 'package:naemen/utils/color_constant.dart';
import 'package:naemen/view_models/salon_profile_view_model.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/banner_model.dart';

///--->>> HomePage Slider  <----

class HomePageSlider extends StatefulWidget {
  const HomePageSlider({
    super.key,
    required this.pageController2,
    required this.banners,
  });

  final PageController pageController2;
  final List<BannerModel> banners;

  @override
  State<HomePageSlider> createState() => _HomePageSliderState();
}

class _HomePageSliderState extends State<HomePageSlider> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      child: Column(
        children: [
          SizedBox(
            height: 200.h,
            child: PageView.builder(
              controller: widget.pageController2,
              itemCount: widget.banners.length,
              onPageChanged: (value) {
                currentindex = value;
                setState(() {
                  currentindex;
                });
              },
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.signUpColor,
                    width: 0.5.w,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                  image: DecorationImage(
                    image: NetworkImage(
                        "${AppUrl.baseUrl}/${widget.banners[index].bannerImageUrl}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: widget.pageController2,
              count: widget.banners.length,
              effect: WormEffect(
                activeDotColor: AppColors.primaryColor,
                dotColor: Colors.grey,
                dotHeight: 5.h,
                dotWidth: 5.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//----->>>>ShopPage slider <<<<--------

class ShopPageSlider extends StatefulWidget {
  const ShopPageSlider({
    super.key,
    required this.pageController1,
    required this.banners,
  });

  final PageController pageController1;
  final List<BannerModel> banners;

  @override
  State<ShopPageSlider> createState() => _ShopPageSliderState();
}

class _ShopPageSliderState extends State<ShopPageSlider> {
  int currentindex = 0;
  final SalonProfileViewModel _salonProfileViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.h,
      child: Column(
        children: [
          SizedBox(
            height: 345.h,
            child: PageView.builder(
              controller: widget.pageController1,
              itemCount: widget.banners.length,
              onPageChanged: (value) {
                currentindex = value;
                setState(() {
                  currentindex;
                });
              },
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  image: DecorationImage(
                    image: NetworkImage(
                        "${AppUrl.baseUrl}/${_salonProfileViewModel.getStore.salonImage ?? ""}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: widget.pageController1,
              count: widget.banners.length,
              effect: WormEffect(
                activeDotColor: AppColors.primaryColor,
                dotColor: Colors.grey,
                dotHeight: 5.h,
                dotWidth: 5.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
