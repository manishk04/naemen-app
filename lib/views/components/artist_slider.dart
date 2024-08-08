import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/utils/color_constant.dart';

import 'text_heading.dart';

class ArtistSliderWidget extends StatelessWidget {
  const ArtistSliderWidget(
      {super.key,
      required this.name,
      required this.description,
      required this.image,
      required this.descriptiondetail});

  final String image;
  final String name;
  final String descriptiondetail;

  final String description;

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
                name: name,
                description: description,
                descriptiondetail: '',
              );
            }));
  }
}

class WinterspecialItems extends StatelessWidget {
  const WinterspecialItems(
      {super.key,
      required this.image,
      required this.description,
      required this.descriptiondetail,
      required this.name});

  final String image;
  final String name;

  final String description;
  final String descriptiondetail;

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
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 252.h,
          width: 200.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.primarycolor)),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Expanded(
                flex: 5,
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
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox(height: 5.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextHeading(
                                title: name,
                                fontweight: FontWeight.w600,
                                fontsize: 12.sp,
                                fontcolor: Colors.white),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.primarycolor,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                TextHeading(
                                    title: "4.3/5",
                                    fontweight: FontWeight.w600,
                                    fontsize: 12.sp,
                                    fontcolor: Colors.white),
                              ],
                            )
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
                                title: description,
                                fontweight: FontWeight.w400,
                                fontsize: 12.sp,
                                fontcolor: Colors.white),
                            SizedBox(
                              width: 3.w,
                            ),
                            TextHeading(
                                title: descriptiondetail,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
