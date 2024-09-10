import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/color_constant.dart';
import '../../view_models/auth_view_model.dart';
import '../../view_models/google_map_view_model.dart';
import '../components/text_heading.dart';

class VerifyMobileView extends StatelessWidget {
  const VerifyMobileView({super.key});

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
                      fit: BoxFit.cover))),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200.h,
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
                        title: "Verify Mobile",
                        fontweight: FontWeight.w700,
                        fontsize: 26.sp,
                        fontcolor: AppColors.primaryColor),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextHeading(
                        title: "Enter mobile number to continue our app",
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontcolor: AppColors.signUpColor),
                    SizedBox(
                      height: 20.h,
                    ),
                    Form(
                      key: authViewModel.getVerifyMobileFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: authViewModel.getMobileController,

                            decoration: InputDecoration(
                              counterText: "",
                              contentPadding: EdgeInsets.all(8),
                              hintText: "Enter mobile number",
                              hintStyle: TextStyle(
                                  color: AppColors.signUpColor,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                    color: AppColors.primaryColor, width: 1.0),
                              ), //filled: true,
                              fillColor: Colors.black.withOpacity(0.8),
                            ),

                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            // obscureText: ,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Obx(
                      () => authViewModel.getIsLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                          : InkWell(
                              onTap: () => authViewModel.onMobileVerifyClick(),
                              child: Container(
                                height: 40.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: TextHeading(
                                    title: "Verify Mobile",
                                    fontweight: FontWeight.w600,
                                    fontsize: 16.sp,
                                    fontcolor: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () =>
                          authViewModel.fetchLocation(googleMapViewModel),
                      child: TextHeading(
                        title: "Skip",
                        fontweight: FontWeight.w500,
                        fontsize: 14.sp,
                        fontcolor: AppColors.primaryColor,
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
