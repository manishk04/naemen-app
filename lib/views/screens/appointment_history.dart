import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:naemen/models/salon_model.dart';
import 'package:naemen/routes/app_routes.dart';
import 'package:naemen/utils/app_functions.dart';
import 'package:naemen/utils/app_url.dart';
import 'package:naemen/view_models/auth_view_model.dart';
import 'package:naemen/view_models/salon_profile_view_model.dart';
import 'package:naemen/views/components/appointment_filter.dart';
import 'package:naemen/views/components/search_bar.dart';
import 'package:naemen/views/screens/appointment_detail_page.dart';
import 'package:naemen/views/screens/shop_page.dart';
import 'package:naemen/utils/color_constant.dart';

import '../../models/order_model.dart';
import '../../utils/app_enums.dart';
import '../../view_models/appointment_history_view_model.dart';
import '../../view_models/cart_view_model.dart';
import '../../view_models/language_view_model.dart';
import '../components/text_heading.dart';

class AppointmentHIstoreyPage extends StatefulWidget {
  const AppointmentHIstoreyPage({super.key});

  @override
  State<AppointmentHIstoreyPage> createState() =>
      _AppointmentHIstoreyPageState();
}

class _AppointmentHIstoreyPageState extends State<AppointmentHIstoreyPage> {
  final AppointmentHistoryViewModel _appointmentHistoryViewModel = Get.find();
  final LanguageViewModel _languageViewModel = Get.find();
  final AuthViewModel _authViewModel = Get.find();
  final CartViewModel _cartViewModel = Get.find();
  @override
  void initState() {
    _appointmentHistoryViewModel.fetchAppointmentHistory(_authViewModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: Colors.black,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context);
                  },
                  child: CircleAvatar(
                    radius: 15.h,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.5),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 5),
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
                    title: "Appointment History",
                    fontweight: FontWeight.w700,
                    fontsize: 14.sp,
                    fontcolor: Colors.white),
              ],
            ),
            centerTitle: true,
          ),
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Divider(
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SearchBarWidget(
                              hinttexttitle: "Search your appointment... "),
                          SizedBox(
                            height: 20.h,
                          ),
                          AppointmentFilter(
                            appointmentHistoryViewModel:
                                _appointmentHistoryViewModel,
                            authViewModel: _authViewModel,
                          ),
                          SizedBox(
                            height: 500.h,
                            width: double.infinity,
                            child: _appointmentHistoryViewModel.getIsLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: _appointmentHistoryViewModel
                                        .getOrders.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      OrderModel order =
                                          _appointmentHistoryViewModel
                                              .getOrders[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Container(
                                          height: 200.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color:
                                                  AppColors.searchFieldsColor,
                                              border: Border.all(
                                                  color: AppColors.signUpColor,
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: InkWell(
                                                          onTap: () {
                                                            // _salonProfileViewModel.onViewProfileClick(SalonModel(salonId: order.), cartViewModel);
                                                          },
                                                          child: Container(
                                                            height: 120.h,
                                                            width: 120.w,
                                                            decoration:
                                                                BoxDecoration(
                                                                    image:
                                                                        DecorationImage(
                                                                            image:
                                                                                NetworkImage(
                                                                              "${AppUrl.baseUrl}/${order.salonImage ?? "NA"}",
                                                                            ),
                                                                            fit: BoxFit
                                                                                .cover),
                                                                    color: Colors
                                                                        .blueGrey,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.r)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          TextHeading(
                                                              title: _languageViewModel
                                                                          .getSelectedLanguage ==
                                                                      "English"
                                                                  ? order.salonNameEng ??
                                                                      "NA"
                                                                  : order.salonNameArb ??
                                                                      "NA",
                                                              fontweight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontsize: 12.sp,
                                                              fontcolor: AppColors
                                                                  .primaryColor),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                color: AppColors
                                                                    .primaryColor,
                                                                size: 15,
                                                              ),
                                                              TextHeading(
                                                                  title:
                                                                      "4.3/5",
                                                                  fontweight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontsize:
                                                                      10.sp,
                                                                  fontcolor:
                                                                      Colors
                                                                          .white)
                                                            ],
                                                          ),
                                                        ],
                                                      ),
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
                                                              title:
                                                                  "${order.distance} Km From you",
                                                              fontweight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontsize: 12.sp,
                                                              fontcolor:
                                                                  Colors.white)
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      TextHeading(
                                                          title:
                                                              "${DateFormat('dd MMM, yyyy').format(DateTime.parse(order.orderGenerateTime ?? ""))} at ${DateFormat('HH:mm a').format(DateFormat("HH:mm:ss").parse(order.serviceStartTime ?? ""))} - ${DateFormat('HH:mm a').format(DateFormat("HH:mm:ss").parse(order.serviceEndTime ?? ""))}",
                                                          // "04 Apr,2024 at 02:00 PM - 03:00 PM",
                                                          fontweight:
                                                              FontWeight.w400,
                                                          fontsize: 8.sp,
                                                          fontcolor: AppColors
                                                              .primaryColor),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          TextHeading(
                                                              title:
                                                                  "Artist Name: ",
                                                              fontweight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontsize: 12.sp,
                                                              fontcolor:
                                                                  Colors.white),
                                                          TextHeading(
                                                              title: _languageViewModel
                                                                          .getSelectedLanguage ==
                                                                      "English"
                                                                  ? order.artistNameEng ??
                                                                      "NA"
                                                                  : order.artistNameArb ??
                                                                      "NA",
                                                              fontweight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontsize: 12.sp,
                                                              fontcolor: AppColors
                                                                  .bookmarkColor)
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              Divider(
                                                thickness: 0.5,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: InkWell(
                                                        onTap: () {
                                                          _cartViewModel
                                                              .fetchOrderDetails(
                                                                  order.orderNumber ??
                                                                      "");
                                                          Get.toNamed(Routes
                                                              .appointmentDetailRoute);
                                                        },
                                                        child: TextHeading(
                                                          title:
                                                              "View Orders >",
                                                          fontweight:
                                                              FontWeight.w400,
                                                          fontsize: 10.sp,
                                                          fontcolor: const Color
                                                              .fromRGBO(
                                                              180, 138, 0, 1),
                                                        ),
                                                      ),
                                                    ),
                                                    if (_appointmentHistoryViewModel
                                                            .getFilter ==
                                                        AppointmentFilterEnum
                                                            .upcoming)
                                                      Expanded(
                                                        child: InkWell(
                                                          onTap: () => openMap(
                                                              destinationLat:
                                                                  order.lat ??
                                                                      "",
                                                              destinationLng:
                                                                  order.lng ??
                                                                      ""),
                                                          child: Container(
                                                            height: 24,
                                                            width: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.r),
                                                              border: Border.all(
                                                                  width: 0.5,
                                                                  color: AppColors
                                                                      .signUpColor),
                                                            ),
                                                            child: Image.asset(
                                                                "assets/images/location3.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    if (order.serviceDate !=
                                                            null &&
                                                        order.serviceEndTime !=
                                                            null)
                                                      InkWell(
                                                        onTap: () {
                                                          // Navigator.push(
                                                          //     context,
                                                          //     MaterialPageRoute(
                                                          //         builder:
                                                          //             (context) =>
                                                          //                 AppointmentDetailPage()));
                                                        },
                                                        child: Container(
                                                          height: 23.h,
                                                          width: 72.w,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.r),
                                                              border: Border.all(
                                                                  color: AppColors
                                                                      .upcomingColor)),
                                                          child: Center(
                                                            child: TextHeading(
                                                                title: isAfterCurrent(
                                                                        "${order.serviceDate} ${order.serviceEndTime}")
                                                                    ? "Upcoming"
                                                                    : "Completed",
                                                                fontweight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontsize: 10.sp,
                                                                fontcolor: AppColors
                                                                    .upcomingColor),
                                                          ),
                                                        ),
                                                      )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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

        );
  }
}
