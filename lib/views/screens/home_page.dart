import 'dart:io';

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naemen/models/artist_model.dart';
import 'package:naemen/models/salon_model.dart';
import 'package:naemen/models/tag_model.dart';
import 'package:naemen/view_models/artist_profile_view_model.dart';
import 'package:naemen/views/components/crousel_slider.dart';
import 'package:naemen/views/screens/ProfilePage2.dart';
import 'package:naemen/views/screens/profile_page.dart';
import 'package:naemen/views/screens/search_page.dart';
import 'package:naemen/views/screens/venders_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view_models/cart_view_model.dart';
import '../../view_models/salon_profile_view_model.dart';
import '../components/artist_slider.dart';
import '../components/recommended.dart';
import '../../models/category_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_url.dart';
import '../../utils/color_constant.dart';
import '../../view_models/auth_view_model.dart';
import '../../view_models/home_view_model.dart';
import '../../view_models/language_view_model.dart';
import '../components/newely_added.dart';
import '../components/text_heading.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

List serviceName = ["Barber", "Salon", "SPA"];
List imagesHome = [
  "assets/images/barbar_namen.jpg",
  "assets/images/salon_namen.jpg",
  "assets/images/spa_namen.jpg",
];

class _HomeViewState extends State<HomeView> {
  PageController pageController1 = PageController();

  AuthViewModel authViewModel = Get.find();
  HomeViewModel homeViewModel = Get.find();
  LanguageViewModel languageViewModel = Get.find();
  File? _image;

  Future<void> _loadImageFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profile_image');
    if (imagePath != null && File(imagePath).existsSync()) {
      setState(() {
        _image = File(imagePath); // Convert path to File object
      });
    }
  }

  ArtistProfileViewModel artistProfileViewModel = Get.find();
  CartViewModel cartViewModel = Get.find();
  final SalonProfileViewModel salonProfileViewModel = Get.find();

  void initState() {
    super.initState();
    _loadImageFromPreferences();
    homeViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    // TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: 390.w,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.black
                    // image: DecorationImage(
                    //     image: AssetImage(
                    //         "assets/images/abstract-geometric-background-shapes-texture 1.png"),
                    //     fit: BoxFit.cover)
                    ),
              ),
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SearchPage()));
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/images/Location.png"),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextHeading(
                                          title: "Home",
                                          fontweight: FontWeight.w600,
                                          fontsize: 12.sp,
                                          fontcolor: isDark
                                              ? Colors.white
                                              : Colors.white,
                                          maxLines: 1,
                                        ),
                                        SizedBox(height: 3.h),
                                        Obx(
                                          () => Container(
                                            width: 170.w,
                                            child: Text(
                                              authViewModel.getAddress,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              // fontweight: FontWeight.w300,
                                              // fontsize: 10.sp,
                                              // fontcolor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //       Switch(
                            //   value: AdaptiveTheme.of(context).mode.isDark,
                            //   onChanged: (value) {
                            //     if (value) {
                            //       AdaptiveTheme.of(context).setDark();
                            //     } else {
                            //       AdaptiveTheme.of(context).setLight();
                            //     }
                            //   },
                            // ),
                            //SizedBox(width: 85.w),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()));
                              },
                              child: CircleAvatar(
                                radius: 17,
                                backgroundImage: _image != null
                                    ? FileImage(_image!)
                                    : AssetImage(
                                            "assets/images/profile_image.png")
                                        as ImageProvider,
                                // AssetImage(
                                //     "assets/images/profile_image.png"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        // SearchBarWidget(
                        //   hinttexttitle: "Search your favorite hair expert...",
                        // ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        Obx(
                          () => homeViewModel.getBanners.isNotEmpty
                              ? HomePageSlider(
                                  banners: homeViewModel.getBanners,
                                  pageController2: PageController(),
                                )
                              : const SizedBox(),
                        ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // Container(
                        //   height: 490.h,
                        //   width: double.infinity,
                        //   child: ListView.builder(
                        //     itemCount: imagesHome.length,
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     itemBuilder: (context, index) {
                        //       return Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Stack(
                        //           children: [
                        //             Container(
                        //                 height: 150.h,
                        //                 width: 341.w,
                        //                 decoration: BoxDecoration(
                        //                     image: DecorationImage(
                        //                         image:
                        //                             AssetImage(imagesHome[index]),
                        //                         fit: BoxFit.cover),
                        //                     color: Colors.grey,
                        //                     borderRadius:
                        //                         BorderRadius.circular(10.r))),
                        //             Container(
                        //                 height: 150.h,
                        //                 width: 341.w,
                        //                 decoration: BoxDecoration(
                        //                     gradient: LinearGradient(
                        //                       begin: Alignment.bottomCenter,
                        //                       end: Alignment.centerLeft,
                        //                       colors: <Color>[
                        //                         Color(0xff000000)
                        //                             .withOpacity(0.1),
                        //                         Color(0xff000000)
                        //                             .withOpacity(0.8),
                        //                       ],
                        //                     ),
                        //                     borderRadius:
                        //                         BorderRadius.circular(10.r))),
                        //             Positioned(
                        //               left: 15,
                        //               top: 65,
                        //               child: TextHeading(
                        //                   title: serviceName[index],
                        //                   fontweight: FontWeight.w700,
                        //                   fontsize: 30.sp,
                        //                   fontcolor: Colors.yellow.shade300),
                        //             )
                        //           ],
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // Obx(
                        //   () => homeViewModel.getHomeCategories.isNotEmpty
                        //       ? InkWell(
                        //           onTap: () => Get.toNamed(Routes.categoryRoute),
                        //           child: Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               TextHeading(
                        //                   title: "Categories",
                        //                   fontweight: FontWeight.w600,
                        //                   fontsize: 12.sp,
                        //                   fontcolor: Colors.white),
                        //               TextHeading(
                        //                   title: "View all",
                        //                   fontweight: FontWeight.w400,
                        //                   fontsize: 10.sp,
                        //                   fontcolor: Colors.white)
                        //             ],
                        //           ),
                        //         )
                        //       : SizedBox(),
                        // ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // CategoryListWidget(
                        //   homeViewModel: homeViewModel,
                        //   languageViewModel: languageViewModel,
                        //   canNavigate: true,
                        // ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Obx(
                          () => homeViewModel.getIsHomeLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: homeViewModel.getTags.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 15.h,
                                  ),
                                  itemBuilder: (context, index) {
                                    TagModel tag = homeViewModel.getTags[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (tag.salons != null &&
                                            tag.salons!.isNotEmpty)
                                          TextHeading(
                                            title: languageViewModel
                                                        .getSelectedLanguage ==
                                                    "English"
                                                ? tag.titleEng ?? ""
                                                : tag.titleArb ?? "",
                                            fontweight: FontWeight.w600,
                                            fontsize: 12.sp,
                                            fontcolor: Colors.white,
                                          ),
                                        if (tag.salons != null &&
                                            tag.salons!.isNotEmpty)
                                          SizedBox(
                                            height: 25.h,
                                          ),
                                        if (tag.salons != null &&
                                            tag.salons!.isNotEmpty &&
                                            tag.titleEng ==
                                                "Newly Added Saloons")
                                          SizedBox(
                                            height: 255.h,
                                            width: double.infinity,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: tag.salons!.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                SalonModel salon =
                                                    tag.salons![index];
                                                return WinterSpecialItems(
                                                  image: salon.salonImage ?? "",
                                                  status: languageViewModel
                                                              .getSelectedLanguage ==
                                                          "English"
                                                      ? "Status:"
                                                      : "Status:",
                                                  statusValue:
                                                      (salon.salonStatus ?? "")
                                                          .toString(),
                                                  description: languageViewModel
                                                              .getSelectedLanguage ==
                                                          "English"
                                                      ? salon.salonNameEng ?? ""
                                                      : salon.salonNameArb ??
                                                          "",
                                                  type: languageViewModel
                                                              .getSelectedLanguage ==
                                                          "English"
                                                      ? "Saloon Type:"
                                                      : "Saloon Type:",
                                                  typeValue:
                                                      salon.salonType ?? "NA",
                                                  distance:
                                                      salon.distance ?? 0.00,
                                                  salon: salon,
                                                );
                                              },
                                            ),
                                          ),
                                        if (tag.salons != null &&
                                            tag.salons!.isNotEmpty &&
                                            tag.titleEng == "Top Rated Artist")
                                          SizedBox(
                                              height: 255.h,
                                              width: double.infinity,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      (tag.salons ?? []).length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    SalonModel salon =
                                                        (tag.salons ??
                                                            [])[index];
                                                    return Stack(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          height: 252.h,
                                                          width: 200.w,
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .searchFieldsColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.r),
                                                              border: Border.all(
                                                                  color: AppColors
                                                                      .signUpColor,
                                                                  width: 0.2)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      5),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5.h,
                                                              ),
                                                              Expanded(
                                                                flex: 4,
                                                                child:
                                                                    Container(
                                                                  width: 190.w,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.r),
                                                                    image: salon.salonImage !=
                                                                            null
                                                                        ? DecorationImage(
                                                                            image:
                                                                                NetworkImage("${AppUrl.baseUrl}/${salon.salonImage ?? ""}"),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          )
                                                                        : null,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 6,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    //SizedBox(height: 5.h,),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        TextHeading(
                                                                          title: languageViewModel.getSelectedLanguage == "en"
                                                                              ? salon.artistNameEng ?? ""
                                                                              : salon.artistNameArb ?? "",
                                                                          fontweight:
                                                                              FontWeight.w600,
                                                                          fontsize:
                                                                              12.sp,
                                                                          fontcolor:
                                                                              Colors.white,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Icon(
                                                                              Icons.star,
                                                                              color: AppColors.primaryColor,
                                                                            ),
                                                                            SizedBox(width: 3),
                                                                            TextHeading(
                                                                              title: "4.3/5",
                                                                              fontweight: FontWeight.w600,
                                                                              fontsize: 12.sp,
                                                                              fontcolor: Colors.white,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),

                                                                    SizedBox(
                                                                      height:
                                                                          3.h,
                                                                    ),

                                                                    Row(
                                                                      children: [
                                                                        TextHeading(
                                                                          title:
                                                                              "Work at",
                                                                          fontweight:
                                                                              FontWeight.w400,
                                                                          fontsize:
                                                                              12.sp,
                                                                          fontcolor:
                                                                              Colors.white,
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                3.w),
                                                                        TextHeading(
                                                                          title: languageViewModel.getSelectedLanguage == "en"
                                                                              ? salon.salonNameEng ?? ""
                                                                              : salon.salonNameArb ?? "",
                                                                          fontweight:
                                                                              FontWeight.w400,
                                                                          fontsize:
                                                                              12.sp,
                                                                          fontcolor:
                                                                              AppColors.primaryColor,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            3.h),
                                                                    Row(
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          "assets/images/location-svgrepo-com 1.png",
                                                                          color:
                                                                              AppColors.primaryColor,
                                                                        ),
                                                                        TextHeading(
                                                                            title:
                                                                                "${double.parse((salon.distance ?? 0.00).toString()).toStringAsFixed(2)} km",
                                                                            fontweight:
                                                                                FontWeight.w400,
                                                                            fontsize: 12.sp,
                                                                            fontcolor: Colors.white)
                                                                      ],
                                                                    ),

                                                                    SizedBox(
                                                                      height:
                                                                          5.h,
                                                                    ),
                                                                    Row(
                                                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              34.h,
                                                                          width:
                                                                              34.w,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: AppColors.signUpColor, width: 0.2),
                                                                              color: Colors.black,
                                                                              borderRadius: BorderRadius.circular(8.r)),
                                                                          child: Center(
                                                                              child: Icon(
                                                                            Icons.bookmark_add_outlined,
                                                                            color:
                                                                                Colors.white,
                                                                          )),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              50.w,
                                                                        ),
                                                                        InkWell(
                                                                          onTap: () => artistProfileViewModel.onViewProfileClick(
                                                                              ArtistModel(id: salon.artistId),
                                                                              cartViewModel,
                                                                              authViewModel),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                34.h,
                                                                            width:
                                                                                102.w,
                                                                            decoration:
                                                                                BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(8.r)),
                                                                            child:
                                                                                Center(
                                                                              child: TextHeading(
                                                                                title: "View Profile",
                                                                                fontweight: FontWeight.w400,
                                                                                fontsize: 12.sp,
                                                                                fontcolor: Colors.white,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
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
                                                  })),
                                        if (tag.salons != null &&
                                            tag.salons!.isNotEmpty &&
                                            tag.titleEng == "Recommendation")
                                          Container(
                                            height: 255.h,
                                            width: double.infinity,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  (tag.salons ?? []).length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                SalonModel salon =
                                                    (tag.salons ?? [])[index];
                                                return Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 10),
                                                      height: 252.h,
                                                      width: 200.w,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .searchFieldsColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16
                                                                      .r),
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .signUpColor,
                                                              width: 0.2)),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 5.h,
                                                          ),
                                                          Expanded(
                                                            flex: 4,
                                                            child: Container(
                                                              width: 190.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.r),
                                                                image: salon.salonImage !=
                                                                        null
                                                                    ? DecorationImage(
                                                                        image: NetworkImage(
                                                                            "${AppUrl.baseUrl}/${salon.salonImage ?? ""}"),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      )
                                                                    : null,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                //SizedBox(height: 5.h,),
                                                                Row(
                                                                  children: [
                                                                    TextHeading(
                                                                        title:
                                                                            "Status",
                                                                        fontweight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontsize: 12
                                                                            .sp,
                                                                        fontcolor:
                                                                            Colors.white),
                                                                    SizedBox(
                                                                      width:
                                                                          3.w,
                                                                    ),
                                                                    TextHeading(
                                                                        title: salon.salonStatus ==
                                                                                "2"
                                                                            ? "OFF"
                                                                            : salon.salonStatus ==
                                                                                    "1"
                                                                                ? "ON"
                                                                                : "",
                                                                        fontweight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontsize: 12
                                                                            .sp,
                                                                        fontcolor:
                                                                            AppColors.primaryColor)
                                                                  ],
                                                                ),

                                                                SizedBox(
                                                                  height: 3.h,
                                                                ),

                                                                TextHeading(
                                                                    title: languageViewModel.getSelectedLanguage ==
                                                                            "en"
                                                                        ? salon.salonNameEng ??
                                                                            ""
                                                                        : salon.salonNameArb ??
                                                                            "",
                                                                    fontweight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontsize:
                                                                        12.sp,
                                                                    fontcolor:
                                                                        Colors
                                                                            .white),
                                                                Row(
                                                                  children: [
                                                                    TextHeading(
                                                                        title:
                                                                            "Saloon Type",
                                                                        fontweight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontsize: 12
                                                                            .sp,
                                                                        fontcolor:
                                                                            Colors.white),
                                                                    SizedBox(
                                                                      width:
                                                                          3.w,
                                                                    ),
                                                                    TextHeading(
                                                                      title:
                                                                          salon.salonType ??
                                                                              "",
                                                                      fontweight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontsize:
                                                                          12.sp,
                                                                      fontcolor:
                                                                          AppColors
                                                                              .primaryColor,
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        3.h),
                                                                Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      "assets/images/location-svgrepo-com 1.png",
                                                                      color: AppColors
                                                                          .primaryColor,
                                                                    ),
                                                                    TextHeading(
                                                                        title:
                                                                            "${double.parse("${salon.distance ?? 0.00}").toStringAsFixed(2)} km",
                                                                        fontweight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontsize: 12
                                                                            .sp,
                                                                        fontcolor:
                                                                            Colors.white)
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5.h,
                                                                ),
                                                                Row(
                                                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          34.h,
                                                                      width:
                                                                          34.w,
                                                                      decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              color: AppColors
                                                                                  .signUpColor,
                                                                              width:
                                                                                  0.2),
                                                                          color: Colors
                                                                              .black,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.r)),
                                                                      child: Center(
                                                                          child: Icon(
                                                                        Icons
                                                                            .bookmark_add_outlined,
                                                                        color: Colors
                                                                            .white,
                                                                      )),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          50.w,
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () => salonProfileViewModel.onViewProfileClick(
                                                                          salon,
                                                                          cartViewModel),
                                                                      child: Container(
                                                                          height: 34
                                                                              .h,
                                                                          width: 102
                                                                              .w,
                                                                          decoration: BoxDecoration(
                                                                              color: AppColors.bookmarkColor,
                                                                              borderRadius: BorderRadius.circular(8.r)),
                                                                          child: Center(child: TextHeading(title: "View Profile", fontweight: FontWeight.w400, fontsize: 12.sp, fontcolor: Colors.white))),
                                                                    )
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
                                              },
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                        ),

                        // // NewelyWidget(
                        // //   status: "Status:",
                        // //   description: 'Chameleon salon',
                        // //   type: 'Saloon Type:',
                        // //   image: 'assets/images/newly.png',
                        // //   statuValue: 'ONLINE',
                        // //   typeValue: 'Unisex',
                        // // ),
                        // SizedBox(height: 20.h),
                        // TextHeading(
                        //     title: "Top Rated Artist",
                        //     fontweight: FontWeight.w600,
                        //     fontsize: 12.sp,
                        //     fontcolor: Colors.white),
                        // SizedBox(
                        //   height: 25.h,
                        // ),
                        // ArtistSlider(),

                        // // const NewelyWidget(
                        // //   status: "Status:",
                        // //   description: 'Chameleon salon',
                        // //   type: 'Saloon Type:',
                        // //   image: 'assets/images/newly.png',
                        // //   statuValue: 'ONLINE',
                        // //   typeValue: 'Unisex',
                        // // ),
                        // // ArtistSlider(status: 'Status', statuValue: 'Online', description: '2q4qrw', type: 'rewrwr', typeValue: 'wdad', image: 'assets/images/newly.png',),

                        // //ArtistSliderWidget( ),

                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // TextHeading(
                        //     title: "Recommended",
                        //     fontweight: FontWeight.w600,
                        //     fontsize: 12.sp,
                        //     fontcolor: Colors.white),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // Recommended(
                        //   status: "Status:",
                        //   description: 'Chameleon salon',
                        //   type: 'Saloon Type:',
                        //   image: 'assets/images/newly.png',
                        //   statuValue: 'ONLINE',
                        //   typeValue: 'Unisex',
                        // ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        Obx(
                          () => homeViewModel.getAllCategories.isNotEmpty
                              ? TextHeading(
                                  title: "Categories",
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontcolor: Colors.white)
                              : const SizedBox(),
                        ),
                        Obx(
                          () => SizedBox(
                            height: homeViewModel.getAllCategories.isNotEmpty
                                ? 20.h
                                : 0.h,
                          ),
                        ),
                        Obx(
                          () => homeViewModel.getAllCategories.isNotEmpty
                              ? SizedBox(
                                  height: 200.h,
                                  width: double.infinity,
                                  child: GridView.builder(
                                    shrinkWrap: false,
                                    itemCount:
                                        homeViewModel.getAllCategories.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1.5,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      CategoryModel category =
                                          homeViewModel.getAllCategories[index];
                                      return InkWell(
                                        onTap: () => homeViewModel
                                            .onCategorySelect(category, true),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 87.h,
                                              width: 165.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors
                                                      .searchFieldsColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 35),
                                                child: TextHeading(
                                                  title: languageViewModel
                                                              .getSelectedLanguage ==
                                                          "English"
                                                      ? category
                                                              .categoryTitle ??
                                                          "NA"
                                                      : category.categoryArb ??
                                                          "NA",
                                                  fontweight: FontWeight.w600,
                                                  fontsize: 14.sp,
                                                  fontcolor:
                                                      AppColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: -8,
                                              top: 7.6,
                                              child: Transform.rotate(
                                                angle: -pi / 10,
                                                child: Container(
                                                  height: 72.h,
                                                  width: 80.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.r),
                                                            topRight:
                                                                Radius
                                                                    .circular(
                                                                        10.r),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10.r),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10.r)),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${AppUrl.baseUrl}/${category.categoryImage}"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : const SizedBox(),
                        ),

                        SizedBox(
                          height: 30.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
    required this.homeViewModel,
    required this.languageViewModel,
    this.canNavigate = false,
  });

  final HomeViewModel homeViewModel;
  final LanguageViewModel languageViewModel;
  final bool canNavigate;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeViewModel.getHomeCategories.isNotEmpty
          ? SizedBox(
              height: 52.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  CategoryModel category =
                      homeViewModel.getHomeCategories[index];
                  return InkWell(
                    onTap: () =>
                        homeViewModel.onCategorySelect(category, canNavigate),
                    child: SizedBox(
                      height: 52.h,
                      // width: 108.w,
                      child: Card(
                        color: AppColors.searchFieldsColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                            color: AppColors
                                .signUpColor, // Set the border color here
                            width: 1.0, // Set the border width here
                          ),
                        ),
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CachedNetworkImage(
                                height: 52.h,
                                width: 52.w,
                                imageUrl:
                                    "${AppUrl.baseUrl}/${category.categoryImage}",
                                placeholder: (context, url) => SizedBox(
                                  height: 52.h,
                                  width: 52.w,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              TextHeading(
                                  title:
                                      languageViewModel.getSelectedLanguage ==
                                              "English"
                                          ? category.categoryTitle ?? ""
                                          : category.categoryArb ?? "",
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontcolor: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                itemCount: homeViewModel.getHomeCategories.length,
              ),
            )
          : SizedBox(),
    );
  }
}
