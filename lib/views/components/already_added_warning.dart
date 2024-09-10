import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'text_heading.dart';

class AlreadyAddedWarning extends StatelessWidget {
  const AlreadyAddedWarning({super.key, required this.onYesClick});

  final VoidCallback onYesClick;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: const Text(
        "You can Add services only for a single artist!",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      content: const Text(
        "Do you want to remove previously added services and add this service?",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        TextButton(
          onPressed: onYesClick,
          child: Container(
            height: 23.h,
            width: 55.w,
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(4.r)),
            child: Center(
              child: TextHeading(
                title: "Yes",
                fontweight: FontWeight.w400,
                fontsize: 12.sp,
                fontcolor: Colors.white,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: Container(
            height: 23.h,
            width: 55.w,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Center(
              child: TextHeading(
                title: "No",
                fontweight: FontWeight.w400,
                fontsize: 12.sp,
                fontcolor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
