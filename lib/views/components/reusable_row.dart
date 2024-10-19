import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/utils/color_constant.dart';

import 'text_heading.dart';

class ReUsableRow extends StatelessWidget {
  const ReUsableRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 52.h,
          width: 108.w,
          child: Card(
            color: AppColors.searchFieldsColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                color: AppColors.signUpColor, // Set the border color here
                width: 1.0, // Set the border width here
              ),
            ),
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/haircut.png",
                  color: Colors.white,
                ),
                TextHeading(
                    title: "Hair Cut",
                    fontweight: FontWeight.w600,
                    fontsize: 12.sp,
                    fontcolor: Colors.white)
              ],
            ),
          ),
        ),
        SizedBox(
          height: 52.h,
          width: 108.w,
          child: Card(
            color: AppColors.searchFieldsColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(
                color: AppColors.signUpColor,
                width: 1.0,
              ),
            ),
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/shampoo.png",
                  color: Colors.white,
                ),
                TextHeading(
                    title: "Shampoo",
                    fontweight: FontWeight.w600,
                    fontsize: 12.sp,
                    fontcolor: Colors.white)
              ],
            ),
          ),
        ),
        SizedBox(
          height: 52.h,
          width: 108.w,
          child: Card(
            color: AppColors.searchFieldsColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(
                color: AppColors.signUpColor, // Set the border color here
                width: 1.0, // Set the border width here
              ),
            ),
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/shaving-brush.png",
                  color: Colors.white,
                ),
                TextHeading(
                    title: "Shave",
                    fontweight: FontWeight.w600,
                    fontsize: 12.sp,
                    fontcolor: Colors.white)
              ],
            ),
          ),
        )
      ],
    );
  }
}
