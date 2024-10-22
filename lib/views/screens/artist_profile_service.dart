import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naemen/models/store_service_model.dart';
import 'package:naemen/view_models/artist_profile_view_model.dart';
import 'package:naemen/view_models/language_view_model.dart';
import 'package:naemen/views/screens/dropdown_button.dart';
import 'package:naemen/utils/color_constant.dart';

import '../../utils/app_url.dart';
import '../../view_models/cart_view_model.dart';
import '../components/newely_added.dart';
import '../components/text_heading.dart';

class ArtistProfileService extends StatefulWidget {
  const ArtistProfileService({super.key});

  @override
  State<ArtistProfileService> createState() => _ArtistProfileServiceState();
}

class _ArtistProfileServiceState extends State<ArtistProfileService> {
  final ArtistProfileViewModel _artistProfileViewModel = Get.find();
  final LanguageViewModel _languageViewModel = Get.find();
  final CartViewModel cartViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
            () => _artistProfileViewModel.getIsLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    AppColors.primaryColor.withOpacity(0.5),
                                radius: 15,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            TextHeading(
                              title: "Artist Profile and Services",
                              fontweight: FontWeight.w700,
                              fontsize: 12.sp,
                              fontcolor: Colors.white,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  AppColors.primaryColor.withOpacity(0.5),
                              child: const Icon(
                                Icons.bookmark,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          // height: 134.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                            color: AppColors.searchFieldsColor,
                            border: Border.all(
                                color: AppColors.signUpColor, width: 0.2),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    "${AppUrl.baseUrl}/${_artistProfileViewModel.getSelectedArtist.artistImage ?? ""}",
                                    height: 134.h,
                                    width: 134.w,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextHeading(
                                        title: _languageViewModel
                                                    .getSelectedLanguage ==
                                                "English"
                                            ? _artistProfileViewModel
                                                    .getSelectedArtist
                                                    .artistNameEng ??
                                                ""
                                            : _artistProfileViewModel
                                                    .getSelectedArtist
                                                    .artistNameArb ??
                                                "",
                                        fontweight: FontWeight.w700,
                                        fontsize: 14.sp,
                                        fontcolor: Colors.white,
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 18,
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
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextHeading(
                                            title: "Work at: ",
                                            fontweight: FontWeight.w600,
                                            fontsize: 12.sp,
                                            fontcolor: Colors.white,
                                            maxLines: 2,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Expanded(
                                            child: TextHeading(
                                              title: _languageViewModel
                                                          .getSelectedLanguage ==
                                                      "English"
                                                  ? _artistProfileViewModel
                                                          .getSelectedArtist
                                                          .salonNameEng ??
                                                      ""
                                                  : _artistProfileViewModel
                                                          .getSelectedArtist
                                                          .salonNameArb ??
                                                      "",
                                              fontweight: FontWeight.w600,
                                              fontsize: 12.sp,
                                              fontcolor: AppColors.primaryColor,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            "assets/images/mark_Location.png",
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          TextHeading(
                                            title:
                                                "${(cartViewModel.getSelectedStore.distance ?? 0.0).toStringAsFixed(2)} Km From you",
                                            fontweight: FontWeight.w400,
                                            fontsize: 12.sp,
                                            fontcolor: Colors.white,
                                            maxLines: 2,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextHeading(
                          title: "Services",
                          fontweight: FontWeight.w700,
                          fontsize: 14.sp,
                          fontcolor: Colors.white,
                        ),
                        Obx(
                          () => cartViewModel.getAddedServiceList.isNotEmpty
                              ? Container(
                                  // height: 60.h,
                                  // width: 340.w,
                                  margin: EdgeInsets.symmetric(vertical: 10.h),
                                  decoration: BoxDecoration(
                                      // color: Colors.red,
                                      // border: Border.all(color: Colors.grey),
                                      // borderRadius:
                                      //     BorderRadius.circular(16.r)
                                      ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextHeading(
                                        title:
                                            "${cartViewModel.getAddedServiceList.length} ${cartViewModel.getAddedServiceList.length > 1 ? "Services" : "Service"} added",
                                        fontweight: FontWeight.w600,
                                        fontsize: 12.sp,
                                        fontcolor: Colors.white,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _artistProfileViewModel
                                              .showDateTimeDialog();
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>AppointmentScreen()));
                                        },
                                        child: Obx(
                                          () => _artistProfileViewModel
                                                  .getIsBooking
                                              ? const CircularProgressIndicator(
                                                  color: AppColors.primaryColor)
                                              : Container(
                                                  height: 32.h,
                                                  width: 148.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextHeading(
                                                          title:
                                                              "Book appointment",
                                                          fontweight:
                                                              FontWeight.w600,
                                                          fontsize: 12.sp,
                                                          fontcolor:
                                                              Colors.white),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      const Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 13,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        ListView.separated(
                            shrinkWrap: true,
                            itemCount:
                                _artistProfileViewModel.getStoreServices.length,
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10.h,
                                ),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              StoreServiceModel storeService =
                                  _artistProfileViewModel
                                      .getStoreServices[index];
                              return Container(
                                // height: 650.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                  color: AppColors.searchFieldsColor,
                                  border: Border.all(
                                      color: AppColors.bottomBarColor),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child:
                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                        initiallyExpanded: true,
                                        iconColor: Colors.white,
                                        controller: _artistProfileViewModel
                                            .getControllers[index],
                                        title: TextHeading(
                                            title:
                                                "${_languageViewModel.getSelectedLanguage == "English" ? storeService.category?.categoryTitle ?? "NA" : storeService.category?.categoryArb ?? "NA"} (${storeService.category?.totalServices ?? "0"})",
                                            fontweight: FontWeight.w600,
                                            fontsize: 12,
                                            fontcolor: Colors.white),
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          ExpansionTileControllerApp(
                                            services:
                                                storeService.services ?? [],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                        ]

                                        // DropdownButtonPage()

                                        ),
                                  ),
                                ),
                              );
                            }),
                        // ExpansionTileControllerApp(
                        //   services: _artistProfileViewModel.getStoreServices,
                        // ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // TextHeading(
                        //     title: "Recommended Artists",
                        //     fontweight: FontWeight.w700,
                        //     fontsize: 12.sp,
                        //     fontcolor: Colors.white),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // const NewelyWidget(
                        //   status: "Status:",
                        //   description: 'Chameleon salon',
                        //   type: 'Saloon Type:',
                        //   image: 'assets/images/newly.png',
                        //   statuValue: 'ONLINE',
                        //   typeValue: 'Unisex',
                        // ),
                        SizedBox(
                          height: 20.h,
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
