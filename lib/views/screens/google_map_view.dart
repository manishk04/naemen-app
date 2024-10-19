import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naemen/routes/app_routes.dart';
import 'package:naemen/utils/color_constant.dart';
import 'package:naemen/utils/storage_data.dart';
import 'package:naemen/utils/utils.dart';
import 'package:naemen/view_models/auth_view_model.dart';
import 'package:naemen/view_models/google_map_view_model.dart';
import 'package:naemen/view_models/home_view_model.dart';
import 'package:naemen/views/components/text_heading.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final GoogleMapViewModel _googleMapViewModel = Get.find();
  //final GoogleMapViewModel2 _googleMapViewModel2 = Get.find();

  final AuthViewModel _authViewModel = Get.find();
  final HomeViewModel _homeViewModel = Get.find();

  // static const LatLng _pGooglePlex = LatLng(28.6407533, 76.3790116)

  // void _showBottomSheet() {
  //   showModalBottomSheet(
  //     isDismissible: false,
  //     context: context,
  //     builder: (context) {
  //       return Container(
  //         height: 200.h,
  //         width: double.infinity,
  //         decoration: BoxDecoration(
  //             color: Colors.black,
  //             borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(20.r),
  //                 topRight: Radius.circular(20.r))),
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(
  //             horizontal: 15,
  //           ),
  //           child: Column(
  //            // mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //
  //               SizedBox(height: 20.h,),
  //
  //               Row(
  //                 children: [
  //                   Icon(Icons.location_on,color: Colors.amber,),
  //                   Expanded(
  //                     flex: 4,
  //                     child: Text(
  //                       "Your Address",
  //                       style: TextStyle(
  //                           fontSize: 24,
  //                           fontWeight: FontWeight.bold,
  //                           color: AppColors.primaryColor),
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: Container(height: 25.h,
  //                       width: 130.w,
  //                       decoration: BoxDecoration(
  //                         color: Colors.grey.shade100,
  //                         border: Border.all(color: AppColors.primaryColor,width: 1),
  //                           borderRadius: BorderRadius.circular(10.r)),
  //                       child: Center(child: Text("Chnage",style: TextStyle(color: AppColors.primaryColor),)),
  //
  //                       ),
  //                   )
  //
  //                 ],
  //               ),
  //               SizedBox(height: 10),
  //               Obx(
  //                     () => TextHeading(
  //                   title: authViewModel.getAddress,
  //                   fontweight: FontWeight.w400,
  //                   fontsize: 11.sp,
  //                   fontcolor: Colors.white,
  //                 ),
  //               ),
  //
  //
  //
  //              SizedBox(height: 50.h,),
  //               InkWell(
  //                 onTap: () {
  //                   Get.offAllNamed(Routes.bottomBarRoute);
  //                 },
  //                 child: Container(
  //                   height: 40.h,
  //                   width: 330.w,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(5.r),
  //                       color: AppColors.primaryColor),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       const Icon(
  //                         Icons.bookmark_add_outlined,
  //                         color: Colors.black,
  //                       ),
  //                       SizedBox(
  //                         width: 5.w,
  //                       ),
  //                       Text(
  //                         "Save Address",
  //                         style: TextStyle(
  //                             fontWeight: FontWeight.w500, fontSize: 14.sp),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               )
  //
  //               // Add more widgets as needed
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  //--->> get polylinepoints

  // Future<List<LatLng>>getpolylinePoints() async{
  //   List<LatLng> polylineCordinates = [];
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult  results = await polylinePoints.getRouteBetweenCoordinates(request: );
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(
                        () => _googleMapViewModel.getIsMapLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : GoogleMap(
                                initialCameraPosition:
                                    _googleMapViewModel.getCameraPosition,
                                onCameraIdle: () {
                                  // This Function will trigger when user stop dragging on Map
                                  _googleMapViewModel.getAddress();
                                },
                                onCameraMove: (cameraPosition) {
                                  // This Function will trigger when user kepp dragging on Map
                                  _googleMapViewModel.setDraggedLatLng =
                                      cameraPosition.target;
                                },
                                onMapCreated: (GoogleMapController controller) {
                                  // This function will trigger when the Map is fully Loaded
                                  if (!_googleMapViewModel
                                      .googleMapController.isCompleted) {
                                    // Set controller to google map when it is fully loaded
                                    _googleMapViewModel.googleMapController
                                        .complete(controller);
                                  }
                                },
                                // markers: {
                                //   Marker(
                                //     markerId: MarkerId("_currentLocation"),
                                //     icon: BitmapDescriptor.defaultMarker,
                                //     position: _googleMapViewModel.getInitialPosition,
                                //   ),
                                //   // Marker(
                                //   //   markerId: MarkerId("_sourceLocation"),
                                //   //   icon: BitmapDescriptor.defaultMarker,
                                //   //   position: _pGooglePlex
                                //   //   //_googleMapViewModel.getInitialPosition,
                                //   // ),
                                // },
                                // myLocationEnabled: true,
                                // myLocationButtonEnabled: true,
                                // onMapCreated: (GoogleMapController controller) {
                                //   _googleMapViewModel.setMapController = controller;
                                // },
                              ),
                      ),
                      Icon(
                        Icons.location_on,
                        size: 18.sp,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
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
                            Expanded(
                              child: InkWell(
                                onTap: () => Get.back(),
                                child: Container(
                                  height: 25.h,
                                  width: 130.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Change",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () => TextHeading(
                            // title: authViewModel.getAddress,
                            title: _googleMapViewModel.getDraggedAddress,
                            fontweight: FontWeight.w400,
                            fontsize: 11.sp,
                            fontcolor: Colors.white,
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(height: 50.h),
                        InkWell(
                          onTap: () async {
                            _authViewModel.setAddress =
                                _googleMapViewModel.getDraggedAddress;
                            Utils.startLoading();
                            await StorageData.setLatitude(
                                "${_googleMapViewModel.getDraggedLatLng.latitude}");
                            // "26.8604");
                            await StorageData.setLongitude(
                                "${_googleMapViewModel.getDraggedLatLng.longitude}");
                            // "81.0033");
                            Get.back();
                            _homeViewModel.init();
                            Get.until((route) =>
                                route.settings.name == Routes.bottomBarRoute);
                          },
                          child: Container(
                            height: 40.h,
                            width: 330.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.bookmark_add_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "Save Address",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20,
              left: 8,
              child: InkWell(
                onTap: () => Get.back(),
                // onTap: () => Get.dialog(
                //   LocationSearchDialog(
                //     onSelection: (suggestion) async {
                //       log("My location is ${suggestion.description ?? "NA"}");
                //       FocusScope.of(context).unfocus();
                //       List<Location> locations = await locationFromAddress(
                //           suggestion.description ?? "");
                //       log(locations.toString());
                //       googleMapViewModel.setDraggedLatLng = LatLng(
                //         locations[0].latitude,
                //         locations[0].longitude,
                //       );
                //       gotoSpecificPosition(
                //         LatLng(
                //           locations[0].latitude,
                //           locations[0].longitude,
                //         ),
                //       );
                //       //Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);
                //       Get.back();
                //     },
                //   ),
                // ),
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
                      Icon(Icons.search, color: AppColors.primaryColor),
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
            ),
          ],
        ),
      ),
    );
  }
}
