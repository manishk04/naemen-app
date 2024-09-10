import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:naemen/models/artist_service_model.dart';
import 'package:naemen/utils/app_url.dart';
import 'package:naemen/view_models/language_view_model.dart';
import 'package:naemen/views/screens/coupan_screen.dart';

import '../../utils/color_constant.dart';
import '../../utils/storage_data.dart';
import '../../view_models/auth_view_model.dart';
import '../../view_models/cart_view_model.dart';
import '../components/booking_dattime_widget.dart';
import '../components/text_heading.dart';

class BookingDetailPage extends StatefulWidget {
  const BookingDetailPage({super.key});

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  final CartViewModel _cartViewModel = Get.find();
  final AuthViewModel _authViewModel = Get.find();
  final LanguageViewModel _languageViewModel = Get.find();
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
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 15.h,
                        backgroundColor: Colors.yellow.withOpacity(0.6),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80.w,
                    ),
                    TextHeading(
                        title: "Your Booking Details",
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontcolor: Colors.white)
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Stack(
                  children: [
                    Container(
                      height: 340.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "${AppUrl.baseUrl}/${_cartViewModel.getSelectedStore.salonImage ?? ""}"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                              color: AppColors.signUpColor, width: 2)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextHeading(
                                  title:
                                      _languageViewModel.getSelectedLanguage ==
                                              "English"
                                          ? _cartViewModel.getSelectedStore
                                                  .salonNameEng ??
                                              "NA"
                                          : _cartViewModel.getSelectedStore
                                                  .salonNameArb ??
                                              "",
                                  fontweight: FontWeight.w600,
                                  fontsize: 20.sp,
                                  fontcolor: Colors.white,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppColors.primaryColor,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    TextHeading(
                                      title: "4.3/5",
                                      fontweight: FontWeight.w700,
                                      fontsize: 10.sp,
                                      fontcolor: Colors.white,
                                    )
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
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.alarm,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                TextHeading(
                                  title:
                                      "${_cartViewModel.getSelectedStore.salonStartTime ?? "NA"} - ${_cartViewModel.getSelectedStore.salonEndTime ?? "NA"}",
                                  fontweight: FontWeight.w400,
                                  fontsize: 12.sp,
                                  fontcolor: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            if (_cartViewModel
                                    .getSelectedStore.kidsSalonService !=
                                null)
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.child_care,
                                    color: AppColors.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  TextHeading(
                                      title: "Child Service available",
                                      fontweight: FontWeight.w400,
                                      fontsize: 12.sp,
                                      fontcolor: AppColors.primaryColor)
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                const BookingDateTimeWidget(), // DateTime, Artist and Gender
                SizedBox(height: 20.h),
                Container(
                  // height: 160.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: AppColors.searchFieldsColor,
                      border: Border.all(color: AppColors.signUpColor),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextHeading(
                                  title: "Services",
                                  fontweight: FontWeight.w400,
                                  fontsize: 12,
                                  fontcolor: Colors.white),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextHeading(
                                  title: "Time",
                                  fontweight: FontWeight.w400,
                                  fontsize: 12,
                                  fontcolor: AppColors.primaryColor),
                            ),
                            Expanded(
                              child: TextHeading(
                                  title: "Price",
                                  fontweight: FontWeight.w400,
                                  fontsize: 12,
                                  fontcolor: AppColors.primaryColor),
                            ),
                          ],
                        ),
                        // Divider(),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: _cartViewModel.getAddedServiceList.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 5.h,
                          ),
                          itemBuilder: (context, index) {
                            ArtistServiceModel service =
                                _cartViewModel.getAddedServiceList[index];
                            return Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextHeading(
                                      title: _languageViewModel
                                                  .getSelectedLanguage ==
                                              "English"
                                          ? service.categoryTitle ?? "NA"
                                          : service.categoryArb ?? "NA",
                                      fontweight: FontWeight.w400,
                                      fontsize: 12,
                                      fontcolor: Colors.white),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextHeading(
                                      title: service.time ?? "",
                                      fontweight: FontWeight.w400,
                                      fontsize: 12,
                                      fontcolor: Colors.white),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextHeading(
                                      title:
                                          "SAR ${service.serviceFinalAmount ?? 0}",
                                      fontweight: FontWeight.w400,
                                      fontsize: 12,
                                      fontcolor: AppColors.primaryColor),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 170.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: AppColors.searchFieldsColor,
                      border: Border.all(color: AppColors.signUpColor),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.countertops_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: TextHeading(
                                    title: "Save 12 more with NAEMEN",
                                    fontweight: FontWeight.w400,
                                    fontsize: 10.sp,
                                    fontcolor: Colors.white)),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CoupanPage()));
                                },
                                child: Container(
                                  height: 23.h,
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(4.r)),
                                  child: Center(
                                    child: TextHeading(
                                        title: "Apply",
                                        fontweight: FontWeight.w400,
                                        fontsize: 12.sp,
                                        fontcolor: Colors.white),
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
                                child: Icon(
                                  Icons.window_sharp,
                                  color: AppColors.primaryColor,
                                )),
                            Expanded(
                                flex: 3,
                                child: TextHeading(
                                    title: "View all payment coupon",
                                    fontweight: FontWeight.w400,
                                    fontsize: 8.sp,
                                    fontcolor: Colors.white)),
                            Expanded(
                                child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.primaryColor,
                              size: 15,
                            ))
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 12.h,
                        ),
                        Container(
                          height: 40.h,
                          width: 320.w,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                contentPadding: EdgeInsets.all(8),
                                hintText: "Enter Coupon Code",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                                suffixIcon: Align(
                                  widthFactor: 1.0,
                                  heightFactor: 1.0,
                                  child: Container(
                                    height: 23.h,
                                    width: 55.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(4.r)),
                                    child: Center(
                                      child: TextHeading(
                                          title: "Apply",
                                          fontweight: FontWeight.w400,
                                          fontsize: 12.sp,
                                          fontcolor: Colors.white),
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
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 68.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.searchFieldsColor,
                      border:
                          Border.all(color: AppColors.signUpColor, width: 0.5)),
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
                            TextHeading(
                                title: "Sub Total",
                                fontweight: FontWeight.w400,
                                fontsize: 12.sp,
                                fontcolor: Colors.white),
                            TextHeading(
                                title: "SAR ${_cartViewModel.fetchSubtotal()}",
                                fontweight: FontWeight.w400,
                                fontsize: 12.sp,
                                fontcolor: AppColors.primaryColor)
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeading(
                                title: "Coupon Discount",
                                fontweight: FontWeight.w400,
                                fontsize: 12.sp,
                                fontcolor: Colors.white),
                            TextHeading(
                                title: "SAR 72",
                                fontweight: FontWeight.w400,
                                fontsize: 12.sp,
                                fontcolor: AppColors.primaryColor)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  height: 68.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.searchFieldsColor,
                      border:
                          Border.all(color: AppColors.signUpColor, width: 0.5)),
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
                            TextHeading(
                                title: "Sub Total",
                                fontweight: FontWeight.w400,
                                fontsize: 12.sp,
                                fontcolor: Colors.white),
                            InkWell(
                              onTap: () =>
                                  _cartViewModel.onBookNowClick(_authViewModel),
                              child: Container(
                                height: 28.h,
                                width: 78.w,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(4.r)),
                                child: Center(
                                  child: TextHeading(
                                      title: "Book now",
                                      fontweight: FontWeight.w400,
                                      fontsize: 12.sp,
                                      fontcolor: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
