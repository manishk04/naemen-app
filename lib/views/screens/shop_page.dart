import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_constant.dart';
import '../components/text_heading.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        // Container(
                        //   height: 354.h,
                        //   width: 340.w,
                        //   decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/page4.jpeg"),fit: BoxFit.cover)),
                        // ),

                        //               Container(
                        //                 height: 354.h,
                        //                 width: 340.w,
                        //                 decoration: BoxDecoration(
                        //                    gradient: LinearGradient(
                        //   begin: Alignment.bottomCenter,
                        //   end: Alignment.center,
                        //   colors: <Color>[
                        //     Color(0xff000000).withOpacity(0.5),
                        //     Color(0xff000000).withOpacity(0.5)

                        //   ], // Gradient from https://learnui.design/tools/gradient-generator.html
                        //   tileMode: TileMode.mirror,
                        // ),
                        //                 ),
                        //               ),
                        Container(
                          height: 354.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/page4.jpeg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                  color: AppColors.SignupColor, width: 0.5)),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: AppColors.bookmarlColor,
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: AppColors.bookmarlColor,
                                      child: Icon(
                                        Icons.bookmark_add_outlined,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 354.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color(0xff000000).withOpacity(0),
                                Color(0xff000000).withOpacity(5)
                              ],
                              tileMode: TileMode.mirror,
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 184.h,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextHeading(
                                            title: "Inspirations Salons",
                                            fontweight: FontWeight.w600,
                                            fontsize: 20.sp,
                                            fontcolor: Colors.white),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/images/mark_Location.png"),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            // Icon(Icons.location_city,color: Colors.white,),
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
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // body: Column(
        //   children: [
        //     SizedBox(height: 10.h,),
        //     Center(
        //       child: Container(
        //         height: 354.h,
        //         width: 340.w,
        //         decoration: BoxDecoration(
        //           color: Colors.black,
        //           border: Border.all(color: AppColors.SignupColor)
        //         ),

        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
