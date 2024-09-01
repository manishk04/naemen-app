import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naemen/view_models/language_view_model.dart';

import '../../models/artist_service_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/color_constant.dart';
import '../../view_models/artist_profile_view_model.dart';
import '../../view_models/cart_view_model.dart';
import '../components/booking_dattime_widget.dart';
import '../components/text_heading.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    CartViewModel cartViewModel = Get.find();
    ArtistProfileViewModel artistProfileViewModel = Get.find();
    LanguageViewModel languageViewModel = Get.find();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  InkWell(
                    onTap: () {
                      cartViewModel.clearServices();
                      artistProfileViewModel.resetOrderData();
                      Get.until((route) =>
                          route.settings.name == Routes.artistProfileRoute);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 15.h,
                            backgroundColor: Colors.yellow.withOpacity(0.6),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/orderImage.png",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: TextHeading(
                      title: "Let's Get You\n    Groomed",
                      fontweight: FontWeight.w800,
                      fontsize: 20.sp,
                      fontcolor: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextHeading(
                    title:
                        "Congratulations! Your appointment has been successfully booked.Thank you for choosing us looking forward to see you on time on your appointment. Drive safe",
                    fontweight: FontWeight.w400,
                    fontsize: 12.sp,
                    fontcolor: Colors.white,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const BookingDateTimeWidget(), // DateTime, Artist and Gender
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 160.h,
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
                          // const Divider(),
                          // SizedBox(
                          //   height: 5.h,
                          // ),

                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: cartViewModel.getAddedServiceList.length,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 5.h,
                            ),
                            itemBuilder: (context, index) {
                              ArtistServiceModel service =
                                  cartViewModel.getAddedServiceList[index];
                              return Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: TextHeading(
                                        title: languageViewModel
                                                    .getSelectedLanguage ==
                                                "English"
                                            ? service.categoryTitle ?? "NA"
                                            : service.categoryArb ?? "NA",
                                        fontweight: FontWeight.w400,
                                        fontsize: 12,
                                        fontcolor: Colors.white),
                                  ),
                                  Expanded(
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
                    height: 20.h,
                  ),
                  Container(
                    height: 84.h,
                    width: 340.w,
                    decoration: BoxDecoration(
                        color: AppColors.searchFieldsColor,
                        border: Border.all(color: AppColors.signUpColor),
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                title: "SAR 05",
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
                                  title: "Sub Total",
                                  fontweight: FontWeight.w400,
                                  fontsize: 12,
                                  fontcolor: Colors.white,
                                ),
                              ),
                              TextHeading(
                                title: "SAR 95",
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
                                title: "SAR 72",
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
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      cartViewModel.clearServices();
                      artistProfileViewModel.resetOrderData();
                      Get.until((route) =>
                          route.settings.name == Routes.bottomBarRoute);
                    },
                    child: Container(
                      height: 40.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: TextHeading(
                          title: "Home",
                          fontweight: FontWeight.w600,
                          fontsize: 16.sp,
                          fontcolor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
