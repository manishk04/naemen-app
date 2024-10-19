import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../routes/app_routes.dart';
import '../../utils/color_constant.dart';
import '../../view_models/google_map_view_model.dart';
import '../components/location_search_dialog.dart';
import '../components/text_heading.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GoogleMapViewModel _googleMapViewModel = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
              color: Colors.black,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextHeading(
                                  title: "Select Your Location",
                                  fontweight: FontWeight.bold,
                                  fontsize: 16.sp,
                                  fontcolor: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        InkWell(
                          // onTap: () {
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) => SearchPage()));
                          // },
                          onTap: () => Get.dialog(
                            LocationSearchDialog(
                              onSelection: (suggestion) async {
                                log("My location is ${suggestion.description ?? "NA"}");
                                FocusScope.of(context).unfocus();
                                List<Location> locations =
                                    await locationFromAddress(
                                        suggestion.description ?? "");
                                log(locations.toString());
                                _googleMapViewModel.setDraggedLatLng = LatLng(
                                  locations[0].latitude,
                                  locations[0].longitude,
                                );
                                _googleMapViewModel.gotoSpecificPosition(
                                  LatLng(
                                    locations[0].latitude,
                                    locations[0].longitude,
                                  ),
                                );
                                //Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);
                                Get.back();
                                Get.toNamed(Routes.googleMapRoute);
                              },
                            ),
                          ),
                          child: Container(
                            height: 50.h,
                            width: 340.w,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.search,
                                    color: AppColors.primaryColor),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: TextHeading(
                                    title: "Search Location...",
                                    fontweight: FontWeight.w400,
                                    fontsize: 12.sp,
                                    fontcolor: Colors.grey.shade200,
                                  ),
                                ),
                                Icon(Icons.mic, color: AppColors.primaryColor),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        InkWell(
                          onTap: () {
                            _googleMapViewModel.init();
                            Get.toNamed(Routes.googleMapRoute);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => GoogleMapScreen()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.route,
                                size: 20,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Expanded(
                                  flex: 10,
                                  child: TextHeading(
                                      title: "Use my current location",
                                      fontweight: FontWeight.w500,
                                      fontsize: 16.sp,
                                      fontcolor: AppColors.primaryColor)),
                              Expanded(
                                  child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.grey,
                                size: 15,
                              ))
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.2,
                          height: 30,
                        ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     Get.toNamed(Routes.addLocationRoute);
                        //     // Navigator.pushReplacement(
                        //     //     context,
                        //     //     MaterialPageRoute(
                        //     //         builder: (context) => AddLocationPage()
                        //     //         //GoogleMapScreen()
                        //     //         ));
                        //   },
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         Icons.add,
                        //         size: 20,
                        //         color: AppColors.primaryColor,
                        //       ),
                        //       SizedBox(
                        //         width: 3.w,
                        //       ),
                        //       Expanded(
                        //           flex: 10,
                        //           child: TextHeading(
                        //               title: "Add new address",
                        //               fontweight: FontWeight.w500,
                        //               fontsize: 16.sp,
                        //               fontcolor: AppColors.primaryColor)),
                        //     ],
                        //   ),
                        // ),
                        // Divider(
                        //   color: Colors.grey,
                        //   thickness: 0.2,
                        //   height: 30,
                        // )
                      ]),
                ),
              )),
        ));
  }
}
