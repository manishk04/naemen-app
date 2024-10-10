import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naemen/utils/color_constant.dart';
import 'package:naemen/views/components/text_heading.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 200,
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Email Button
          ListTile(
            leading: Icon(
              Icons.email,
              color: AppColors.primaryColor,
            ),
            title: TextHeading(
                title: "send emai",
                fontweight: FontWeight.w500,
                fontsize: 14.sp,
                fontcolor: AppColors.primaryColor),
            onTap: () async {
              print("Attempting to send email...");
              await _launchURL('shuklanitin2000@gmail.com');
            },
          ),
          // Call Button
          ListTile(
            leading: Icon(
              Icons.call,
              color: AppColors.primaryColor,
            ),
            title: TextHeading(
                title: "Make Call",
                fontweight: FontWeight.w500,
                fontsize: 14.sp,
                fontcolor: AppColors.primaryColor),
            onTap: () async {
              print("Attempting to make a call...");
              await _launchURL('tel:8953092693');
            },
          ),
          // SMS Button
          ListTile(
            leading: Icon(
              Icons.message,
              color: AppColors.primaryColor,
            ),
            title: TextHeading(
                title: "send Message",
                fontweight: FontWeight.w500,
                fontsize: 14.sp,
                fontcolor: AppColors.primaryColor),
            onTap: () async {
              print("Attempting to send SMS...");
              await _launchURL('sms:8953092693');
            },
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    print("URL to launch: $url");
    if (await canLaunch(url)) {
      print("Launching URL: $url");
      await launch(url);
    } else {
      print('Could not launch $url');
      throw 'Could not launch $url';
    }
  }
}
