import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naemen/models/salon_model.dart';
import 'package:naemen/utils/app_url.dart';
import 'package:naemen/utils/color_constant.dart';
import 'package:naemen/view_models/cart_view_model.dart';
import 'package:naemen/view_models/salon_profile_view_model.dart';

import 'text_heading.dart';

class NewelyWidget extends StatefulWidget {
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
  State<NewelyWidget> createState() => _NewelyWidgetState();
}

List<String> shopname = [
  "Cuts Barber shop",
  "Nail saloon",
  "Kiko Nail SPA",
  "Pretty Wow",
  "House Of Cutes"
];
List<String> ShopImage = [
  "assets/images/new Salon image1.jpeg",
  "assets/images/new salon image2.jpeg",
  "assets/images/new salon image 3.jpeg",
  "assets/images/new salon image 4.jpeg",
  "assets/images/new salon image 5.jpeg"
];

class _NewelyWidgetState extends State<NewelyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 255.h,
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: shopname.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 252.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                        color: AppColors.searchFieldsColor,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                            color: AppColors.signUpColor, width: 0.2)),
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
                                    image: AssetImage(ShopImage[index]),
                                    fit: BoxFit.cover)),
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
                                      title: "Status",
                                      fontweight: FontWeight.w600,
                                      fontsize: 12.sp,
                                      fontcolor: Colors.white),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  TextHeading(
                                      title: "online",
                                      fontweight: FontWeight.w400,
                                      fontsize: 12.sp,
                                      fontcolor: AppColors.primaryColor)
                                ],
                              ),

                              SizedBox(
                                height: 3.h,
                              ),

                              TextHeading(
                                  title: shopname[index],
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontcolor: Colors.white),
                              Row(
                                children: [
                                  TextHeading(
                                      title: "Saloon Type",
                                      fontweight: FontWeight.w400,
                                      fontsize: 12.sp,
                                      fontcolor: Colors.white),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  TextHeading(
                                      title: "barbar",
                                      fontweight: FontWeight.w400,
                                      fontsize: 12.sp,
                                      fontcolor: AppColors.primaryColor)
                                ],
                              ),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/location-svgrepo-com 1.png",
                                    color: AppColors.primaryColor,
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
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
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
                                          color: AppColors.bookmarkColor,
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
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
            }));
  }
}

class WinterSpecialItems extends StatelessWidget {
  const WinterSpecialItems(
      {super.key,
      required this.image,
      required this.status,
      required this.statusValue,
      required this.description,
      required this.type,
      required this.typeValue,
      required this.distance,
      required this.salon});

  final String image;
  final String status;
  final String statusValue;
  final String description;
  final String type;
  final String typeValue;
  final num distance;
  final SalonModel salon;

  @override
  Widget build(BuildContext context) {
    final SalonProfileViewModel salonProfileViewModel = Get.find();
    final CartViewModel cartViewModel = Get.find();
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 252.h,
          width: 200.w,
          decoration: BoxDecoration(
              color: AppColors.searchFieldsColor,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.signUpColor, width: 0.2)),
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
                      image: NetworkImage("${AppUrl.baseUrl}/$image"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: 5.h,),
                    // Row(
                    //   children: [
                    //     TextHeading(
                    //         title: status,
                    //         fontweight: FontWeight.w600,
                    //         fontsize: 12.sp,
                    //         fontcolor: Colors.white),
                    //     SizedBox(
                    //       width: 3.w,
                    //     ),
                    //     TextHeading(
                    //         title: statusValue == "2"
                    //             ? "OFF"
                    //             : statusValue == "1"
                    //                 ? "ON"
                    //                 : "",
                    //         fontweight: FontWeight.w400,
                    //         fontsize: 12.sp,
                    //         fontcolor: AppColors.primaryColor)
                    //   ],
                    // ),

                    SizedBox(
                      height: 3.h,
                    ),

                    TextHeading(
                        title: description[0].toUpperCase() +
                            description.substring(1),
                        fontweight: FontWeight.w600,
                        fontsize: 12.sp,
                        fontcolor: Colors.white),
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
                            title: statusValue == "2"
                                ? "OFF"
                                : statusValue == "1"
                                    ? "ON"
                                    : "",
                            fontweight: FontWeight.w400,
                            fontsize: 12.sp,
                            fontcolor: AppColors.primaryColor)
                      ],
                    ),
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
                            fontcolor: AppColors.primaryColor)
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/location-svgrepo-com 1.png",
                          color: AppColors.primaryColor,
                        ),
                        TextHeading(
                          title:
                              "${double.parse(distance.toString()).toStringAsFixed(2)} km",
                          fontweight: FontWeight.w400,
                          fontsize: 12.sp,
                          fontcolor: Colors.white,
                        )
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
                            border: Border.all(
                                color: AppColors.signUpColor, width: 0.2),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.bookmark_add_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        InkWell(
                          onTap: () => salonProfileViewModel.onViewProfileClick(
                              salon, cartViewModel),
                          child: Container(
                            height: 34.h,
                            width: 102.w,
                            decoration: BoxDecoration(
                              color: AppColors.bookmarkColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: TextHeading(
                                title: "View Profile",
                                fontweight: FontWeight.w400,
                                fontsize: 12.sp,
                                fontcolor: Colors.white,
                              ),
                            ),
                          ),
                        ),
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
