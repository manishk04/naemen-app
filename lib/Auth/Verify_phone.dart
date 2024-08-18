import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/Screens/bottom_bar.dart';
import 'package:naemen/Screens/home_page.dart';
import 'package:naemen/utils/color_constant.dart';

import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: TextStyle(
        fontSize: 22.sp,
        color: Colors.white, // Set the text color to black
      ),
      decoration: BoxDecoration(
        color: AppColors.SearchfieldsColor, // Set the background color to white
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.SignupColor),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sign up bg2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                    Image.asset(
                      "assets/images/Namen Logo (1).png",
                      height: 136,
                      width: 1360,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextHeading(
                      title: "Verify Phone",
                      fontweight: FontWeight.w700,
                      fontsize: 26.sp,
                      fontcolor: AppColors.primarycolor,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            TextHeading(
                              title: "By signup, you’re agree to our",
                              fontweight: FontWeight.w500,
                              fontsize: 12.sp,
                              fontcolor: AppColors.SignupColor,
                            ),
                            TextHeading(
                              title: "Terms & Condition",
                              fontweight: FontWeight.w600,
                              fontsize: 12.sp,
                              fontcolor: AppColors.primarycolor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Pinput(
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: AppColors.primarycolor),
                        ),
                      ),
                      onCompleted: (pin) => debugPrint(pin),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(address: '',)));
                      },
                      child: Container(
                        height: 40.h,
                        width: 340.w,
                        decoration: BoxDecoration(
                          color: AppColors.primarycolor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: TextHeading(
                            title: "Submit",
                            fontweight: FontWeight.w600,
                            fontsize: 16.sp,
                            fontcolor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
