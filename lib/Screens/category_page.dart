import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/Screens/venders_list.dart';
import 'package:naemen/utils/color_constant.dart';
import 'package:naemen/utils/image_constant.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}



class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.primarycolor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: TextHeading(
              title: "Categories",
              fontweight: FontWeight.w700,
              fontsize: 12.sp,
              fontcolor: Colors.white),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Divider(
                    color: AppColors.primarycolor,
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VendersPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Barber",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                              top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                               
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/Barbering.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                            Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Massage",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                             top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                  
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/Massage.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                                     
                      ],
                    ),
                  ),
                      SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VendersPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Nails",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                             top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                  
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/nails.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                            Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Hair &\nStyling",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                            top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                 
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/Hair & styling.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                                     
                      ],
                    ),
                  ),
                      SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VendersPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Hair\nRemoval",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                              top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                     
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/Hair removal.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                            Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Heena",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                             top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                 
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/Henna.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                                     
                      ],
                    ),
                  ),
                      SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VendersPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Injectible\n&Filters",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                            top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                    
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/Injectible and fillers.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                            Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Makeup",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                             top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                    
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/Makeup.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                                     
                      ],
                    ),
                  ),
                      SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VendersPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Meni-Pedi",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                            top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                   
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/Mani-pedi.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                            Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Eyebrows",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                             top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                    
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/Eyebrows.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                                     
                      ],
                    ),
                  ),
                      SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VendersPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Facial",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                            top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                 
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/facial.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                            Stack(
                          children: [
                            Container(
                              height: 87.h,
                              width: 165.w,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 35),
                                child: TextHeading(
                                  title: "Massage",
                                  fontweight: FontWeight.w600,
                                  fontsize: 14.sp,
                                  fontcolor: AppColors.primarycolor,
                                ),
                              ),
                              
                            ),
                            Positioned(
                              right: -8,
                             top: 7.6,
                              child: Transform.rotate(
                                  angle: -pi/10,
                                  child: Container(
                                    height: 72.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                   
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                                    image: DecorationImage(image: AssetImage("assets/images/Massage.jpg"),fit: BoxFit.cover)
                                    ),
                                   // child: Image.asset("",height: 100,width: 80,)
                                    )),
                            ),
                          ],
                        ),
                                     
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Continue adding more rows as needed...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
