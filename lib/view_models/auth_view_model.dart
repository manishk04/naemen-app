import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naemen/view_models/language_view_model.dart';
import 'package:naemen/views/components/text_heading.dart';
import 'package:naemen/views/screens/search_page.dart';

import '../models/customer_model.dart';
import '../repo/auth_repo.dart';
import '../routes/app_routes.dart';
import '../utils/color_constant.dart';
import '../utils/storage_data.dart';
import '../utils/utils.dart';
import 'google_map_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthViewModel extends GetxController {
  // ============================== Variables ==================================
  late GoogleMapController _mapController;

  DateTime? _selectedDate;

  final AuthRepo _authRepo = AuthRepo();

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _verifyMobileFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _loginPasswordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _loginOTPFormKey = GlobalKey<FormState>();

  final RxBool _obscureText = true.obs;
  final RxBool _isLoading = false.obs;

  // final RxString _currentAddress = "Fetching location...".obs;

  String _location = "Null, Press Button";

  final RxString _address = "".obs;

  // final Rx<LatLng> _currentPosition = const LatLng(0, 0).obs;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  final Rx<CustomerModel> _customer = CustomerModel().obs;

  // =============================== Getters ===================================
  GoogleMapController get getGoogleMapController => _mapController;

  DateTime? get getSelectedDate => _selectedDate;

  GlobalKey<FormState> get getSignUpFormKey => _signUpFormKey;
  GlobalKey<FormState> get getVerifyMobileFormKey => _verifyMobileFormKey;
  GlobalKey<FormState> get getLoginPasswordFormKey => _loginPasswordFormKey;
  GlobalKey<FormState> get getLoginOTPFormKey => _loginOTPFormKey;

  bool get getObscureText => _obscureText.value;
  bool get getIsLoading => _isLoading.value;

  // String get getCurrentAddress => _currentAddress.value;
  String get getLocation => _location;
  String get getAddress => _address.value;

  // LatLng get getCurrentPosition => _currentPosition.value;

  TextEditingController get getFullNameController => _fullNameController;
  TextEditingController get getEmailController => _emailController;
  TextEditingController get getMobileController => _mobileNumberController;
  TextEditingController get getDOBController => _dobController;
  TextEditingController get getPasswordController => _passwordController;
  TextEditingController get getOTPController => _otpController;

  CustomerModel get getCustomer => _customer.value;

  // =============================== Setters ===================================
  set setSelectedDate(DateTime date) => _selectedDate = date;

  set setObscureText(bool value) => _obscureText.value = value;
  set setIsLoading(bool value) => _isLoading.value = value;

  set setLocation(String value) => _location = value;
  set setAddress(String value) => _address.value = value;

  set setCustomer(CustomerModel customer) => _customer.value = customer;

  // =============================== Methods ===================================
  onAppOpen(LanguageViewModel languageViewModel,
      GoogleMapViewModel googleMapViewModel) async {
    String language = await StorageData.getLanguage();
    if (language.isEmpty) {
      Timer(const Duration(seconds: 2), () {
        Get.offNamed(Routes.languageRoute);
      });
    } else {
      languageViewModel.setSelectedLanguage = language;
      String contactNumber = await StorageData.getContactNumber();
      String customerId = await StorageData.getCustomerId();
      if (customerId.isNotEmpty && contactNumber.isNotEmpty) {
        setAddress = await StorageData.getAddress();
        if (getAddress.isNotEmpty) {
          fetchLocation(googleMapViewModel);
        } else {
          Get.offNamed(Routes.bottomBarRoute);
        }
      } else {
        Timer(const Duration(seconds: 2), () {
          Get.offNamed(Routes.verifyMobileViewRoute);
        });
      }
    }
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<String> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    } else {
      return "";
    }
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: getSelectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setSelectedDate = picked;
      _dobController.text =
          "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
    }
  }

  void togglePasswordVisibility() {
    setObscureText = !getObscureText;
  }

  void onSignUp(GoogleMapViewModel googleMapViewModel) async {
    if (getSignUpFormKey.currentState!.validate()) {
      Map<String, String> data = {
        "customer_name": getFullNameController.text.trim(),
        "email": getEmailController.text.trim(),
        "date_of_birth": getDOBController.text.trim(),
        "password": getPasswordController.text.trim(),
        "mobile_number": getMobileController.text.trim(),
        "otp": getOTPController.text,
      };
      Map<String, dynamic> response = await _authRepo.registerUser(data);
      log(response.toString());
      if (response["code"] == 200) {
        Utils.toastMessage(response["msg"] ?? "Registered Successfully!");
        setCustomer = CustomerModel.fromMap(response["customer"]);
        await StorageData.setContactNumber(getCustomer.contactNumber ?? "");
        await StorageData.setCustomerId("${getCustomer.id ?? ""}");
        fetchLocation(googleMapViewModel);
      } else {
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
      }
    }
  }

  fetchLocation(GoogleMapViewModel googleMapViewModel) async {
    Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      isDismissible: false,
    );
    try {
      Position position = await getGeoLocationPosition();
      setLocation = 'Lat: ${position.latitude} , Long: ${position.longitude}';

      //     // Create a LatLng object from the position
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);
      googleMapViewModel.setInitialPosition = currentLatLng;
      print("Current Latlong$currentLatLng");
      setAddress = await getAddressFromLatLong(position);
      StorageData.setLatitude(position.latitude.toString());
      StorageData.setLongitude(position.longitude.toString());
      StorageData.setAddress(getAddress);
      Get.back();
      Get.toNamed(Routes.googleMapRoute);
      //  Get.offAllNamed(Routes.bottomBarRoute);
    } catch (e) {
      Get.back();
      log("fetchLocation => ${e.toString()}");
      Utils.toastMessage(e.toString());
    }
  }

  Future onMobileVerifyClick() async {
    if (getVerifyMobileFormKey.currentState!.validate()) {
      Map<String, String> data = {
        "mobile_number": getMobileController.text.trim(),
      };
      try {
        setIsLoading = true;
        Map<String, dynamic> response = await _authRepo.checkMobile(data);
        log(response.toString());
        if (response["code"] == 200) {
          getOTPController.text = "${response["otp"] ?? ""}";
          Get.toNamed(Routes.signUpRoute);
        } else if (response["code"] == 319) {
          Get.toNamed(Routes.loginPasswordRoute);
        } else {
          Utils.toastMessage("Something went wrong!");
        }
      } catch (e) {
        Utils.toastMessage(e.toString());
        log("onMobileVerifyClick => ${e.toString()}");
      }
      setIsLoading = false;
    }
  }

  Future onPasswordLogin(GoogleMapViewModel googleMapViewModel) async {
    if (getVerifyMobileFormKey.currentState!.validate()) {
      Map<String, String> data = {
        "mobile_number": getMobileController.text.trim(),
        "password": getPasswordController.text.trim(),
      };
      try {
        setIsLoading = true;
        Map<String, dynamic> response = await _authRepo.loginWithPassword(data);
        log(response.toString());
        if (response["code"] == 200) {
          setCustomer = CustomerModel.fromMap(response["customer"]);
          await StorageData.setContactNumber(getCustomer.contactNumber ?? "");
          await StorageData.setCustomerId("${getCustomer.id ?? ""}");
          fetchLocation(googleMapViewModel);
        } else {
          Utils.toastMessage("Something went wrong!");
          Get.toNamed(Routes.loginPasswordRoute);
        }
      } catch (e) {
        Utils.toastMessage(e.toString());
        log("onPasswordLogin => ${e.toString()}");
      }
      setIsLoading = false;
    }
  }

  Future onOTPLogin(GoogleMapViewModel googleMapViewModel) async {
    if (getLoginOTPFormKey.currentState!.validate()) {
      Map<String, String> data = {
        "mobile_number": getMobileController.text.trim(),
        "otp": getOTPController.text.trim(),
      };
      try {
        setIsLoading = true;
        Map<String, dynamic> response = await _authRepo.loginWithOTP(data);
        log(response.toString());
        if (response["code"] == 200) {
          setCustomer = CustomerModel.fromMap(response["customer"]);
          await StorageData.setContactNumber(getCustomer.contactNumber ?? "");
          await StorageData.setCustomerId("${getCustomer.id ?? ""}");
          fetchLocation(googleMapViewModel);
        } else {
          Utils.toastMessage("Something went wrong!");
          Get.toNamed(Routes.loginPasswordRoute);
        }
      } catch (e) {
        Utils.toastMessage(e.toString());
        log("onOTPLogin => ${e.toString()}");
      }
      setIsLoading = false;
    }
  }

  Future onResendOTP() async {
    Map<String, String> data = {
      "mobile_number": getMobileController.text.trim(),
    };
    try {
      setIsLoading = true;
      Map<String, dynamic> response = await _authRepo.resendOTP(data);
      log(response.toString());
      if (response["code"] == 200) {
        getOTPController.text =
            "${response["otp"] ?? ""}"; // TODO: remove this line when mobile numbers start receiving the OTP
        Utils.toastMessage(response["msg"] ?? "OTP sent successfully!");
      } else {
        Utils.toastMessage("Something went wrong!");
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
      log("onResendOTP => ${e.toString()}");
    }
    setIsLoading = false;
  }
}

//---->>  Google map Screen  <-----//

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final GoogleMapViewModel _googleMapViewModel = Get.find();
  //final GoogleMapViewModel2 _googleMapViewModel2 = Get.find();

  AuthViewModel authViewModel = Get.find();

  // static const LatLng _pGooglePlex = LatLng(28.6407533, 76.3790116);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //_showBottomSheet();
    });
  }

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
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _googleMapViewModel.getInitialPosition,
                      zoom: 14.0,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId("_currentLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _googleMapViewModel.getInitialPosition,
                      ),
                      // Marker(
                      //   markerId: MarkerId("_sourceLocation"),
                      //   icon: BitmapDescriptor.defaultMarker,
                      //   position: _pGooglePlex
                      //   //_googleMapViewModel.getInitialPosition,
                      // ),
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _googleMapViewModel.setMapController = controller;
                    },
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SearchPage()));
                                },
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
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () => TextHeading(
                            title: authViewModel.getAddress,
                            fontweight: FontWeight.w400,
                            fontsize: 11.sp,
                            fontcolor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 50.h),
                        InkWell(
                          onTap: () {
                            Get.offAllNamed(Routes.bottomBarRoute);
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Container(
                  height: 50.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.search, color: AppColors.primaryColor),
                      TextHeading(
                        title: "Search Your favorite hair expert...",
                        fontweight: FontWeight.w400,
                        fontsize: 12.sp,
                        fontcolor: Colors.grey.shade200,
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
