import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Auth/login_page.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/utils/color_constant.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  final String language;

  const OnboardingScreen(
      {super.key, required this.language, required String selectedLanguage});
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/pageviewImage1.jpeg',
      'title': 'Live Booking',
      'description':
          'Instantly schedule appointments with your favorite salon artists in real-time, no matter where you are.'
    },
    {
      'image': 'assets/images/Page2.jpeg',
      'title': 'Location- based Search',
      'description':
          'Easily find nearby salons, spas, and barbers within a 500m radius based on your current location.'
    },
    {
      'image': 'assets/images/page3.jpeg',
      'title': '   Rating and Review\n          System',
      'description':
          'Read reviews and ratings from other customers to make informed decisions about which salon or artist to book with.'
    },
    {
      'image': 'assets/images/page4.jpeg',
      'title': 'Blog Integration',
      'description':
          'Stay up-to-date with the latest salon tips, trends, and advice through integrated blog con'
    },
    {
      'image': 'assets/images/page5.jpeg',
      'title': 'Gift Coupons',
      'description':
          'Share the joy of salon experiences with your loved ones by purchasing and gifting coupons directly through the app.'
    },
    {
      'image': 'assets/images/page6.jpeg',
      'title': 'Skill Match',
      'description':
          'If your preferred artist is unavailable, discover other skilled artists with similar ratings and expertise to ensure you receive top-quality service.'
    },
  ];

  void _skipOnboarding() {
    // Handle the skip button press, navigate to the main screen
    print("Skip button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  image: _onboardingData[index]['image']!,
                  title: _onboardingData[index]['title']!,
                  description: _onboardingData[index]['description']!,
                  pageController: _pageController, // Pass the PageController
                  pageCount:
                      _onboardingData.length, // Pass the total page count
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

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.pageController,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
          ),
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
                Spacer(),
                TextHeading(
                    title: title,
                    fontweight: FontWeight.w700,
                    fontsize: 25.h,
                    fontcolor: AppColors.primarycolor),
                SizedBox(height: 10),
                TextHeading(
                    title: description,
                    fontweight: FontWeight.w400,
                    fontsize: 12.sp,
                    fontcolor: Colors.white),
                SizedBox(height: 20),
                SmoothPageIndicator(
                  controller: pageController, // Use the correct page controller
                  count: pageCount, // Total number of pages
                  effect: WormEffect(
                    dotWidth: 8.0,
                    dotHeight: 8.0,
                    activeDotColor: AppColors.primarycolor,
                    dotColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()));
                    },
                    child: TextHeading(
                        title: "Skip",
                        fontweight: FontWeight.w500,
                        fontsize: 12.sp,
                        fontcolor: AppColors.primarycolor)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
