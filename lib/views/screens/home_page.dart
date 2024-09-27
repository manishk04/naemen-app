import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naemen/models/salon_model.dart';
import 'package:naemen/models/tag_model.dart';
import 'package:naemen/views/components/crousel_slider.dart';
import 'package:naemen/views/screens/search_page.dart';
import 'package:naemen/views/screens/venders_list.dart';

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
  @override
  void initState() {
    super.initState();
    homeViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    // TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchPage()));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/images/Location.png"),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 3.w),
                                    TextHeading(
                                      title: "Home",
                                      fontweight: FontWeight.w600,
                                      fontsize: 12.sp,
                                      fontcolor:
                                          isDark ? Colors.white : Colors.white,
                                    ),
                                    Obx(
                                      () => TextHeading(
                                        title: authViewModel.getAddress,
                                        fontweight: FontWeight.w400,
                                        fontsize: 11.sp,
                                        fontcolor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                          const CircleAvatar(
                            radius: 17.5,
                            backgroundImage:
                                AssetImage("assets/images/profile_image.png"),
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
                            ? ShopPageSlider(
                                pageController1: pageController1,
                                banners: homeViewModel.getBanners,
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
                        () {
                          TagModel tag = homeViewModel.getTag;
                          return tag.salons != null && tag.salons!.isNotEmpty
                              ? TextHeading(
                                  title:
                                      languageViewModel.getSelectedLanguage ==
                                              "English"
                                          ? tag.titleEng ?? ""
                                          : tag.titleArb ?? "",
                                  fontweight: FontWeight.w600,
                                  fontsize: 12.sp,
                                  fontcolor: Colors.white,
                                )
                              : const SizedBox();
                        },
                      ),
                      Obx(
                        () {
                          TagModel tag = homeViewModel.getTag;
                          return SizedBox(
                            height: tag.salons != null && tag.salons!.isNotEmpty
                                ? 25.h
                                : 0.h,
                          );
                        },
                      ),
                      Obx(
                        () {
                          TagModel tag = homeViewModel.getTag;
                          return tag.salons != null && tag.salons!.isNotEmpty
                              ? SizedBox(
                                  height: 255.h,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: tag.salons!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      SalonModel salon = tag.salons![index];
                                      return WinterSpecialItems(
                                        image: salon.salonImage ?? "",
                                        status: languageViewModel
                                                    .getSelectedLanguage ==
                                                "English"
                                            ? "Status:"
                                            : "Status:",
                                        statusValue: (salon.salonStatus ?? "")
                                            .toString(),
                                        description: languageViewModel
                                                    .getSelectedLanguage ==
                                                "English"
                                            ? salon.salonNameEng ?? ""
                                            : salon.salonNameArb ?? "",
                                        type: languageViewModel
                                                    .getSelectedLanguage ==
                                                "English"
                                            ? "Saloon Type:"
                                            : "Saloon Type:",
                                        typeValue: salon.salonType ?? "NA",
                                        distance: salon.distance ?? 0.00,
                                        salon: salon,
                                      );
                                    },
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
                      // NewelyWidget(
                      //   status: "Status:",
                      //   description: 'Chameleon salon',
                      //   type: 'Saloon Type:',
                      //   image: 'assets/images/newly.png',
                      //   statuValue: 'ONLINE',
                      //   typeValue: 'Unisex',
                      // ),
                      SizedBox(height: 20.h),
                      TextHeading(
                          title: "Top Rated Artist",
                          fontweight: FontWeight.w600,
                          fontsize: 12.sp,
                          fontcolor: Colors.white),
                      SizedBox(
                        height: 25.h,
                      ),
                      ArtistSlider(),

                      // const NewelyWidget(
                      //   status: "Status:",
                      //   description: 'Chameleon salon',
                      //   type: 'Saloon Type:',
                      //   image: 'assets/images/newly.png',
                      //   statuValue: 'ONLINE',
                      //   typeValue: 'Unisex',
                      // ),
                      // ArtistSlider(status: 'Status', statuValue: 'Online', description: '2q4qrw', type: 'rewrwr', typeValue: 'wdad', image: 'assets/images/newly.png',),

                      //ArtistSliderWidget( ),

                      SizedBox(
                        height: 20.h,
                      ),
                      TextHeading(
                          title: "Recommended",
                          fontweight: FontWeight.w600,
                          fontsize: 12.sp,
                          fontcolor: Colors.white),
                      SizedBox(
                        height: 20.h,
                      ),
                      const Recommended(
                        status: "Status:",
                        description: 'Chameleon salon',
                        type: 'Saloon Type:',
                        image: 'assets/images/newly.png',
                        statuValue: 'ONLINE',
                        typeValue: 'Unisex',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
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
                                  physics: const NeverScrollableScrollPhysics(),
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
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VendersPage(),
                                          ),
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 87.h,
                                            width: 165.w,
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColors.searchFieldsColor,
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
                                                    ? category.categoryTitle ??
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(10.r),
                                                          topRight: Radius
                                                              .circular(10.r),
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
