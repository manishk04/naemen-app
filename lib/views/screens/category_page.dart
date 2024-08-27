import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/category_model.dart';
import '../../utils/app_url.dart';
import '../../utils/color_constant.dart';
import '../../view_models/home_view_model.dart';
import '../../view_models/language_view_model.dart';
import '../components/text_heading.dart';
import 'venders_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = Get.find();
    LanguageViewModel languageViewModel = Get.find();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: TextHeading(
              title: "Categories",
              fontweight: FontWeight.w700,
              fontsize: 12.sp,
              fontcolor: Colors.white),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Divider(
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 700.h,
                    width: double.infinity,
                    child: GridView.builder(
                      
                      shrinkWrap: false,
                      itemCount: homeViewModel.getAllCategories.length,
                      gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.5,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
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
                                    color: AppColors.searchFieldsColor,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 35),
                                  child: TextHeading(
                                    title:
                                        languageViewModel.getSelectedLanguage ==
                                                "English"
                                            ? category.categoryTitle ?? "NA"
                                            : category.categoryArb ?? "NA",
                                    fontweight: FontWeight.w600,
                                    fontsize: 14.sp,
                                    fontcolor: AppColors.primaryColor,
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
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.r),
                                          topRight: Radius.circular(10.r),
                                          bottomLeft: Radius.circular(10.r),
                                          bottomRight: Radius.circular(10.r)),
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
                  ),
                  SizedBox(
                    height: 20.h,
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
