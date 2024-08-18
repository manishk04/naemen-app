import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_constant.dart';
import '../components/text_heading.dart';

class ArtistPageSecond extends StatefulWidget {
  const ArtistPageSecond({super.key});

  @override
  State<ArtistPageSecond> createState() => _ArtistPageSecondState();
}

class _ArtistPageSecondState extends State<ArtistPageSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.yellow.withOpacity(0.2),
                  radius: 18,
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextHeading(
                    title: "Artist Profile and Services",
                    fontweight: FontWeight.w700,
                    fontsize: 12.sp,
                    fontcolor: Colors.white),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.yellow.withOpacity(0.2),
                  child: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Container(
              height: 134.h,
              width: 340.w,
              decoration: BoxDecoration(
                  color: AppColors.searchFieldsColor,
                  border: Border.all(color: AppColors.signUpColor),
                  borderRadius: BorderRadius.circular(16.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/artist_profileimage.png"),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeading(
                            title: "Yusuf Ansari",
                            fontweight: FontWeight.w700,
                            fontsize: 14.sp,
                            fontcolor: Colors.white),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            TextHeading(
                                title: "4.3/5",
                                fontweight: FontWeight.w700,
                                fontsize: 10.sp,
                                fontcolor: Colors.white)
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            TextHeading(
                                title: "Work at:",
                                fontweight: FontWeight.w600,
                                fontsize: 12.sp,
                                fontcolor: Colors.white),
                            SizedBox(
                              width: 2.w,
                            ),
                            TextHeading(
                                title: " nspirations Salons",
                                fontweight: FontWeight.w600,
                                fontsize: 12.sp,
                                fontcolor: AppColors.primaryColor),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/mark_Location.png"),
                            SizedBox(
                              width: 3.w,
                            ),
                            TextHeading(
                                title: "3.5 Km From you",
                                fontweight: FontWeight.w400,
                                fontsize: 12.sp,
                                fontcolor: Colors.white)
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextHeading(
                title: "Select your date",
                fontweight: FontWeight.w700,
                fontsize: 12.sp,
                fontcolor: Colors.white),
            SizedBox(
              height: 15.h,
            ),
            // Container(
            //   height: 100.h,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(8.r),
            //   ),
            //   child: SingleChildScrollView(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         DatePicker(
            //           DateTime.now(),
            //           initialSelectedDate: DateTime.now(),
            //           selectionColor: Colors.black,
            //           selectedTextColor: Colors.white,
            //           onDateChange: (date) {
            //             // New date selected
            //             setState(() {
            //               _selectedValue = date;
            //             });
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextHeading(
                    title: "Timing",
                    fontweight: FontWeight.w700,
                    fontsize: 12.sp,
                    fontcolor: Colors.white),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    TextHeading(
                        title: "Booked",
                        fontweight: FontWeight.w400,
                        fontsize: 10.sp,
                        fontcolor: Colors.white)
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    TextHeading(
                        title: "Aviliable",
                        fontweight: FontWeight.w400,
                        fontsize: 10.sp,
                        fontcolor: Colors.white)
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    TextHeading(
                        title: "Selected",
                        fontweight: FontWeight.w400,
                        fontsize: 10.sp,
                        fontcolor: Colors.white)
                  ],
                )
              ],
            ),

            SizedBox(
              height: 15.h,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: TextHeading(
                            title: "10:00 AM",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.red),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: TextHeading(
                            title: "10:00 AM",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.green),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: TextHeading(
                            title: "10:00 AM",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.green),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: TextHeading(
                            title: "10:00 AM",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.yellow),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: TextHeading(
                            title: "10:00 AM",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.green),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: TextHeading(
                            title: "10:00 AM",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.yellow),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: TextHeading(
                            title: "10:00 AM",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.green),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: TextHeading(
                            title: "10:00 AM",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.green),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: TextHeading(
                            title: "10:00 AM",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.yellow),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: TextHeading(
                            title: "10:00 AM",
                            fontweight: FontWeight.w400,
                            fontsize: 10.sp,
                            fontcolor: Colors.green),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            TextHeading(
                title: "Services",
                fontweight: FontWeight.w700,
                fontsize: 12.sp,
                fontcolor: Colors.white),
            Container(
              height: 767.h,
              width: 340.w,
              decoration: BoxDecoration(
                  color: AppColors.searchFieldsColor,
                  border: Border.all(color: AppColors.signUpColor),
                  borderRadius: BorderRadius.circular(16.r)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    TextHeading(
                        title: "Hair",
                        fontweight: FontWeight.w600,
                        fontsize: 12,
                        fontcolor: Colors.amber)
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
