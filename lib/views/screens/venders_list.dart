import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naemen/models/salon_model.dart';
import 'package:naemen/utils/app_url.dart';
import 'package:naemen/view_models/cart_view_model.dart';
import 'package:naemen/view_models/home_view_model.dart';
import 'package:naemen/view_models/language_view_model.dart';
import 'package:naemen/view_models/salon_profile_view_model.dart';
import 'package:naemen/views/components/search_bar.dart';
import 'package:naemen/utils/color_constant.dart';

import '../components/newely_added.dart';
import '../components/text_heading.dart';
import 'home_page.dart';

class VendersPage extends StatefulWidget {
  const VendersPage({super.key});

  @override
  State<VendersPage> createState() => _VendersPageState();
}

List<String> shopname = [
  "Cuts Barber shop",
  "Nail saloon",
  "Kiko Nail SPA",
  "Pretty Wow",
  "House Of Cutes"
];

List<String> Saloontime = [
  "10:00 Am - 9:00 Pm",
  "09:00 Am - 08:00 Pm",
  "10:00 Am - 10:00 Pm",
  "10:00 Am - 07:00 Pm",
  "09:00 Am - 9:00 Pm"
];

List<String> ShopImage = [
  "assets/images/vender_list_img1.jpeg",
  "assets/images/vender_list_img2.jpeg",
  "assets/images/vendrt+list_img3.jpeg",
  "assets/images/vender_list_img4.jpeg",
  "assets/images/vender_list_img5.jpeg"
];

HomeViewModel _homeViewModel = Get.find();
LanguageViewModel _languageViewModel = Get.find();
SalonProfileViewModel _salonProfileViewModel = Get.find();
CartViewModel _cartViewModel = Get.find();

class _VendersPageState extends State<VendersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: TextHeading(
              title: "Business List",
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Divider(
                  color: AppColors.primaryColor,
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
                      // const ReUsableRow(),
                      CategoryListWidget(
                          homeViewModel: _homeViewModel,
                          languageViewModel: _languageViewModel),
                      SizedBox(
                        height: 500.h,
                        width: double.infinity,
                        child: Obx(
                          () => _homeViewModel.getIsStoresByCategoryLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                )
                              : _homeViewModel.getVenderList.data == null ||
                                      (_homeViewModel
                                                  .getVenderList.data?.length ??
                                              0) ==
                                          0
                                  ? Center(
                                      child: TextHeading(
                                        title: "Businesses Not Found",
                                        fontweight: FontWeight.w700,
                                        fontsize: 14.sp,
                                        fontcolor: Colors.white,
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: _homeViewModel
                                              .getVenderList.data?.length ??
                                          0,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        SalonModel salon = _homeViewModel
                                            .getVenderList.data![index];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Container(
                                            height: 150.h,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColors.searchFieldsColor,
                                                border: Border.all(
                                                    color:
                                                        AppColors.signUpColor,
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10),
                                                          child: InkWell(
                                                            onTap: () =>
                                                                _salonProfileViewModel
                                                                    .onViewProfileClick(
                                                                        salon,
                                                                        _cartViewModel),
                                                            child: Container(
                                                              height: 120.h,
                                                              width: 120.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        "${AppUrl.baseUrl}/${salon.salonImage ?? ""}"),
                                                                    fit: BoxFit
                                                                        .cover),
                                                                color: Colors
                                                                    .blueGrey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.r),
                                                              ),
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
                                                                color: AppColors
                                                                    .primaryColor,
                                                                size: 20,
                                                              ),
                                                              SizedBox(
                                                                width: 3.w,
                                                              ),
                                                              TextHeading(
                                                                  title:
                                                                      "4.3/5",
                                                                  fontweight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontsize:
                                                                      12.sp,
                                                                  fontcolor:
                                                                      Colors
                                                                          .white)
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        TextHeading(
                                                            title: _languageViewModel
                                                                        .getSelectedLanguage ==
                                                                    "English"
                                                                ? salon.salonNameEng ??
                                                                    ""
                                                                : salon.salonNameArb ??
                                                                    "",
                                                            fontweight:
                                                                FontWeight.w400,
                                                            fontsize: 12.sp,
                                                            fontcolor: AppColors
                                                                .primaryColor),
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
                                                            TextHeading(
                                                                title:
                                                                    "${(salon.distance ?? 0.0).toStringAsFixed(2)} Km From you",
                                                                fontweight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontsize: 12.sp,
                                                                fontcolor:
                                                                    Colors
                                                                        .white)
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.alarm,
                                                              color: AppColors
                                                                  .primaryColor,
                                                              weight: 0.5,
                                                              size: 20,
                                                            ),
                                                            SizedBox(
                                                              width: 3.w,
                                                            ),
                                                            TextHeading(
                                                                title:
                                                                    Saloontime[
                                                                        index],
                                                                fontweight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontsize: 12.sp,
                                                                fontcolor:
                                                                    Colors
                                                                        .white)
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            TextHeading(
                                                                title:
                                                                    "      Kids : ",
                                                                fontweight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontsize: 12.sp,
                                                                fontcolor:
                                                                    Colors
                                                                        .white),
                                                            TextHeading(
                                                                title: salon.kidsSalonService !=
                                                                        null
                                                                    ? "Available"
                                                                    : "Not Available",
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
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    SalonGenderWidget(
                                                      salonGender:
                                                          salon.storeGender ??
                                                              "",
                                                      color: AppColors
                                                          .searchFieldsColor,
                                                    ),
                                                    // Container(
                                                    //   height: 24.h,
                                                    //   width: 24.w,
                                                    //   decoration: BoxDecoration(
                                                    //       border: Border.all(
                                                    //           color: AppColors
                                                    //               .primaryColor),
                                                    //       borderRadius:
                                                    //           BorderRadius
                                                    //               .circular(
                                                    //                   5.r)),
                                                    //   child: Image.asset(
                                                    //       "assets/images/venderImage.png"),
                                                    // )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
