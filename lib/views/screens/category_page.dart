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
            icon: const Icon(Icons.arrow_back, color: AppColors.primarycolor),
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
                    color: AppColors.primarycolor,
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
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
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
                          child: Container(
                            height: 103.h,
                            width: 103.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.SignupColor, width: 0.5),
                              borderRadius: BorderRadius.circular(16.r),
                              color: AppColors.CategorycontainerColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  "${AppUrl.baseUrl}/${category.categoryImage}",
                                  height: 50.h,
                                  width: 50.w,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                TextHeading(
                                  title:
                                      languageViewModel.getSelectedLanguage ==
                                              "English"
                                          ? category.categoryTitle ?? "NA"
                                          : category.categoryArb ?? "NA",
                                  fontweight: FontWeight.w500,
                                  fontsize: 12.sp,
                                  fontcolor: Colors.white,
                                )
                              ],
                            ),
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
