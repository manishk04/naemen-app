import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/color_constant.dart';
import '../../view_models/auth_view_model.dart';
import '../components/text_heading.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_image.png"),
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
                    SizedBox(height: 80.h),
                    Image.asset(
                      "assets/images/Namen Logo (1).png",
                      height: 136,
                      width: 136,
                    ),
                    SizedBox(height: 12.h),
                    TextHeading(
                      title: "Sign up now",
                      fontweight: FontWeight.w700,
                      fontsize: 26.sp,
                      fontcolor: AppColors.primarycolor,
                    ),
                    SizedBox(height: 10.h),
                    TextHeading(
                      title: "Please sign up to continue our app",
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontcolor: AppColors.SignupColor,
                    ),
                    SizedBox(height: 20.h),
                    Form(
                      key: authViewModel.getSignUpFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: authViewModel.getFullNameController,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              hintText: "Enter full name",
                              hintStyle:
                                  TextStyle(color: AppColors.SignupColor),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: authViewModel.getEmailController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              hintText: "Enter email",
                              hintStyle:
                                  TextStyle(color: AppColors.SignupColor),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.8),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            enabled: false,
                            style: TextStyle(color: Colors.white),
                            controller: authViewModel.getMobileController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              hintText: "Enter mobile number",
                              hintStyle: TextStyle(
                                  color: const Color.fromARGB(255, 1, 0, 0)),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.8),
                              counterText: "",
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your mobile number';
                              }
                              if (!RegExp(r'^\+?[0-9]{10,15}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid mobile number';
                              }
                              return null;
                            },
                            maxLength: 10,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: authViewModel.getDOBController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              hintText: "Enter date of birth",
                              hintStyle:
                                  TextStyle(color: AppColors.SignupColor),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.8),
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            inputFormatters: [DateInputFormatter()],
                            readOnly: true,
                            onTap: () => authViewModel.selectDate(context),
                            keyboardType: TextInputType.datetime,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your date of birth';
                              }
                              if (!RegExp(
                                      r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-\d{4}$')
                                  .hasMatch(value)) {
                                // if (!RegExp(r'^\d{2}/\d{2}/\d{4}$')
                                //     .hasMatch(value)) {
                                return 'Please enter a valid date (DD-MM-YYYY)';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          Obx(
                            () => TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: authViewModel.getPasswordController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                hintText: 'Create password',
                                hintStyle:
                                    TextStyle(color: AppColors.SignupColor),
                                suffixIcon: IconButton(
                                  onPressed:
                                      authViewModel.togglePasswordVisibility,
                                  icon: Icon(
                                    authViewModel.getObscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                border: const OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.8),
                              ),
                              obscureText: authViewModel.getObscureText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 85.h),
                    InkWell(
                      onTap: () => authViewModel.onSignUp(),
                      child: Container(
                        height: 40.h,
                        width: 340.w,
                        decoration: BoxDecoration(
                          color: AppColors.primarycolor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: TextHeading(
                            title: "Sign up",
                            fontweight: FontWeight.w600,
                            fontsize: 16.sp,
                            fontcolor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextHeading(
                          title: "Already have an account?",
                          fontweight: FontWeight.w400,
                          fontsize: 12.sp,
                          fontcolor: AppColors.SignupColor,
                        ),
                        SizedBox(width: 3.w),
                        InkWell(
                          onTap: () => Get.back(),
                          child: TextHeading(
                            title: "Sign in",
                            fontweight: FontWeight.w400,
                            fontsize: 12.sp,
                            fontcolor: AppColors.primarycolor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.length == 2 || text.length == 5) {
      return TextEditingValue(
        text: '$text-',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    }
    return newValue;
  }
}
