import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'text_heading.dart';

class AddServiceWarning extends StatelessWidget {
  const AddServiceWarning({super.key, required this.onRemove});

  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: const Text("Services already added from another salon!"),
      content: const Text(
          "You have added some services from another salon. To add this service to cart you have to remove previously added services."),
      actions: [
        TextButton(
          onPressed: onRemove,
          child: Container(
            height: 23.h,
            width: 55.w,
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(4.r)),
            child: Center(
              child: TextHeading(
                title: "Remove",
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
                title: "Cancel",
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
