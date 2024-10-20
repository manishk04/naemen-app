import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:naemen/models/artist_service_model.dart';
import 'package:naemen/models/order_item_model.dart';
import 'package:naemen/view_models/artist_profile_view_model.dart';
import 'package:naemen/view_models/cart_view_model.dart';
import 'package:naemen/view_models/language_view_model.dart';
import 'package:naemen/views/components/appointment_filter.dart';
import 'package:naemen/views/components/booking_dattime_widget.dart';
import 'package:naemen/views/components/bottomsheet_appointment.dart';
import 'package:naemen/views/components/search_bar.dart';
import 'package:naemen/views/screens/profile_page.dart';
import 'package:naemen/views/screens/shop_page.dart';
import 'package:naemen/utils/color_constant.dart';

import '../../routes/app_routes.dart';
import '../components/text_heading.dart';

class AppointmentDetailPage extends StatefulWidget {
  const AppointmentDetailPage({super.key});

  @override
  State<AppointmentDetailPage> createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  @override
  Widget build(BuildContext context) {
    LanguageViewModel languageViewModel = Get.find();
    CartViewModel cartViewModel = Get.find();
    // ArtistProfileViewModel artistProfileViewModel = Get.find();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
            onPressed: () => Get.back(),
          ),
          title: TextHeading(
              title: "Appointment Details",
              fontweight: FontWeight.w700,
              fontsize: 14.sp,
              fontcolor: Colors.white),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          child: Obx(
            () => cartViewModel.getIsBookingDetailsLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 18.h,
                              ),

                              Container(
                                // height: 160.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                  color: AppColors.searchFieldsColor,
                                  border: Border.all(
                                    color: AppColors.signUpColor,
                                  ),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 10.h,
                                  ),
                                  child: Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: TextHeading(
                                              title: "Services",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12,
                                              fontcolor: Colors.white,
                                            ),
                                          ),
                                          Expanded(
                                            child: TextHeading(
                                              title: "Price",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12,
                                              fontcolor: AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      // SizedBox(
                                      //   height: 5.h,
                                      // ),

                                      ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: cartViewModel.getOrderDetail
                                                .orderItems?.length ??
                                            0,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          height: 5.h,
                                        ),
                                        itemBuilder: (context, index) {
                                          OrderItemModel item = cartViewModel
                                              .getOrderDetail
                                              .orderItems![index];
                                          return Row(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: TextHeading(
                                                  title: languageViewModel
                                                              .getSelectedLanguage ==
                                                          "English"
                                                      ? item.serviceTitle ??
                                                          "NA"
                                                      : item.serviceTitleArb ??
                                                          "NA",
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 12,
                                                  fontcolor: Colors.white,
                                                ),
                                              ),
                                              Expanded(
                                                child: TextHeading(
                                                    title:
                                                        "SAR ${item.serviceAmount ?? 0}",
                                                    fontweight: FontWeight.w400,
                                                    fontsize: 12,
                                                    fontcolor:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const BookingDateTimeWidget(),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                height: 84.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                    color: AppColors.searchFieldsColor,
                                    border: Border.all(
                                        color: AppColors.signUpColor),
                                    borderRadius: BorderRadius.circular(16.r)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Row(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: TextHeading(
                                              title: "convenience ",
                                              fontweight: FontWeight.w400,
                                              fontsize: 13,
                                              fontcolor: Colors.white,
                                            ),
                                          ),
                                          TextHeading(
                                            title: "SAR 00",
                                            fontweight: FontWeight.w400,
                                            fontsize: 12,
                                            fontcolor: AppColors.primaryColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          const Expanded(
                                            flex: 5,
                                            child: TextHeading(
                                              title: "Sub Total",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12,
                                              fontcolor: Colors.white,
                                            ),
                                          ),
                                          TextHeading(
                                            title:
                                                "SAR ${cartViewModel.getOrderDetail.order?.finalPayAmount ?? 0}",
                                            fontweight: FontWeight.w400,
                                            fontsize: 12,
                                            fontcolor: AppColors.primaryColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      const Row(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: TextHeading(
                                              title: "Coupon Discount",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12,
                                              fontcolor: Colors.white,
                                            ),
                                          ),
                                          TextHeading(
                                            title: "SAR 00",
                                            fontweight: FontWeight.w400,
                                            fontsize: 12,
                                            fontcolor: AppColors.primaryColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // InkWell(
                                  //   onTap: () => Get.back(),
                                  //   child: Container(
                                  //     height: 38.h,
                                  //     width: 110.w,
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //           color: AppColors.primaryColor,
                                  //           width: 1),
                                  //       borderRadius:
                                  //           BorderRadius.circular(8.r),
                                  //     ),
                                  //     child: Center(
                                  //       child: TextHeading(
                                  //           title: "Back",
                                  //           fontweight: FontWeight.w600,
                                  //           fontsize: 12.sp,
                                  //           fontcolor: AppColors.primaryColor),
                                  //     ),
                                  //   ),
                                  // ),
                                  InkWell(
                                    onTap: () => Get.until((route) =>
                                        route.settings.name ==
                                        Routes.exampleNavBarRoute),
                                    child: Container(
                                      height: 38.h,
                                      width: 110.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        border: Border.all(
                                            color: AppColors.primaryColor,
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Center(
                                        child: TextHeading(
                                          title: "Processing",
                                          fontweight: FontWeight.w600,
                                          fontsize: 12.sp,
                                          fontcolor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 280.h,
                              ),

                              // Spacer(),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return BottomSheetContent();
                                    },
                                  );
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ProfilePage(),
                                  //   ),
                                  // );
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 338.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Center(
                                    child: TextHeading(
                                      title: "May i help you?",
                                      fontweight: FontWeight.w600,
                                      fontsize: 10.sp,
                                      fontcolor: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
