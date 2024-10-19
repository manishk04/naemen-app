import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:naemen/utils/color_constant.dart';
import 'package:naemen/utils/image_constant.dart';

// ignore: must_be_immutable
class SearchBarWidget extends StatefulWidget {
  SearchBarWidget(
      {super.key, required this.hinttexttitle, this.enabled = false});

  final String hinttexttitle;
  final bool enabled;
  bool? focusOnTextField;
  IconData? suffixIcon;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.signUpColor, width: 0.5),
        color: AppColors.searchFieldsColor,
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: widget.focusOnTextField ?? false,
        decoration: InputDecoration(
          //contentPadding: EdgeInsets.all(12.0),
          enabled: widget.enabled,
          border: InputBorder.none,
          prefixIcon: Image.asset(ImageConstant.searchIcon),
          suffixIcon: const Icon(
            Icons.mic,
            color: AppColors.primaryColor,
          ),

          hintText: widget.hinttexttitle,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.signUpColor,
              fontSize: 12.sp,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
