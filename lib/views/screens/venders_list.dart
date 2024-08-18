import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/views/components/search_bar.dart';
import 'package:naemen/views/screens/shop_page.dart';
import 'package:naemen/utils/color_constant.dart';

import '../components/reusable_row.dart';
import '../components/text_heading.dart';

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

class _VendersPageState extends State<VendersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: TextHeading(
              title: "Venders List",
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
                      const ReUsableRow(),
                      Container(
                        height: 500.h,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: shopname.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                height: 150.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColors.searchFieldsColor,
                                    border: Border.all(
                                        color: AppColors.signUpColor,
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ShopPage()));
                                                },
                                                child: Container(
                                                  height: 120.h,
                                                  width: 120.w,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            ShopImage[index]),
                                                        fit: BoxFit.cover),
                                                    color: Colors.blueGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
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
                                                    color:
                                                        AppColors.primaryColor,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  TextHeading(
                                                      title: "4.3/5",
                                                      fontweight:
                                                          FontWeight.w400,
                                                      fontsize: 12.sp,
                                                      fontcolor: Colors.white)
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextHeading(
                                                title: shopname[index],
                                                fontweight: FontWeight.w400,
                                                fontsize: 12.sp,
                                                fontcolor:
                                                    AppColors.primaryColor),
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
                                                    title: "3.5 Km From you",
                                                    fontweight: FontWeight.w400,
                                                    fontsize: 12.sp,
                                                    fontcolor: Colors.white)
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.alarm,
                                                  color: AppColors.primaryColor,
                                                  weight: 0.5,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                TextHeading(
                                                    title: Saloontime[index],
                                                    fontweight: FontWeight.w400,
                                                    fontsize: 12.sp,
                                                    fontcolor: Colors.white)
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              children: [
                                                TextHeading(
                                                    title: "      Kids :",
                                                    fontweight: FontWeight.w400,
                                                    fontsize: 12.sp,
                                                    fontcolor: Colors.white),
                                                TextHeading(
                                                    title: " Avilable",
                                                    fontweight: FontWeight.w400,
                                                    fontsize: 12.sp,
                                                    fontcolor:
                                                        AppColors.bookmarkColor)
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Container(
                                          height: 24.h,
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      AppColors.primaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(5.r)),
                                          child: Image.asset(
                                              "assets/images/venderImage.png"),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
