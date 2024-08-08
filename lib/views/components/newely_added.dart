import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/utils/color_constant.dart';

import 'text_heading.dart';

class NewelyWidget extends StatelessWidget {
  const NewelyWidget(
      {super.key,
      required this.status,
      required this.statuValue,
      required this.description,
      required this.type,
      required this.typeValue,
      required this.image});

  final String image;
  final String status;
  final String statuValue;
  final String description;
  final String type;
  final String typeValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 255.h,
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 8,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return WinterspecialItems(
                image: image,
                status: status,
                statuValue: statuValue,
                description: description,
                type: type,
                typeValue: typeValue,
              );
            }));
  }
}

class WinterspecialItems extends StatelessWidget {
  const WinterspecialItems(
      {super.key,
      required this.image,
      required this.status,
      required this.statuValue,
      required this.description,
      required this.type,
      required this.typeValue});

  final String image;
  final String status;
  final String statuValue;
  final String description;
  final String type;
  final String typeValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 252.h,
          width: 200.w,
          decoration: BoxDecoration(
              color: AppColors.SearchfieldsColor,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.SignupColor)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: 190.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: 5.h,),
                    Row(
                      children: [
                        TextHeading(
                            title: status,
                            fontweight: FontWeight.w600,
                            fontsize: 12.sp,
                            fontcolor: Colors.white),
                        SizedBox(
                          width: 3.w,
                        ),
                        TextHeading(
                            title: statuValue,
                            fontweight: FontWeight.w400,
                            fontsize: 12.sp,
                            fontcolor: AppColors.primarycolor)
                      ],
                    ),

                    SizedBox(
                      height: 3.h,
                    ),

                    TextHeading(
                        title: description,
                        fontweight: FontWeight.w600,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
                    Row(
                      children: [
                        TextHeading(
                            title: type,
                            fontweight: FontWeight.w400,
                            fontsize: 12.sp,
                            fontcolor: Colors.white),
                        SizedBox(
                          width: 3.w,
                        ),
                        TextHeading(
                            title: typeValue,
                            fontweight: FontWeight.w400,
                            fontsize: 12.sp,
                            fontcolor: AppColors.primarycolor)
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/location-svgrepo-com 1.png",
                          color: AppColors.primarycolor,
                        ),
                        TextHeading(
                            title: "0.4 km",
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
                        Container(
                          height: 34.h,
                          width: 34.w,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                              child: Icon(
                            Icons.bookmark_add_outlined,
                            color: Colors.white,
                          )),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Container(
                            height: 34.h,
                            width: 102.w,
                            decoration: BoxDecoration(
                                color: AppColors.bookmarlColor,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Center(
                                child: TextHeading(
                                    title: "View Profile",
                                    fontweight: FontWeight.w400,
                                    fontsize: 12.sp,
                                    fontcolor: Colors.white)))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}