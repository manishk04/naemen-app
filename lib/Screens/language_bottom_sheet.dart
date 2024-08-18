import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Components/text_heading.dart';
import 'dart:async';
import 'package:naemen/onboarding_screen.dart/onboarding_view.dart';
import 'package:naemen/utils/color_constant.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the fade-in animation after a short delay
    Timer(Duration(), () {
      _showLanguageBottomSheet();
    });
  }

  void _showLanguageBottomSheet() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return LanguageBottomSheet(
          onLanguageSelected: (selectedLanguage) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => OnboardingScreen(
                  language: selectedLanguage,
                  selectedLanguage: '',
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black87.withOpacity(0.5)),
      ),
    );
  }
}

class LanguageBottomSheet extends StatefulWidget {
  final Function(String) onLanguageSelected;

  LanguageBottomSheet({required this.onLanguageSelected});

  @override
  _LanguageBottomSheetState createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  String _selectedLanguage = 'English'; // Default selected language

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 200.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          TextHeading(
            title: "Choose Language",
            fontweight: FontWeight.w600,
            fontsize: 12.sp,
            fontcolor: Colors.black,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  widget.onLanguageSelected('English');
                },
                child: Container(
                  height: 100.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.primarycolor, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35.h,
                        width: 55.w,
                        color: Colors.white,
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/images/English_language.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextHeading(
                        title: "English",
                        fontweight: FontWeight.w600,
                        fontsize: 10.sp,
                        fontcolor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.onLanguageSelected('عربي');
                },
                child: Container(
                  height: 100.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.primarycolor, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35.h,
                        width: 55.w,
                        color: Colors.white,
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/images/arabic--removebg-preview.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextHeading(
                        title: "عربي",
                        fontweight: FontWeight.w600,
                        fontsize: 10.sp,
                        fontcolor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
