import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naemen/routes/app_routes.dart';

import '../../view_models/auth_view_model.dart';
import '../../utils/color_constant.dart';
import '../../view_models/google_map_view_model.dart';
import '../components/text_heading.dart';

class LoginPasswordView extends StatelessWidget {
  const LoginPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Get.find();
    final GoogleMapViewModel googleMapViewModel = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sign up bg2.jpg"),
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
                      height: 180.h,
                    ),
                    Image.asset(
                      "assets/images/new_new_new_logo.png",
                      height: 136,
                      width: 1360,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextHeading(
                        title: "Enter Password",
                        fontweight: FontWeight.w700,
                        fontsize: 26.sp,
                        fontcolor: AppColors.primaryColor),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextHeading(
                        title: "Please enter password to continue our app",
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontcolor: AppColors.signUpColor),
                    SizedBox(
                      height: 20.h,
                    ),
                    Form(
                      key: authViewModel.getLoginPasswordFormKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Obx(
                            () => TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: authViewModel.getPasswordController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  color: AppColors.signUpColor,
                                  fontWeight: FontWeight.w300,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () =>
                                      authViewModel.togglePasswordVisibility(),
                                  icon: Icon(
                                    authViewModel.getObscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1.0),
                                ),
                                // filled: true,
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
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 85.h,
                    ),
                    Obx(
                      () => authViewModel.getIsLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                          : InkWell(
                              onTap: () => authViewModel
                                  .onPasswordLogin(googleMapViewModel),
                              child: Container(
                                height: 40.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Center(
                                  child: TextHeading(
                                      title: "Sign in",
                                      fontweight: FontWeight.w600,
                                      fontsize: 16.sp,
                                      fontcolor: Colors.white),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Obx(
                      () => authViewModel.getIsLoading
                          ? const SizedBox()
                          : InkWell(
                              onTap: () {
                                authViewModel.onResendOTP();
                                Get.offNamed(Routes.loginOtpRoute);
                              },
                              child: TextHeading(
                                title: "Login by OTP",
                                fontweight: FontWeight.w500,
                                fontsize: 14.sp,
                                fontcolor: AppColors.primaryColor,
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
