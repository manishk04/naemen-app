import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/utils/color_constant.dart';

class AppointmentFilter extends StatelessWidget {
  const AppointmentFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
       
        children: [
          SizedBox(
            height: 38.h,
            width: 140.w,
      
            child: Card(
              color: AppColors.SearchfieldsColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: AppColors.SignupColor, // Set the border color here
                  width: 1.0, // Set the border width here
                ),
              ),
              elevation: 2,
              child:
                
                  Center(
                    child: TextHeading(
                        title: "All Appointment",
                        fontweight: FontWeight.w600,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
                  )
               
            ),
          ),
          SizedBox(
            height: 38.h,
            width: 140.w,
            child: Card(
              color: AppColors.SearchfieldsColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: AppColors.SignupColor,
                  width: 1.0,
                ),
              ),
      
      
              elevation: 2,
              child:
                  Center(
                    child: TextHeading(
                        title: "Upcomming",
                        fontweight: FontWeight.w600,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
                  )
            ),
          ),
             SizedBox(
            height: 38.h,
            width: 140.w,
            child: Card(
              color: AppColors.SearchfieldsColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: AppColors.SignupColor,
                  width: 1.0,
                ),
              ),
      
      
              elevation: 2,
              child:
                  Center(
                    child: TextHeading(
                        title: "Completed",
                        fontweight: FontWeight.w600,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
                  )
            ),
          ),
              SizedBox(
            height: 38.h,
            width: 140.w,
            child: Card(
              color: AppColors.SearchfieldsColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: AppColors.SignupColor,
                  width: 1.0,
                ),
              ),
      
      
              elevation: 2,
              child:
                  Center(
                    child: TextHeading(
                        title: "Canceled",
                        fontweight: FontWeight.w600,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
                  )
            ),
          ),
        ],
      ),
    );
  }
}
