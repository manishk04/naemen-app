import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../utils/color_constant.dart';
import 'text_heading.dart';

class BookingDateTimeWidget extends StatelessWidget {
  const BookingDateTimeWidget({
    super.key,
    required this.date,
    required this.time,
    required this.name,
  });

  final String date;
  final String time;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.h,
      width: 340.w,
      decoration: BoxDecoration(
        color: AppColors.searchFieldsColor,
        border: Border.all(
          width: 1.5,
          color: AppColors.progressIndicatorColor,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const TextHeading(
                  title: "Date & Timing: ",
                  fontweight: FontWeight.w400,
                  fontsize: 12,
                  fontcolor: Colors.white,
                ),
                TextHeading(
                  title:
                      "${date.isEmpty ? "" : DateFormat("EEEE, dd MMM").format(DateFormat("dd-MM-yyyy").parse(date))} - ${time ?? ""}",
                  fontweight: FontWeight.w400,
                  fontsize: 11,
                  fontcolor: AppColors.primaryColor,
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                TextHeading(
                  title: "Artist: ",
                  fontweight: FontWeight.w400,
                  fontsize: 12,
                  fontcolor: Colors.white,
                ),
                TextHeading(
                  title: name,
                  fontweight: FontWeight.w400,
                  fontsize: 12,
                  fontcolor: AppColors.primaryColor,
                ),
              ],
            ),
            // SizedBox(
            //   height: 5.h,
            // ),
            // Row(
            //   children: [
            //     TextHeading(
            //       title: "Gender: ",
            //       fontweight: FontWeight.w400,
            //       fontsize: 12,
            //       fontcolor: Colors.white,
            //     ),
            //     TextHeading(
            //       title: gender,
            //       fontweight: FontWeight.w400,
            //       fontsize: 12,
            //       fontcolor: AppColors.primaryColor,
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 5.h,
            )
          ],
        ),
      ),
    );
  }
}
