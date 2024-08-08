import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_constant.dart';
import '../components/reusable_row.dart';
import '../components/search_bar.dart';
import '../components/text_heading.dart';
import 'shop_page.dart';

class VendersPage extends StatelessWidget {
  const VendersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    TextHeading(
                        title: "Vendars List",
                        fontweight: FontWeight.w500,
                        fontsize: 12.sp,
                        fontcolor: Colors.white)
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                color: AppColors.primarycolor,
              ),
              SizedBox(
                height: 10.h,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SearchBarWidget(
                        hinttexttitle: "Search your favorite hair expert "),
                    SizedBox(
                      height: 20.h,
                    ),
                    const ReUsableRow(),
                    Container(
                      height: 500.h,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              height: 150.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.SearchfieldsColor,
                                  border: Border.all(
                                      color: AppColors.SignupColor, width: 0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ShopPage()));
                                              },
                                              child: Container(
                                                height: 120.h,
                                                width: 120.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.blueGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.r)),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            right: 20,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: AppColors.primarycolor,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                TextHeading(
                                                    title: "4.3/5",
                                                    fontweight: FontWeight.w400,
                                                    fontsize: 12.sp,
                                                    fontcolor: Colors.white)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          TextHeading(
                                              title: "Kidza",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12.sp,
                                              fontcolor:
                                                  AppColors.primarycolor),
                                          SizedBox(
                                            height: 10.w,
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
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.alarm,
                                                color: AppColors.primarycolor,
                                                weight: 0.5,
                                              ),
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              TextHeading(
                                                  title: "3.5 Km From you",
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 12.sp,
                                                  fontcolor: Colors.white)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            children: [
                                              TextHeading(
                                                  title: "        Kids :",
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 12.sp,
                                                  fontcolor: Colors.white),
                                              TextHeading(
                                                  title: " Avilable",
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 12.sp,
                                                  fontcolor:
                                                      AppColors.bookmarlColor)
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      Container(
                                          height: 24.h,
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      AppColors.primarycolor),
                                              borderRadius:
                                                  BorderRadius.circular(5.r)),
                                          child: Image.asset(
                                              "assets/images/venderImage.png"))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
              // Row(
              //   children: [
              //     SearchBarWidget(hinttexttitle: 'Search Your Favorite hair expert...',),
              //     Icon(Icons.filter,color: AppColors.primarycolor,)
              //   ],
              // ),
              // SizedBox(height: 20.h,),
              // const  ReUsableRow(),
              // SizedBox(height: 20.h,),
              //
              // Container(height: 500.h,
              // width: double.infinity,
              //   child: ListView.builder(
              //     itemCount: 10,
              //     itemBuilder: (BuildContext context, int index) {
              //       return  Container(
              //         height: 150.h,
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //             color: AppColors.SignupColor,
              //             border: Border.all(color: AppColors.primarycolor),
              //             borderRadius: BorderRadius.circular(20)),
              //         child: Row(
              //           children: [
              //             Stack(
              //               children: [
              //                 Container(
              //                   height: 70.h,
              //                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
              //                 ),
              //
              //                 Row(
              //                   children: [
              //                     Icon(Icons.star,color: AppColors.primarycolor,),
              //                     SizedBox(width: 3.w,),
              //                     TextHeading(title: "4.3/5", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white)
              //
              //                   ],
              //                 )
              //               ],
              //             )
              //
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              //
              //
              //
              //
              //
              //
              //
              //
              //
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
