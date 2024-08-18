import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naemen/view_models/language_view_model.dart';

import '../models/customer_model.dart';
import '../repo/auth_repo.dart';
import '../routes/app_routes.dart';
import '../utils/color_constant.dart';
import '../utils/storage_data.dart';
import '../utils/utils.dart';

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
  onAppOpen(LanguageViewModel languageViewModel) async {
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
          fetchLocation();
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

  void onSignUp() async {
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
        fetchLocation();
      } else {
        Utils.toastMessage(response["msg"] ?? "Something went wrong!");
      }
    }
  }

  fetchLocation() async {
    Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: AppColors.primarycolor,
          ),
        ),
      ),
      isDismissible: false,
    );
    try {
      Position position = await getGeoLocationPosition();
      setLocation = 'Lat: ${position.latitude} , Long: ${position.longitude}';
      setAddress = await getAddressFromLatLong(position);
      StorageData.setLatitude(position.latitude.toString());
      StorageData.setLongitude(position.longitude.toString());
      StorageData.setAddress(getAddress);
      Get.back();
      Get.offAllNamed(Routes.bottomBarRoute);
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

  Future onPasswordLogin() async {
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
          fetchLocation();
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

  Future onOTPLogin() async {
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
          fetchLocation();
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
