import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:naemen/utils/color_constant.dart';
import 'package:naemen/view_models/auth_view_model.dart';
import 'package:naemen/views/screens/bottom_bar.dart';

import '../components/text_heading.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({super.key});

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  // final GoogleMapViewModel _googleMapViewModel = Get.find();

  AuthViewModel authViewModel = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white, // <-- SEE HERE
            onPressed: () => Get.back(),
          ),
          backgroundColor: Colors.black,
          title: Text(
            "Add a new address",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
              color: Colors.black,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.amber),
                            Expanded(
                              flex: 4,
                              child: Text(
                                "Your Address",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Obx(
                          () => TextHeading(
                            title: authViewModel.getAddress,
                            fontweight: FontWeight.w400,
                            fontsize: 11.sp,
                            fontcolor: Colors.white,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        TextHeading(
                            title: "Flat / House no / Floor / Building",
                            fontweight: FontWeight.w300,
                            fontsize: 11.sp,
                            fontcolor: Colors.white),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 40.h,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              filled: true,
                              fillColor: AppColors.searchFieldsColor,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        TextHeading(
                            title: "Area / Sector / Locality",
                            fontweight: FontWeight.w300,
                            fontsize: 11.sp,
                            fontcolor: Colors.white),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 40.h,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              filled: true,
                              fillColor: AppColors.searchFieldsColor,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: 40.h,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Nearby Landnark (Optiponal)",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w300),
                              contentPadding: EdgeInsets.all(8),
                              filled: true,
                              fillColor: AppColors.searchFieldsColor,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 80.h,
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => BottomBarView()));
                          },
                          child: Container(
                            height: 40.h,
                            width: 330.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "Confirm Address",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // InkWell(
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 10),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Icon(
                        //           Icons.arrow_back,
                        //           color: Colors.white,
                        //         ),
                        //         SizedBox(
                        //           width: 10.w,
                        //         ),
                        //         TextHeading(
                        //             title: "Select Your Location",
                        //             fontweight: FontWeight.bold,
                        //             fontsize: 16.sp,
                        //             fontcolor: Colors.white)
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ]),
                ),
              )),
        ));
  }
}
