import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naemen/Auth/login_page.dart';
import 'package:naemen/Components/text_heading.dart';
import 'package:naemen/Screens/home_page.dart';
import 'package:naemen/utils/color_constant.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _currentAddress = "Fetching location...";
  LatLng _currentPosition = LatLng(0, 0);
  late GoogleMapController _mapController;

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2004),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dobController.text =
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String location = 'Null, Press Button';
  String Address = 'search';

  Future<Position> _getGeoLocationPosition() async {
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

  Future<String> _getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sign up bg2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 80.h),
                    // Image.asset(
                    //   "assets/images/Namen Logo (1).png",
                    //   height: 136,
                    //   width: 136,
                    // ),
                    SizedBox(height: 15.h),
                    TextHeading(
                      title: "Sign up now",
                      fontweight: FontWeight.w700,
                      fontsize: 26.sp,
                      fontcolor: AppColors.primarycolor,
                    ),
                    SizedBox(height: 10.h),
                    TextHeading(
                      title: "Please sign up to continue our app",
                      fontweight: FontWeight.w400,
                      fontsize: 12.sp,
                      fontcolor: Colors.white,
                    ),
                    SizedBox(height: 100.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: _fullNameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              hintText: "Enter full name",
                              hintStyle:
                                  TextStyle(color: AppColors.SignupColor),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: _emailController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              hintText: "Enter email",
                              hintStyle:
                                  TextStyle(color: AppColors.SignupColor),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.8),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: _dobController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              hintText: "Enter date of birth",
                              hintStyle:
                                  TextStyle(color: AppColors.SignupColor),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.8),
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                            readOnly: true,
                            onTap: () => _selectDate(context),
                            keyboardType: TextInputType.datetime,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your date of birth';
                              }
                              if (!RegExp(r'^\d{2}/\d{2}/\d{4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid date (DD/MM/YYYY)';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: _passwordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              hintText: 'Create password',
                              hintStyle:
                                  TextStyle(color: AppColors.SignupColor),
                              suffixIcon: IconButton(
                                onPressed: _togglePasswordVisibility,
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.8),
                            ),
                            obscureText: _obscureText,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 85.h),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          try {
                            Position position = await _getGeoLocationPosition();
                            location =
                                'Lat: ${position.latitude} , Long: ${position.longitude}';
                            Address = await _getAddressFromLatLong(position);
                          } catch (e) {
                            print(e);
                          } finally {
                            Navigator.pop(
                                context); // Close the loading indicator
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  address: Address,
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        height: 40.h,
                        width: 340.w,
                        decoration: BoxDecoration(
                          color: AppColors.primarycolor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: TextHeading(
                            title: "Sign up",
                            fontweight: FontWeight.w600,
                            fontsize: 16.sp,
                            fontcolor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextHeading(
                          title: "Already have an account?",
                          fontweight: FontWeight.w400,
                          fontsize: 12.sp,
                          fontcolor: AppColors.SignupColor,
                        ),
                        SizedBox(width: 3.w),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: TextHeading(
                            title: "Sign in",
                            fontweight: FontWeight.w400,
                            fontsize: 12.sp,
                            fontcolor: AppColors.primarycolor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
