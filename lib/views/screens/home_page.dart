import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naemen/models/salon_model.dart';
import 'package:naemen/models/tag_model.dart';

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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                      // Obx(
                      //   () => homeViewModel.getBanners.isNotEmpty
                      //       ? HomePageSlider(
                      //           pageController1: pageController1,
                      //           banners: homeViewModel.getBanners,
                      //         )
                      //       : const SizedBox(),
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      Obx(
                        () => homeViewModel.getHomeCategories.isNotEmpty
                            ? InkWell(
                                onTap: () => Get.toNamed(Routes.categoryRoute),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextHeading(
                                        title: "Categories",
                                        fontweight: FontWeight.w600,
                                        fontsize: 12.sp,
                                        fontcolor: Colors.white),
                                    TextHeading(
                                        title: "View all",
                                        fontweight: FontWeight.w400,
                                        fontsize: 10.sp,
                                        fontcolor: Colors.white)
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CategoryListWidget(
                        homeViewModel: homeViewModel,
                        languageViewModel: languageViewModel,
                        canNavigate: true,
                      ),
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
                      Recommended(
                        status: "Status:",
                        description: 'Chameleon salon',
                        type: 'Saloon Type:',
                        image: 'assets/images/newly.png',
                        statuValue: 'ONLINE',
                        typeValue: 'Unisex',
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
