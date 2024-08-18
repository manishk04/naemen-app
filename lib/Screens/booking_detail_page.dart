import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/Screens/coupan_screen.dart';

import '../utils/color_constant.dart';

class BookingDetailPage extends StatefulWidget {
  const BookingDetailPage({super.key});

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 50.h,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(radius: 15.h,
                      backgroundColor: Colors.yellow.withOpacity(0.6),
                      child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 15,),
                      ),
                    ),
                    SizedBox(width: 80.w,),
                    TextHeading(title: "Your Booking Details", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white)
                    
            
                  ],
                ),
                SizedBox(height: 15.h,),
                Stack(
                  children: [
                    Container(
                      height: 340.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/saloon_detail _image.jpeg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                              color: AppColors.SignupColor, width: 2)),
                    ),
                    Container(
                      height: 340.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xff000000).withOpacity(0.1),
                            Color(0xff000000),
                          ], // Gradient from https://learnui.design/tools/gradient-generator.html
                          tileMode: TileMode.mirror,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                           
                            SizedBox(
                              height: 184.h,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                TextHeading(
                                    title: "Art Salons",
                                    fontweight: FontWeight.w600,
                                    fontsize: 20.sp,
                                    fontcolor: Colors.white),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.primarycolor,
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
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                    "assets/images/mark_Location.png"),
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
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.alarm,
                                  color: AppColors.primarycolor,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                TextHeading(
                                    title: "10:00 AM - 10:00 PM",
                                    fontweight: FontWeight.w400,
                                    fontsize: 12.sp,
                                    fontcolor: Colors.white)
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.child_care,
                                  color: AppColors.primarycolor,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                TextHeading(
                                    title: "Child Service available",
                                    fontweight: FontWeight.w400,
                                    fontsize: 12.sp,
                                    fontcolor: AppColors.primarycolor)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h,),
                Container(height: 84.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    color: AppColors.SearchfieldsColor,
                    border: Border.all(color: AppColors.SignupColor),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            TextHeading(title: "Date & Timing: ", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: Colors.white),
                            TextHeading(title: "Sunday, 07 Apr - 12:00PM", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: AppColors.primarycolor),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Row(
                          children: [
                            TextHeading(title: "Artist: ", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: Colors.white),
                            TextHeading(title: "Musa", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: AppColors.primarycolor),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Row(
                          children: [
                            TextHeading(title: "Gender: ", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: Colors.white),
                            TextHeading(title: "Male", fontweight: FontWeight.w400, fontsize: 12
                                , fontcolor: AppColors.primarycolor),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,)
            
            
                      ],
                    ),
                  ),
                ),
                SizedBox(height:
                20.h
                ),
                Container(
                  height: 160.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: AppColors.SearchfieldsColor,
                      border: Border.all(color: AppColors.SignupColor),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextHeading(title: "Services", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                          
                            Expanded(
                              flex: 2,
                              child: TextHeading(title: "Time", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: AppColors.primarycolor),
                            ),
                          
                            Expanded(
                              
                              child: TextHeading(title: "Price", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: AppColors.primarycolor),
                            ),
            
            
                          ],
                        ),
                        Divider(),
                        SizedBox(height: 5.h,),
                        const Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextHeading(title: "Haircut", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                          
                            Expanded(
                              flex: 2,
                              child: TextHeading(title: "30 minuts", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                           
                            Expanded(
                              flex: 1,
                              child: TextHeading(title: "SAR 90", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: AppColors.primarycolor),
                            ),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                       const Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextHeading(title: "Beard Trim", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                          
                            Expanded(
                              flex: 2,
                              child: TextHeading(title: "20 minuts", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                           
                            Expanded(
                              flex: 1,
                              child: TextHeading(title: "SAR 79", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: AppColors.primarycolor),
                            ),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                     const Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextHeading(title: "Patial Facial Wax", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                          
                            Expanded(
                              flex: 2,
                              child: TextHeading(title: "15 minuts", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                           
                            Expanded(
                              flex: 1,
                              child: TextHeading(title: "SAR 40", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: AppColors.primarycolor),
                            ),
            
            
                          ],
                        ),
                        SizedBox(height: 5.h,),
                     const Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextHeading(title: "Manicure & Pedicure", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                          
                            Expanded(
                              flex: 2,
                              child: TextHeading(title: "60 minuts", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: Colors.white),
                            ),
                           
                            Expanded(
                              flex: 1,
                              child: TextHeading(title: "SAR 190", fontweight: FontWeight.w400, fontsize: 12
                                  , fontcolor: AppColors.primarycolor),
                            ),
            
            
                          ],
                        ),
            
            
            
            
            
            
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  height: 170.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    color: AppColors.SearchfieldsColor,
                    border: Border.all(color: AppColors.SignupColor),
                      borderRadius: BorderRadius.circular(16.r)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h,),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.countertops_outlined,color: AppColors.primarycolor,)),
                                Expanded(
                                  flex: 3,
                                  child: TextHeading(title: "Save 12 more with NAEMEN", fontweight: FontWeight.w400, fontsize: 10.sp, fontcolor: Colors.white)),
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CoupanPage()));
                                    },
                                    child: Container(
                                      height: 23.h,
                                      width: 55.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.primarycolor,
                                        borderRadius: BorderRadius.circular(4.r)),
                                        child: Center(
                                          child: TextHeading(title: "Apply", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white),
                                        ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.window_sharp,color: AppColors.primarycolor,)),
                                Expanded(
                                  flex: 3,
                                  child: TextHeading(title: "View all payment coupon", fontweight: FontWeight.w400, fontsize: 8.sp, fontcolor: Colors.white)),
                                Expanded(
                                  child: Icon(Icons.arrow_forward_ios,color: AppColors.primarycolor,size: 15,))
                              ],
                            ),
                            Divider(),
                            SizedBox(height: 12.h,),
                            Container(
                              height: 40.h,
                              width: 320.w,
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  fillColor: Colors.black,
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "Enter Coupon Code",hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                                  suffixIcon:  Align(
                                    widthFactor: 1.0,
                                    heightFactor: 1.0,
                                    child: Container(
                                        height: 23.h,
                                        width: 55.w,
                                        decoration: BoxDecoration(
                                          color: AppColors.primarycolor,
                                          borderRadius: BorderRadius.circular(4.r)),
                                          child: Center(
                                            child: TextHeading(title: "Apply", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white),
                                          ),
                                      ),
                                  ),
                                  border: OutlineInputBorder()),
                                  
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                ),

                SizedBox(height: 20.h,),
                Container(
                  height: 68.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.SearchfieldsColor,border: Border.all(color: AppColors.SignupColor,width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextHeading(title: "Sub Total", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white),
                               TextHeading(title: "SAR 375", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: AppColors.primarycolor)
                            ],
                          ),
                          SizedBox(height: 6.h,),
                           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextHeading(title: "Coupon Discount", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white),
                               TextHeading(title: "SAR 72", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: AppColors.primarycolor)
                            ],
                          )
                        ],
                      ),
                    ),
                ),

                SizedBox(height: 40.h,),
                   Container(
                  height: 68.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.SearchfieldsColor,border: Border.all(color: AppColors.SignupColor,width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextHeading(title: "Sub Total", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white),
                              Container(
                                        height: 28.h,
                                        width: 78.w,
                                        decoration: BoxDecoration(
                                          color: AppColors.primarycolor,
                                          borderRadius: BorderRadius.circular(4.r)),
                                          child: Center(
                                            child: TextHeading(title: "Book now", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white),
                                          ),
                                      ),
                              
                            ],
                          ),
                         
                        ],
                      ),
                    ),
                ),

                SizedBox(height: 20.h,)
            
            
            
            
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
