import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/Screens/language_bottom_sheet.dart';
import 'package:naemen/onboarding_screen.dart/onboarding_view.dart';
import 'package:naemen/utils/color_constant.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the fade-in animation after a short delay
    // Timer(Duration(seconds: 1), () {
    //   setState(() {
    //     _opacity = 1.0;
    //   });
    // });

    // Navigate to the next screen after a delay
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LanguageScreen(), // Replace with your home page
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(  
        'assets/images/splash screen2.png',height: double.infinity,
        fit: BoxFit.fill, // Your logo asset
      ),
    );
  }
}
