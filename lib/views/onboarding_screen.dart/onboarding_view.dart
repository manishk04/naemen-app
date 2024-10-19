import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/onboarding_model.dart';
import '../../utils/app_url.dart';
import '../../utils/color_constant.dart';
import '../../view_models/language_view_model.dart';
import '../../view_models/onboarding_view_model.dart';
import '../components/text_heading.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final OnboardingViewModel onboardingViewModel = Get.find();
    final LanguageViewModel languageViewModel = Get.find();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingViewModel.getOnboardingList.length,
              itemBuilder: (context, index) {
                OnboardingModel data =
                    onboardingViewModel.getOnboardingList[index];
                return OnboardingPage(
                  image: data.bgImage ?? "",
                  title: languageViewModel.getSelectedLanguage == "English"
                      ? data.titleEng ?? ""
                      : data.titleArb ?? "",
                  description:
                      languageViewModel.getSelectedLanguage == "English"
                          ? data.shortDescriptionEng ?? ""
                          : data.shortDescriptionArb ?? "",
                  pageController: pageController, // Pass the PageController
                  pageCount: onboardingViewModel
                      .getOnboardingList.length, // Pass the total page count
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final PageController pageController;
  final int pageCount;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.pageController,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    final OnboardingViewModel onboardingViewModel = Get.find();
    return Stack(
      children: [
        CachedNetworkImage(
          height: double.infinity,
          width: double.infinity,
          imageUrl: "${AppUrl.baseUrl}/$image",
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
        Container(
          color:
              Colors.black.withOpacity(0.5), // Adds a semi-transparent overlay
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                TextHeading(
                    title: title,
                    fontweight: FontWeight.w700,
                    fontsize: 25.h,
                    fontcolor: AppColors.primaryColor),
                const SizedBox(height: 10),
                TextHeading(
                    title: description,
                    fontweight: FontWeight.w400,
                    fontsize: 12.sp,
                    fontcolor: Colors.white),
                const SizedBox(height: 20),
                SmoothPageIndicator(
                  controller: pageController, // Use the correct page controller
                  count: pageCount, // Total number of pages
                  effect: const WormEffect(
                    dotWidth: 8.0,
                    dotHeight: 8.0,
                    activeDotColor: AppColors.primaryColor,
                    dotColor: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => onboardingViewModel.skipOnboarding(),
                  child: TextHeading(
                    title: "Skip",
                    fontweight: FontWeight.w500,
                    fontsize: 12.sp,
                    fontcolor: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
