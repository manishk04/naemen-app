import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:naemen/models/artist_service_model.dart';
import 'package:naemen/view_models/artist_profile_view_model.dart';
import 'package:naemen/view_models/cart_view_model.dart';
import 'package:naemen/view_models/language_view_model.dart';
import 'package:naemen/views/components/appointment_filter.dart';
import 'package:naemen/views/components/booking_dattime_widget.dart';
import 'package:naemen/views/components/search_bar.dart';
import 'package:naemen/views/screens/shop_page.dart';
import 'package:naemen/utils/color_constant.dart';

import '../components/text_heading.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    LanguageViewModel languageViewModel = Get.find();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: TextHeading(
                title: "Notification",
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
              child: Column(
                children: [
                  Container(
                    height: 50.h,
                    width: double.infinity,
                    color: AppColors.searchFieldsColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextHeading(
                              title: "All Notification",
                              fontweight: FontWeight.w400,
                              fontsize: 14.sp,
                              fontcolor: Colors.white),
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 600.h,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 19,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 18,
                                ),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextHeading(
                                      title: "Refund under process",
                                      fontweight: FontWeight.w600,
                                      fontsize: 14.sp,
                                      fontcolor: AppColors.primaryColor),
                                  TextHeading(
                                      title:
                                          "Lorem ipsum dolor sit amet. Et architecto sequi\nsed aperiam autem ea consequuntur vero ut\nomnis sint qui voluptate quidem in deserunt\nrecusandae.",
                                      fontweight: FontWeight.w400,
                                      fontsize: 12.sp,
                                      fontcolor: Colors.white)
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              )),
        ));
  }
}
