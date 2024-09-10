import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:naemen/view_models/artist_profile_view_model.dart';
import 'package:naemen/view_models/cart_view_model.dart';
import 'package:naemen/view_models/language_view_model.dart';

import 'package:naemen/utils/color_constant.dart';
import 'package:naemen/views/screens/user_profile.dart';

import '../components/text_heading.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    LanguageViewModel languageViewModel = Get.find();
    CartViewModel cartViewModel = Get.find();
    ArtistProfileViewModel artistProfileViewModel = Get.find();
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
              title: "Profile",
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
              InkWell(
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => UserProfilePage()));
                // },
                child: ListTile(
                  leading: Icon(
                    Icons.person_outline,
                    color: AppColors.primaryColor,
                  ),
                  title: TextHeading(
                      title: "My Profile",
                      fontweight: FontWeight.w400,
                      fontsize: 12,
                      fontcolor: Colors.white),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Divider(
                thickness: 0.1,
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: AppColors.primaryColor,
                ),
                title: TextHeading(
                    title: "My favorite",
                    fontweight: FontWeight.w400,
                    fontsize: 12,
                    fontcolor: Colors.white),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.primaryColor,
                ),
              ),
              Divider(
                thickness: 0.1,
              ),
              ListTile(
                  leading: Icon(
                    Icons.balance,
                    color: AppColors.primaryColor,
                  ),
                  title: TextHeading(
                      title: "Aviliable  Balance",
                      fontweight: FontWeight.w400,
                      fontsize: 12,
                      fontcolor: Colors.white),
                  trailing: TextHeading(
                      title: "120.00 SAR",
                      fontweight: FontWeight.w700,
                      fontsize: 16,
                      fontcolor: AppColors.primaryColor)),
              Divider(
                thickness: 0.1,
              ),
              ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: AppColors.primaryColor,
                ),
                title: TextHeading(
                    title: "Get Notification",
                    fontweight: FontWeight.w400,
                    fontsize: 12,
                    fontcolor: Colors.white),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.primaryColor,
                ),
              ),
              Divider(
                thickness: 0.1,
              ),
              ListTile(
                leading: Icon(
                  Icons.share,
                  color: AppColors.primaryColor,
                ),
                title: TextHeading(
                    title: "Refer and earn",
                    fontweight: FontWeight.w400,
                    fontsize: 12,
                    fontcolor: Colors.white),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.primaryColor,
                ),
              ),
              Divider(
                thickness: 0.1,
              ),
              ListTile(
                leading: Icon(
                  Icons.key,
                  color: AppColors.primaryColor,
                ),
                title: TextHeading(
                    title: "Change Password",
                    fontweight: FontWeight.w400,
                    fontsize: 12,
                    fontcolor: Colors.white),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.primaryColor,
                ),
              ),
              Divider(
                thickness: 0.1,
              ),
              ListTile(
                leading: Icon(
                  Icons.privacy_tip,
                  color: AppColors.primaryColor,
                ),
                title: TextHeading(
                    title: "Privacy Policy",
                    fontweight: FontWeight.w400,
                    fontsize: 12,
                    fontcolor: Colors.white),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.primaryColor,
                ),
              ),
              Divider(
                thickness: 0.1,
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: AppColors.primaryColor,
                ),
                title: TextHeading(
                    title: "About Us",
                    fontweight: FontWeight.w400,
                    fontsize: 12,
                    fontcolor: Colors.white),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.primaryColor,
                ),
              ),
              Divider(
                thickness: 0.1,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: AppColors.primaryColor,
                ),
                title: TextHeading(
                    title: "Logout",
                    fontweight: FontWeight.w400,
                    fontsize: 12,
                    fontcolor: Colors.white),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.primaryColor,
                ),
              ),
              Divider(
                thickness: 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
