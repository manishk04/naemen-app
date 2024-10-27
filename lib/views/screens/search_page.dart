import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/local/db_helper.dart';
import '../../routes/app_routes.dart';
import '../../utils/color_constant.dart';
import '../../utils/storage_data.dart';
import '../../utils/utils.dart';
import '../../view_models/auth_view_model.dart';
import '../../view_models/google_map_view_model.dart';
import '../../view_models/home_view_model.dart';
import '../components/location_search_dialog.dart';
import '../components/text_heading.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GoogleMapViewModel _googleMapViewModel = Get.find();
  final AuthViewModel _authViewModel = Get.find();
  final HomeViewModel _homeViewModel = Get.find();

  DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> history = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await DatabaseHelper().createLocationSearchHistoryTable();
    fetchHistory();
  }

  fetchHistory() async {
    history = await dbHelper.fetchLocationHistory();
    setState(() {});
  }

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
                                try {
                                  _googleMapViewModel.setMapController = null;
                                  Get.back();
                                  Get.toNamed(Routes.googleMapRoute);
                                  _googleMapViewModel.setIsMapLoading = true;
                                  log("My location is ${suggestion.description ?? "NA"}");
                                  // FocusScope.of(context).unfocus();
                                  List<Location> locations =
                                      await locationFromAddress(
                                          suggestion.description ?? "");
                                  log(locations.toString());
                                  if (locations.isNotEmpty) {
                                    double latitude = double.parse(locations[0]
                                        .latitude
                                        .toString()
                                        .trim());
                                    double longitude = double.parse(locations[0]
                                        .longitude
                                        .toString()
                                        .trim());
                                    _googleMapViewModel.gotoSpecificPosition(
                                        LatLng(latitude, longitude));
                                  }
                                  //Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);
                                  // Get.back();
                                  _googleMapViewModel.setIsMapLoading = false;
                                } catch (e) {
                                  log(e.toString());
                                }
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
                        SizedBox(
                          height: 15.h,
                        ),
                        if (history.isNotEmpty)
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: history.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> location = history[index];
                              String address =
                                  location[DatabaseHelper.columnLocation];
                              double latitude =
                                  location[DatabaseHelper.columnLatitude];
                              double longitude =
                                  location[DatabaseHelper.columnLongitude];
                              return ListTile(
                                onTap: () async {
                                  try {
                                    _authViewModel.setAddress = address;
                                    Utils.startLoading();
                                    await dbHelper.insertOrUpdateLocation(
                                        address, latitude, longitude);
                                    await StorageData.setLatitude("$latitude");
                                    await StorageData.setLongitude(
                                        "$longitude");
                                    Get.back();
                                    _homeViewModel.init();
                                    Get.until((route) =>
                                        route.settings.name ==
                                        Routes.exampleNavBarRoute);
                                  } catch (e) {
                                    log(e.toString());
                                    Utils.toastMessage(e.toString());
                                  }
                                },
                                title: Text(
                                  location[DatabaseHelper.columnLocation],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () async {
                                    Utils.startLoading();
                                    try {
                                      await dbHelper.deleteLocation(
                                        location[DatabaseHelper.columnLatitude],
                                        location[
                                            DatabaseHelper.columnLongitude],
                                      );
                                      fetchHistory();
                                    } catch (e) {
                                      log(e.toString());
                                      Utils.toastMessage(e.toString());
                                    }
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.close),
                                  color: Colors.white,
                                  iconSize: 22.sp,
                                ),
                              );
                            },
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
