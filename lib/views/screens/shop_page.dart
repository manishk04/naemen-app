import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naemen/models/artist_model.dart';
import 'package:naemen/utils/app_url.dart';
import 'package:naemen/view_models/artist_profile_view_model.dart';
import 'package:naemen/view_models/auth_view_model.dart';
import 'package:naemen/view_models/cart_view_model.dart';
import 'package:naemen/view_models/home_view_model.dart';
import 'package:naemen/view_models/language_view_model.dart';
import 'package:naemen/view_models/salon_profile_view_model.dart';
import 'package:naemen/views/components/crousel_slider.dart';

import 'package:naemen/views/components/rating_bar.dart';
import 'package:naemen/utils/color_constant.dart';

import '../components/text_heading.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  PageController pageController2 = PageController();
// late final PageController   pageController2;
  final SalonProfileViewModel _salonProfileViewModel = Get.find();
  final LanguageViewModel _languageViewModel = Get.find();
  final ArtistProfileViewModel _artistProfileViewModel = Get.find();
  final CartViewModel _cartViewModel = Get.find();
  final AuthViewModel _authViewModel = Get.find();
  AuthViewModel authViewModel = Get.find();
  HomeViewModel homeViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Obx(
          () => _salonProfileViewModel.getIsLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Stack(
                        children: [
                          // HomePageSlider(
                          //   pageController: pageController2,
                          // ),
                          // Container(
                          //   height: 360.h,
                          //   width: 340.w,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: NetworkImage(
                          //             "${AppUrl.baseUrl}/${_salonProfileViewModel.getStore.salonImage ?? ""}"),
                          //         fit: BoxFit.cover),
                          //     borderRadius: BorderRadius.circular(16.r),
                          //     border: Border.all(
                          //       color: AppColors.signUpColor,
                          //       width: 0.5.w,
                          //     ),
                          //   ),
                          // ),

                          Obx(
                            () => homeViewModel.getBanners.isNotEmpty
                                ? HomePageSlider(
                                    pageController2: pageController2,
                                    banners: homeViewModel.getBanners)
                                : const SizedBox(),
                          ),

                          Container(
                            height: 360.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                // gradient: LinearGradient(
                                //   begin: Alignment.topCenter,
                                //   end: Alignment.bottomCenter,
                                //   colors: <Color>[
                                //     Color(0xff000000).withOpacity(0.1),
                                //     Color(0xff000000),
                                //   ], // Gradient from https://learnui.design/tools/gradient-generator.html
                                //   tileMode: TileMode.mirror,
                                // ),
                                ),
                            // gradient: LinearGradient(
                            //   begin: Alignment.topCenter,
                            //   end: Alignment.center,
                            //   colors: <Color>[
                            //     Color(0xff000000).withOpacity(0.1),
                            //     Color(0xff000000),
                            //   ], // Gradient from https://learnui.design/tools/gradient-generator.html
                            //   tileMode: TileMode.mirror,
                            // ),
                            // ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor:
                                              Colors.yellow.withOpacity(0.3),
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor:
                                            Colors.yellow.withOpacity(0.3),
                                        child: Icon(
                                          Icons.bookmark_outline,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 184.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextHeading(
                                        title:
                                            _languageViewModel.getSelectedLanguage ==
                                                    "English"
                                                ? _salonProfileViewModel
                                                        .getStore
                                                        .salonNameEng ??
                                                    "NA"
                                                : _salonProfileViewModel
                                                        .getStore
                                                        .salonNameArb ??
                                                    "NA",
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
                                      Image.asset(
                                          "assets/images/mark_Location.png"),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      TextHeading(
                                        title:
                                            "${(_salonProfileViewModel.getStore.distance ?? 0.0).toStringAsFixed(2)} Km From you",
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
                                      const Icon(
                                        Icons.alarm,
                                        color: AppColors.primaryColor,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      TextHeading(
                                        title:
                                            "${_salonProfileViewModel.getStore.salonStartTime} - ${_salonProfileViewModel.getStore.salonEndTime}",
                                        fontweight: FontWeight.w400,
                                        fontsize: 12.sp,
                                        fontcolor: Colors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  if (_salonProfileViewModel
                                          .getStore.kidsSalonService !=
                                      null)
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
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
                                          fontcolor: AppColors.primaryColor,
                                        )
                                      ],
                                    )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              TextHeading(
                                title: "About Us",
                                fontweight: FontWeight.w600,
                                fontsize: 12.sp,
                                fontcolor: Colors.white,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextHeading(
                                title: _salonProfileViewModel
                                        .getStore.description ??
                                    "",
                                fontweight: FontWeight.w400,
                                fontsize: 12.sp,
                                fontcolor: Colors.white,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextHeading(
                                title: "Our Expert Artists",
                                fontweight: FontWeight.w600,
                                fontsize: 12.sp,
                                fontcolor: Colors.white,
                              ),
                              Container(
                                height: 300.h,
                                // width: double.infinity,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      _salonProfileViewModel.getArtists.length,
                                  //   physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    ArtistModel artist = _salonProfileViewModel
                                        .getArtists[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 280.h,
                                        width: 160.w,
                                        decoration: BoxDecoration(
                                            color: AppColors.searchFieldsColor,
                                            border: Border.all(
                                                color: AppColors.signUpColor,
                                                width: 0.2),
                                            borderRadius:
                                                BorderRadius.circular(16.r)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 145.h,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          "${AppUrl.baseUrl}/${artist.artistImage ?? ""}",
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.r),
                                                    ),

                                                    // child: Image.asset(
                                                    //     "assets/images/artistImage1.jpeg",height: 145,fit: BoxFit.cover,),
                                                  ),
                                                  Positioned(
                                                    right: 8,
                                                    bottom: 8,
                                                    child: Container(
                                                      height: 35.h,
                                                      width: 57.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color: AppColors
                                                                .primaryColor,
                                                            size: 20,
                                                          ),
                                                          SizedBox(
                                                            width: 3.w,
                                                          ),
                                                          TextHeading(
                                                            title: "4.2",
                                                            fontweight:
                                                                FontWeight.w600,
                                                            fontsize: 12.sp,
                                                            fontcolor:
                                                                Colors.white,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                children: [
                                                  TextHeading(
                                                    title: "Name: ",
                                                    fontweight: FontWeight.w600,
                                                    fontsize: 12.sp,
                                                    fontcolor: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  TextHeading(
                                                    title: _languageViewModel
                                                                .getSelectedLanguage ==
                                                            "English"
                                                        ? artist.artistNameEng ??
                                                            ""
                                                        : artist.artistNameArb ??
                                                            "",
                                                    fontweight: FontWeight.w600,
                                                    fontsize: 12.sp,
                                                    fontcolor:
                                                        AppColors.primaryColor,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Row(
                                                children: [
                                                  TextHeading(
                                                    title: "Status: ",
                                                    fontweight: FontWeight.w600,
                                                    fontsize: 12.sp,
                                                    fontcolor: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  TextHeading(
                                                    title: (artist.isActive ??
                                                                "") ==
                                                            "1"
                                                        ? "Active"
                                                        : (artist.isActive ??
                                                                    "") ==
                                                                "2"
                                                            ? "Inactive"
                                                            : "",
                                                    fontweight: FontWeight.w600,
                                                    fontsize: 12.sp,
                                                    fontcolor:
                                                        AppColors.primaryColor,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Row(
                                                children: [
                                                  TextHeading(
                                                    title: "Expertize: ",
                                                    fontweight: FontWeight.w600,
                                                    fontsize: 12.sp,
                                                    fontcolor: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  TextHeading(
                                                    title: (artist.artistCategories ??
                                                                "")
                                                            .isEmpty
                                                        ? "ALL"
                                                        : artist.artistCategories ??
                                                            "",
                                                    fontweight: FontWeight.w600,
                                                    fontsize: 12.sp,
                                                    fontcolor:
                                                        AppColors.primaryColor,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 34.h,
                                                    width: 34.w,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: AppColors
                                                                .signUpColor,
                                                            width: 0.2),
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r)),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons
                                                            .bookmark_add_outlined,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () =>
                                                        _artistProfileViewModel
                                                            .onViewProfileClick(
                                                                artist,
                                                                _cartViewModel,
                                                                _authViewModel),
                                                    child: Container(
                                                      height: 34.h,
                                                      width: 90.w,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .bookmarkColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.r)),
                                                      child: Center(
                                                        child: TextHeading(
                                                          title: "View Profile",
                                                          fontweight:
                                                              FontWeight.w400,
                                                          fontsize: 12.sp,
                                                          fontcolor:
                                                              Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  // gridDelegate:
                                  //     SliverGridDelegateWithFixedCrossAxisCount(
                                  //   crossAxisCount: 2,
                                  //   crossAxisSpacing: 10.w,
                                  //   mainAxisSpacing: 10.h,
                                  //   childAspectRatio: 0.55,
                                  // ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              TextHeading(
                                  title: "Our Gallary",
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontcolor: Colors.white),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 158.h,
                                width: double.infinity,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: InAppWebView(
                                  initialUrlRequest: URLRequest(
                                    url: WebUri(
                                        "https://www.youtube.com/embed/2pxbAZtEhuM?autoplay=1&mute=1&controls=0&modestbranding=1&showinfo=0&rel=0"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              TextHeading(
                                  title: "Rating & Review (273)",
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontcolor: Colors.white),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 155.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                    color: AppColors.searchFieldsColor,
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                        color: AppColors.signUpColor,
                                        width: 0.2)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          TextHeading(
                                              title: "5",
                                              fontweight: FontWeight.w600,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SizedBox(
                                              height: 5,
                                              width: 180.w,
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(2.r),
                                                value: 1,
                                                color: AppColors.primaryColor,
                                              )),

                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          const Row(
                                            children: [
                                              TextHeading(
                                                  title: "4.5",
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 24,
                                                  fontcolor: Colors.white),
                                              Icon(
                                                Icons.star,
                                                color: AppColors.primaryColor,
                                              )
                                            ],
                                          ),

                                          // SizedBox(
                                          //   height: 20.h,
                                          // ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextHeading(
                                              title: "4",
                                              fontweight: FontWeight.w600,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SizedBox(
                                              height: 5,
                                              width: 180.w,
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(2.r),
                                                value: 0.8,
                                                color: AppColors.primaryColor,
                                              )),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          TextHeading(
                                              title: "273 Reviews",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          TextHeading(
                                              title: "3",
                                              fontweight: FontWeight.w600,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SizedBox(
                                              height: 5,
                                              width: 180.w,
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(2.r),
                                                value: 0.6,
                                                color: AppColors.primaryColor,
                                              )),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextHeading(
                                              title: "2",
                                              fontweight: FontWeight.w600,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SizedBox(
                                              height: 5,
                                              width: 180.w,
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(2.r),
                                                value: 0.4,
                                                color: AppColors.primaryColor,
                                              )),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          TextHeading(
                                              title: "88%",
                                              fontweight: FontWeight.w400,
                                              fontsize: 24.h,
                                              fontcolor: Colors.white),
                                          // SizedBox(
                                          //   height: 20.h,
                                          // ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextHeading(
                                              title: "1",
                                              fontweight: FontWeight.w600,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SizedBox(
                                              height: 5,
                                              width: 180.w,
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(2.r),
                                                value: 0.2,
                                                color: AppColors.primaryColor,
                                              )),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          TextHeading(
                                              title: "Recommended",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                height: 260.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                    color: AppColors.searchFieldsColor,
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                          115,
                                          115,
                                          115,
                                          1,
                                        ),
                                        width: 0.2),
                                    borderRadius: BorderRadius.circular(16.r)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          TextHeading(
                                              title: "Kristin Watson",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Image.asset(
                                            "assets/images/English_language.png",
                                            height: 15,
                                            width: 15,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextHeading(
                                              title: "Verified Buyer",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                          BasicExample()
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextHeading(
                                          title: "SO DELICIOUS 🍯💯",
                                          fontweight: FontWeight.w400,
                                          fontsize: 12.sp,
                                          fontcolor: Colors.white),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextHeading(
                                          title:
                                              "This is 💯 one hundred percent the best lip mask duo ever !!! The scent is delicious and it’s so smooth from the scrub & mask ~ This is perfection~ Smells just like honey 🍯 & the packaging is so adorable ~ I’m so very happy with this product 🐻 🍯 ~",
                                          fontweight: FontWeight.w400,
                                          fontsize: 12.sp,
                                          fontcolor: Colors.white),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextHeading(
                                              title: "Helpful ?",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                          // SizedBox(
                                          //   width: 15.w,
                                          // ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextHeading(
                                                  title: "Yes (2)",
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 12.sp,
                                                  fontcolor: Colors.white),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              TextHeading(
                                                  title: "NO (0)",
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 12.sp,
                                                  fontcolor: Colors.white),
                                            ],
                                          ),
                                          TextHeading(
                                              title: "Nov 09, 2022",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                height: 260.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                    color: AppColors.searchFieldsColor,
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            115, 115, 115, 1),
                                        width: 0.2),
                                    borderRadius: BorderRadius.circular(16.r)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          TextHeading(
                                              title: "Kristin Watson",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Image.asset(
                                            "assets/images/English_language.png",
                                            height: 15,
                                            width: 15,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextHeading(
                                              title: "Verified Buyer",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                          BasicExample()
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextHeading(
                                          title: "SO DELICIOUS 🍯💯",
                                          fontweight: FontWeight.w400,
                                          fontsize: 12.sp,
                                          fontcolor: Colors.white),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextHeading(
                                          title:
                                              "This is 💯 one hundred percent the best lip mask duo ever !!! The scent is delicious and it’s so smooth from the scrub & mask ~ This is perfection~ Smells just like honey 🍯 & the packaging is so adorable ~ I’m so very happy with this product 🐻 🍯 ~",
                                          fontweight: FontWeight.w400,
                                          fontsize: 12.sp,
                                          fontcolor: Colors.white),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextHeading(
                                              title: "Helpful ?",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white),
                                          // SizedBox(
                                          //   width: 15.w,
                                          // ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextHeading(
                                                  title: "Yes (2)",
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 12.sp,
                                                  fontcolor: Colors.white),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              TextHeading(
                                                  title: "NO (0)",
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 12.sp,
                                                  fontcolor: Colors.white),
                                            ],
                                          ),
                                          TextHeading(
                                              title: "Nov 09, 2022",
                                              fontweight: FontWeight.w400,
                                              fontsize: 12.sp,
                                              fontcolor: Colors.white)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                  height: 260.h,
                                  width: 340.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.searchFieldsColor,
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              115, 115, 115, 1),
                                          width: 0.2),
                                      borderRadius:
                                          BorderRadius.circular(16.r)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            TextHeading(
                                                title: "Kristin Watson",
                                                fontweight: FontWeight.w400,
                                                fontsize: 12.sp,
                                                fontcolor: Colors.white),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Image.asset(
                                              "assets/images/English_language.png",
                                              height: 15,
                                              width: 15,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextHeading(
                                                title: "Verified Buyer",
                                                fontweight: FontWeight.w400,
                                                fontsize: 12.sp,
                                                fontcolor: Colors.white),
                                            BasicExample()
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        TextHeading(
                                            title: "SO DELICIOUS 🍯💯",
                                            fontweight: FontWeight.w400,
                                            fontsize: 12.sp,
                                            fontcolor: Colors.white),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        TextHeading(
                                            title:
                                                "This is 💯 one hundred percent the best lip mask duo ever !!! The scent is delicious and it’s so smooth from the scrub & mask ~ This is perfection~ Smells just like honey 🍯 & the packaging is so adorable ~ I’m so very happy with this product 🐻 🍯 ~",
                                            fontweight: FontWeight.w400,
                                            fontsize: 12.sp,
                                            fontcolor: Colors.white),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextHeading(
                                                title: "Helpful ?",
                                                fontweight: FontWeight.w400,
                                                fontsize: 12.sp,
                                                fontcolor: Colors.white),
                                            // SizedBox(
                                            //   width: 15.w,
                                            // ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextHeading(
                                                    title: "Yes (2)",
                                                    fontweight: FontWeight.w400,
                                                    fontsize: 12.sp,
                                                    fontcolor: Colors.white),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                TextHeading(
                                                    title: "NO (0)",
                                                    fontweight: FontWeight.w400,
                                                    fontsize: 12.sp,
                                                    fontcolor: Colors.white),
                                              ],
                                            ),
                                            TextHeading(
                                                title: "Nov 09, 2022",
                                                fontweight: FontWeight.w400,
                                                fontsize: 12.sp,
                                                fontcolor: Colors.white)
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            ]),
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),

                  //  VideoPlayerScreen()
                ),
        ),
      ),
    );
  }
}
