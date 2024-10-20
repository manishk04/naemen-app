import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/views/components/search_bar.dart';
import 'package:naemen/views/screens/order_success_view.dart';
import 'package:naemen/utils/color_constant.dart';

import '../components/text_heading.dart';

class CoupanPage extends StatefulWidget {
  const CoupanPage({super.key});

  @override
  State<CoupanPage> createState() => _CoupanPageState();
}

class _CoupanPageState extends State<CoupanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 15.h,
                          backgroundColor:
                              AppColors.primaryColor.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 73.w,
                      ),
                      TextHeading(
                        title: "Payment Coupan for you",
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontcolor: Colors.white,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SearchBarWidget(
                    hinttexttitle: "Type coupon code here...",
                  ),
                ),
                // Container for the list
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      100.h, // Dynamic height for full screen use
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Stack(
                            children: [
                              Container(
                                height: 180.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                  color: AppColors.searchFieldsColor,
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColors.bottomBarColor,
                                          width: 1),
                                      top: BorderSide(
                                          color: AppColors.bottomBarColor,
                                          width: 1)),

                                  // border: Border.all(
                                  //   color: Colors.grey,
                                  //   width: 0.5,
                                  // ),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 130, top: 20),
                                      child: TextHeading(
                                          title: "FLAT 125",
                                          fontweight: FontWeight.w500,
                                          fontsize: 16.sp,
                                          fontcolor: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: TextHeading(
                                          title:
                                              "Save SAR 125 on this appointment",
                                          fontweight: FontWeight.w400,
                                          fontsize: 12.sp,
                                          fontcolor: AppColors.primaryColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Divider(
                                        thickness: 2,
                                        endIndent: 10,
                                        color: AppColors.bottomBarColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 60, top: 10),
                                      child: TextHeading(
                                          title:
                                              "Use code FLAT125 & get flat SAR 125 off on orders\nabove SAR 199.",
                                          fontweight: FontWeight.w400,
                                          fontsize: 10.sp,
                                          fontcolor: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 65, top: 5),
                                      child: Row(
                                        children: [
                                          TextHeading(
                                              title: "+More",
                                              fontweight: FontWeight.w700,
                                              fontsize: 12.sp,
                                              fontcolor:
                                                  AppColors.primaryColor),
                                          SizedBox(
                                            width: 110.w,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OrderSuccessView()));
                                            },
                                            child: Container(
                                              height: 34.h,
                                              width: 102.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r)),
                                              child: Center(
                                                child: TextHeading(
                                                  title: "APPLY",
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 12.sp,
                                                  fontcolor: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),

                                // child: Row(
                                //   children: [

                                //     Padding(
                                //       padding: const EdgeInsets.only(left: 12),
                                //       child: Column(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceEvenly,
                                //         children: [
                                //           InkWell(
                                //             onTap: () {
                                //               Navigator.push(
                                //                 context,
                                //                 MaterialPageRoute(
                                //                   builder: (context) =>
                                //                       OrderSuccessView(),
                                //                 ),
                                //               );
                                //             },
                                //             child: TextHeading(
                                //               title: "FLAT 125",
                                //               fontweight: FontWeight.w500,
                                //               fontsize: 16.sp,
                                //               fontcolor: Colors.white,
                                //             ),
                                //           ),
                                //           TextHeading(
                                //             title:
                                //                 "Save SAR 125 on this appointment",
                                //             fontweight: FontWeight.w400,
                                //             fontsize: 12.sp,
                                //             fontcolor: AppColors.primaryColor,
                                //           ),
                                //           TextHeading(
                                //             title:
                                //                 "Use code FLAT125 & get flat SAR 125 off on orders\nabove SAR199.",
                                //             fontweight: FontWeight.w400,
                                //             fontsize: 10.sp,
                                //             fontcolor: AppColors.primaryColor,
                                //           ),
                                //         ],
                                //       ),
                                //     )
                                //   ],
                                // ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 180.h,
                                    width: 58,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 35,
                                    left: -5,
                                    child: CircleAvatar(
                                      radius: 9,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),
                                  const Positioned(
                                    top: 65,
                                    left: -5,
                                    child: CircleAvatar(
                                      radius: 9,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),
                                  const Positioned(
                                    top: 95,
                                    left: -5,
                                    child: CircleAvatar(
                                      radius: 9,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),
                                  const Positioned(
                                    top: 125,
                                    left: -5,
                                    child: CircleAvatar(
                                      radius: 9,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),
                                  const Positioned(
                                    right: 13,
                                    top: 55,
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                      child: TextHeading(
                                        title: "FLAT OFF",
                                        fontweight: FontWeight.w700,
                                        fontsize: 16,
                                        fontcolor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Positioned(
                                top: 35,
                                right: -2,
                                child: CircleAvatar(
                                  radius: 9,
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              const Positioned(
                                top: 65,
                                right: -2,
                                child: CircleAvatar(
                                  radius: 9,
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              const Positioned(
                                top: 95,
                                right: -2,
                                child: CircleAvatar(
                                  radius: 9,
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              const Positioned(
                                top: 125,
                                right: -2,
                                child: CircleAvatar(
                                  radius: 9,
                                  backgroundColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
