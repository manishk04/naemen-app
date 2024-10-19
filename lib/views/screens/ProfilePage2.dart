import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naemen/utils/color_constant.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/text_heading.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  File? _image; // To store the selected image
  final ImagePicker _picker = ImagePicker();
  bool _isPickingImage = false; // Flag to prevent multiple image picker calls

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  // Load saved image path from SharedPreferences
  Future<void> _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profile_image');
    if (imagePath != null && File(imagePath).existsSync()) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  // Save image path to SharedPreferences
  Future<void> _saveImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profile_image', path);
  }

  Future<void> _pickImage() async {
    if (_isPickingImage) return; // Prevent multiple image picker calls
    setState(() {
      _isPickingImage = true;
    });

    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _image = File(
              pickedImage.path); // Convert XFile to File and store in _image
        });
        _saveImage(pickedImage.path); // Save image path to SharedPreferences
      }
    } catch (e) {
      print("Image picker error: $e");
    } finally {
      setState(() {
        _isPickingImage = false; // Reset flag when the picker is done
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: TextHeading(
              title: "MD Arshaloan Profile",
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    _pickImage();
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: _image != null
                              ? DecorationImage(
                                  image: FileImage(_image!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          color: _image == null ? Colors.amber : null,
                        ),
                        child: _image == null
                            ? const Icon(Icons.camera_alt, color: Colors.white)
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 100.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    color: AppColors.searchFieldsColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Icon(
                        Icons.wallet,
                        color: AppColors.primaryColor,
                      ),
                      TextHeading(
                          title: "120.00 SAR",
                          fontweight: FontWeight.w700,
                          fontsize: 16.sp,
                          fontcolor: AppColors.primaryColor),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextHeading(
                          title: "Available Balance",
                          fontweight: FontWeight.w500,
                          fontsize: 12.sp,
                          fontcolor: Colors.white)
                    ],
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.person_outline,
                    color: AppColors.primaryColor,
                  ),
                  title: TextHeading(
                      title: "MD Arshloan",
                      fontweight: FontWeight.w400,
                      fontsize: 12,
                      fontcolor: Colors.white),
                  trailing: Icon(
                    Icons.edit,
                    size: 15,
                    color: AppColors.primaryColor,
                  ),
                ),
                const Divider(thickness: 0.1),
                const ListTile(
                  leading: Icon(
                    Icons.email,
                    color: AppColors.primaryColor,
                  ),
                  title: TextHeading(
                      title: "navab123@gmail.com",
                      fontweight: FontWeight.w400,
                      fontsize: 12,
                      fontcolor: Colors.white),
                ),
                const Divider(thickness: 0.1),
                const ListTile(
                  leading: Icon(
                    Icons.male,
                    color: AppColors.primaryColor,
                  ),
                  title: TextHeading(
                      title: "Male",
                      fontweight: FontWeight.w400,
                      fontsize: 12,
                      fontcolor: Colors.white),
                ),
                const Divider(thickness: 0.1),
                const ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: AppColors.primaryColor,
                  ),
                  title: TextHeading(
                      title: "2/837,vivek khand2, lucknow 226010",
                      fontweight: FontWeight.w400,
                      fontsize: 12,
                      fontcolor: Colors.white),
                ),
                const Divider(thickness: 0.1),
                const ListTile(
                  leading: Icon(
                    Icons.privacy_tip,
                    color: AppColors.primaryColor,
                  ),
                  title: TextHeading(
                      title: "Privacy Policy",
                      fontweight: FontWeight.w400,
                      fontsize: 12,
                      fontcolor: Colors.white),
                ),
                const Divider(thickness: 0.1),
                const ListTile(
                  leading: Icon(
                    Icons.info,
                    color: AppColors.primaryColor,
                  ),
                  title: TextHeading(
                      title: "About Us",
                      fontweight: FontWeight.w400,
                      fontsize: 12,
                      fontcolor: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
