import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../utils/color_constant.dart';
import '../../view_models/auth_view_model.dart';
import '../components/text_heading.dart';

class LoginOtpView extends StatelessWidget {
  const LoginOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = Get.find();
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_image.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
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
                    Form(
                      key: authViewModel.getLoginOTPFormKey,
                      child: Pinput(
                        controller: authViewModel.getOTPController,
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            border: Border.all(color: AppColors.primarycolor),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter OTP!";
                          } else if (value.length < 6) {
                            return "Please enter a valid OTP!";
                          }
                          return null;
                        },
                        onCompleted: (pin) => debugPrint(pin),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Obx(
                      () => authViewModel.getIsLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primarycolor,
                              ),
                            )
                          : InkWell(
                              onTap: () => authViewModel.onOTPLogin(),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => authViewModel.getIsLoading
                          ? const SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextHeading(
                                  title: "OTP not received?",
                                  fontweight: FontWeight.w500,
                                  fontsize: 12.sp,
                                  fontcolor: AppColors.SignupColor,
                                ),
                                SizedBox(width: 5.w),
                                InkWell(
                                  onTap: () => authViewModel.onResendOTP(),
                                  child: TextHeading(
                                    title: "Resend OTP",
                                    fontweight: FontWeight.w600,
                                    fontsize: 12.sp,
                                    fontcolor: AppColors.primarycolor,
                                  ),
                                ),
                              ],
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
