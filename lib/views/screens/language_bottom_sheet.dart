import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/color_constant.dart';
import '../../view_models/language_view_model.dart';
import '../components/text_heading.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LanguageViewModel languageViewModel = Get.find();
    return Container(
      padding: const EdgeInsets.all(16.0),
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
                onTap: () => languageViewModel.onLanguageSelect('English'),
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
                        child: const Center(
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
                onTap: () => languageViewModel.onLanguageSelect('عربي'),
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
                          child: const CircleAvatar(
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
